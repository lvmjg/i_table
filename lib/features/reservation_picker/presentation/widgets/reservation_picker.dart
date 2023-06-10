import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/globals.dart';
import '../../../search/presentation/bloc/search_bloc.dart';

class ReservationPicker extends StatefulWidget {
  const ReservationPicker({super.key});

  @override
  State<ReservationPicker> createState() => _ReservationPickerState();
}

class _ReservationPickerState extends State<ReservationPicker> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(primary),
      child: Padding(
          padding: EdgeInsets.all(padding / 4),
          child: InkWell(
            onTap: (){},
            child: Ink(

              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(200)
                ),

                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_left_rounded, size: 30))),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            '13/06/2023',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right_rounded,
                              size: 30,
                            )))

                    /*
                    ElevatedButton(
                        controller: controller,
                        textAlign: TextAlign.center,
                        onChanged: (text) {
                          context.read<SearchBloc>().add(SearchInputProvided(input: text));
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                          //    gapPadding: 10,
                              borderSide: BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                            ),
                            hintText: searchBarHint,
                            suffixIcon: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.search_rounded,
                                color: Color(primary),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 8,
                                color: Colors.grey, fontWeight: FontWeight.w300)),
                        style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                      ),*/
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
