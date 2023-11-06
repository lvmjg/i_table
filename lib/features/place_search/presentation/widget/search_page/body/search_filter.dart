import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/text_field_extended.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/place_search_bloc.dart';

class SearchFilter extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
        builder: (context, state) {
      bool searchTextFieldEnabled = state is PlaceSearchFetchSuccess;

      bool inputProvided = controller.text.isNotEmpty;

      IconData textFieldIcon = (searchTextFieldEnabled && inputProvided)
          ? Icons.clear_rounded
          : Icons.search;

      return TextFieldExtended(
        hintText: searchBarHint,
        icon: textFieldIcon,
        enabled: searchTextFieldEnabled,
        onTextChanged: (text) {
          context
              .read<PlaceSearchBloc>()
              .add(PlaceSearchInputProvided(input: text));
        },
        onIconPressed: () {
          if (inputProvided) {
            controller.clear();
            context
                .read<PlaceSearchBloc>()
                .add(PlaceSearchInputProvided(input: ''));
          }
        },
        controller: controller,
      );
    });
  }
}
