import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/reservation_card_basic_details.dart';
import 'package:i_table/core/widget/reservation_card_sittings.dart';
import 'package:i_table/core/widget/simple_button.dart';
import 'package:i_table/features/user_reservations/presentation/widget/reservation_details_page.dart';

import '../../../../core/util/globals.dart';
import '../../../../core/widget/reservation_card_billing.dart';
import '../bloc/user_reservations_bloc.dart';

class UserReservationsPage extends StatefulWidget {
  UserReservationsPage({Key? key}) : super(key: key);

  @override
  State<UserReservationsPage> createState() => _UserReservationsPageState();
}

class _UserReservationsPageState extends State<UserReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('test'),
      ),
      body: BlocBuilder<UserReservationsBloc, UserReservationsState>(
        builder: (context, state) {
          if (state is UserReservationsFetchSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.userReservations.length +2,
                      itemBuilder: (context, index) {

                        return InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReservationDetailsPage(index: index,),
                            ));
                          },
                          child: Hero(
                            tag: 'item$index',
                              child: ReservationCardBasicDetails()
                          ),
                        );
                      }),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<UserReservationsBloc>().add(UserReservationsInitiated(userId: loggedUserId));
  }
}
