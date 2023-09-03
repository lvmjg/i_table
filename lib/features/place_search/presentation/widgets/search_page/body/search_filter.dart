import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/place_search_bloc.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key, required this.color});

  final Color color;

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
          builder: (context, state) {
            bool searchTextFieldEnabled = state is PlaceSearchFetchSuccess;
            bool inputProvided = controller.text.isNotEmpty;
            IconData textFieldIcon =
                (state is PlaceSearchFetchSuccess && inputProvided)
                    ? Icons.clear_rounded
                    : Icons.search;

            return Container(
              decoration: BoxDecoration(
                color: Colors.red,
                  boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 5)],
                  borderRadius: const BorderRadius.all(Radius.circular(100))),

              child: TextField(
                controller: controller,
                enabled: searchTextFieldEnabled,
                textAlign: TextAlign.center,
                onChanged: (text) {
                  context
                      .read<PlaceSearchBloc>()
                      .add(PlaceSearchInputProvided(input: text));
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 10,
                      borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(200))
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 10,
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(padding))
                    ),
                    hintText: searchBarHint,
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (inputProvided) {
                          controller.clear();
                          context
                              .read<PlaceSearchBloc>()
                              .add(PlaceSearchInputProvided(input: ''));
                        }
                      },
                      icon: Icon(
                        textFieldIcon,
                        color: Color(primary),
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300)),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            );
          },
        ),
      ),
    );
  }
}
