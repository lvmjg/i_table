import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/place_entry/presentation/bloc/place_entry_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/reservation_picker_data.dart';
import '../../domain/usecase/reservation_picker_data_manager.dart';

part 'reservation_picker_event.dart';
part 'reservation_picker_state.dart';

class ReservationPickerBloc extends Bloc<ReservationPickerEvent, ReservationPickerState> {
  late StreamSubscription<PlaceEntryState> subscription;
  late ReservationPickerDataManager manager;

  ReservationPickerBloc({required PlaceEntryBloc placeEntryBloc}) : super(ReservationPickerInitial()) {
    monitorEntryBlock(placeEntryBloc);

    on<ReservationPickerDateDecreased>((event, emit) {
      manager.decreaseDate();
      emit(ReservationPickerChange(data: manager.data));
    });
    on<ReservationPickerDateIncreased>((event, emit) {
      manager.increaseDate();
      emit(ReservationPickerChange(data: manager.data));
    });
    on<ReservationPickerDateSet>((event, emit) {
      manager.setDate(event.reservationDate);
      emit(ReservationPickerChange(data: manager.data));
    });

    on<ReservationPickerTimeDecreased>((event, emit) {
      manager.decreaseTime();
      emit(ReservationPickerChange(data: manager.data));
    });
    on<ReservationPickerTimeIncreased>((event, emit) {
      manager.increaseTime();
      emit(ReservationPickerChange(data: manager.data));
    });
    on<ReservationPickerTimeSet>((event, emit) {
      manager.setTime(event.reservationTime);
      emit(ReservationPickerChange(data: manager.data));
    });

    on<ReservationPickerDurationSet>((event, emit) {
      manager.setDuration(event.reservationDuration);
      emit(ReservationPickerChange(data: manager.data));
    });
  }

  void monitorEntryBlock(PlaceEntryBloc placeEntryBloc) {
    subscription = placeEntryBloc.stream.listen((state) {
      if(state is PlaceEntryFetchSuccess){
        manager = ReservationPickerDataManager(state.placeSettings);
        emit(ReservationPickerChange(data: manager.data));
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
