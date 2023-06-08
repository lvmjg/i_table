import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/search/presentation/widgets/search_body.dart';
import 'bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchBody(),
      )
    );

  }

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchInit());
  }
}

