import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';
import '../search_page.dart';
import '../../../../core/util/globals.dart';

class SearchBar extends StatefulWidget {
  final bool isOnRestaurantSearchPage;

  const SearchBar({super.key, required this.isOnRestaurantSearchPage});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = new TextEditingController();

  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode2 = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    waitfocus();
    print('Search INIT');
  }

  Future<void> waitfocus() async {
    await Future.delayed(Duration(milliseconds: 500));

    if (widget.isOnRestaurantSearchPage) {
      focusNode2.requestFocus();
    }
  }

  @override
  void dispose() {
    focusNode2.unfocus();
    focusNode2.dispose();
    super.dispose();

    print('Search DISPOSE');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(primary),
      child: Padding(
        padding: EdgeInsets.all(padding * 2),
        child: InkWell(
          onTap: () {
            print(widget.isOnRestaurantSearchPage);
            if (widget.isOnRestaurantSearchPage == false) {
              moveToPlan();
            }
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return TextField(
                enabled: widget.isOnRestaurantSearchPage,
                focusNode: widget.isOnRestaurantSearchPage == false
                    ? NoFocus()
                    : focusNode2,
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
                      Icons.search,
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

  void moveToPlan() {
    if (widget.isOnRestaurantSearchPage == false) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SearchPage()));
    }
  }
}

class NoFocus extends FocusNode {
  @override
  bool get hasFocus {
    return false;
  }
}
