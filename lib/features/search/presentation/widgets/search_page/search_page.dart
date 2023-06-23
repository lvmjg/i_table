import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/globals.dart';
import '../../bloc/search_bloc.dart';
import 'appbar/search_appbar.dart';
import 'appbar/user_reservations.dart';
import 'body/search_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(primary),
      appBar: SearchAppBar(),
      body: SearchBody(),
      drawer: UserReservations(),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchInit());
  }
}
