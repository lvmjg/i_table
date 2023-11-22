import 'package:i_table/features/place_menu/data/model/place_menu_model.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu_category.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu_item.dart';

class PlaceMenuFactory {
  PlaceMenu getPlaceMenu(PlaceMenuModel placeMenuModel) {
    List<PlaceMenuCategory> placeMenuCategories = [];
    placeMenuModel.placeMenu.entries.forEach((entry) {
      String entryCategory = entry.value.category;

      PlaceMenuCategory existingCategory;
      try {
        existingCategory = placeMenuCategories
            .singleWhere((element) => element.name == entryCategory);
      } on StateError {
        existingCategory = PlaceMenuCategory(name: entryCategory, items: []);
        placeMenuCategories.add(existingCategory);
      }

      existingCategory.items.add(PlaceMenuItem(
          id: entry.key,
          category: entryCategory,
          name: entry.value.name,
          description: entry.value.description,
          price: entry.value.price,
          url: entry.value.url));
    });

    return PlaceMenu(placeMenuCategories: placeMenuCategories);
  }
}
