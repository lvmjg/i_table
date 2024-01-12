import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_search/presentation/widget/search_page/body/place_details_sheet.dart';
import '../../features/place_search/domain/entity/place_search.dart';
import '../util/globals.dart';
import '../util/url_manager.dart';

class SearchCard extends StatelessWidget {
  final PlaceSearch placeSearch;
  final VoidCallback? onPressed;
  final double imageSize;

  SearchCard(
      {Key? key,
      required this.placeSearch,
      this.onPressed,
      required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: onPressed,
        outerPadding: padding / 8,
        innerPadding: padding / 3,
        child: Column(
          children: [
            Row(
              children: [
                Column(children: [
                  CommonCard(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    child: Visibility(
                      //  visible: placeMenuItem.url != null,
                      child: SizedBox(
                        width: imageSize,
                        height: imageSize,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.network(placeSearch.imageUrl ?? StringUtil.EMPTY),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(width: padding / 2),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                launch(placeSearch.placeLocation);
                              }, icon: Icon(
                                Icons.place_rounded,
                                color: Colors.redAccent,
                              )),
                              SizedBox(width: padding/8),
                              IconButton(onPressed: (){
                                launch(placeSearch.placeUrl);
                              }, icon: Icon(
                                Icons.language_rounded,
                                color: Colors.blueGrey,
                              )),
                              SizedBox(width: padding/8),
                              IconButton(onPressed: (){

                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: primaryColor,
                                    builder: (context) {
                                  return PlaceDetailsSheet(placeSearch: placeSearch);
                                });

                              }, icon: Icon(
                                Icons.info_rounded,
                                color: Colors.indigo,
                              )),
                            ],
                      ),
                      Text(placeSearch.placeName,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: padding / 2),
                      Text(placeSearch.placeAddress,
                          style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(height: padding / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: SimpleFilledTonalButton(
                                title: menuOnsite,
                                iconData: Icons.restaurant_rounded,
                                iconColor: Colors.blueGrey,
                                iconSize: 15,
                                onPressed: () {
                                  GoRouter.of(context).goNamed('reservation', pathParameters: {'placeId' : placeSearch.placeId});
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: padding/4),
                          Expanded(
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: SimpleFilledTonalButton(
                                  title: menuTakeaway,
                                  iconData: Icons.home_rounded,
                                  iconColor: Colors.blueGrey,
                                  iconSize: 15,
                                  onPressed: () {
                                    GoRouter.of(context).goNamed('placeMenu', pathParameters: {'placeId' : placeSearch.placeId, 'placeName' : placeSearch.placeName});
                                  },
                                )),
                          ),
                        ],
                      )
                    ])),
              ],
            ),
          ],
        ));
  }
}
