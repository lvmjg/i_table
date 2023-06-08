import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';
import '../search_page.dart';
import '../../../../core/util/globals.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(primary),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              bool searchEnabled = state is SearchFetchSuccess;
              IconData searchIcon = (state is SearchFetchSuccess && controller.text.isNotEmpty) ?  Icons.clear_rounded : Icons.search;

              return TextField(
                enabled: false,
                textAlign: TextAlign.center,
                onChanged: (text) {
                  context.read<SearchBloc>().add(SearchInputProvided(input: text));
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
                    suffixIcon: InkWell(
                        //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantSearchPage())),
                        child: Icon(
                        searchIcon,
                      color: Color(primary),
                    )),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300)),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              );
            },
          ),
        ),
      ),
    );
  }

}

setVisibilityBasedOnState(SearchState state) {
  return true;
  if(state is SearchFetchInProgress){
    return true;
  } else {
    return false;
  }
}
