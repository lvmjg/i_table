import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search_bloc.dart';
import '../../search_page.dart';
import '../../../../../core/util/globals.dart';

class SearchRestaurant extends StatefulWidget {
  const SearchRestaurant({super.key});

  @override
  State<SearchRestaurant> createState() => _SearchRestaurantState();
}

class _SearchRestaurantState extends State<SearchRestaurant> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(primary),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            bool searchTextFieldEnabled = state is SearchFetchSuccess;
            bool inputProvided = controller.text.isNotEmpty;
            IconData textFieldIcon =
                (state is SearchFetchSuccess && inputProvided)
                    ? Icons.clear_rounded
                    : Icons.search;

            return TextField(
              controller: controller,
              enabled: searchTextFieldEnabled,
              textAlign: TextAlign.center,
              onChanged: (text) {
                context
                    .read<SearchBloc>()
                    .add(SearchInputProvided(input: text));
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(200.0)),
                  ),
                  hintText: searchBarHint,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (inputProvided) {
                        controller.clear();
                        context
                            .read<SearchBloc>()
                            .add(SearchInputProvided(input: ''));
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
            );
          },
        ),
      ),
    );
  }
}
