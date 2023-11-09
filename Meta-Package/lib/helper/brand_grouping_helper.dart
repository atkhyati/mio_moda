import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../api/models/brand_list/brand_model.dart';

class BrandGroupingHelper {
  BrandGroupingHelper();

  List<String> keys = [];

  Future<HashMap<String, List<BrandModel>>> getBrandGroupList(
      List<BrandModel> data) async {
    HashMap<String, List<BrandModel>> groupList = HashMap();
    RegExp numRegEx = RegExp(r'[0-9]');
    RegExp alphaRegEx = RegExp(r'[a-z]');
    List<String> alphaSet = [];
    List<String> numSet = [];
    List<String> specSet = [];

    data.sort((a, b) => a.name.trimLeft().compareTo(b.name.trimLeft()));
    debugPrint("data after sort ${data.length}");

    // loop to get unique key
    await Future.forEach(data, (BrandModel element) {
      var name = element.name.trimLeft().toLowerCase();
      if (name.startsWith(alphaRegEx)) {
        alphaSet.add(name[0].toUpperCase());
      } else if (name.startsWith(numRegEx)) {
        numSet.add(name[0]);
      } else {
        specSet.add(name[0]);
      }
    });

    keys.clear();
    alphaSet = alphaSet.toSet().toList();
    alphaSet.sort((a, b) => a.compareTo(b));
    keys.addAll(alphaSet);
    keys.addAll(numSet.toSet());
    keys.add('#');

    // loop to add alphabet and number list in sorting order
    await Future.forEach(keys, (String element) {
      if (element != '#') {
        groupList[element] = data
            .where((brand) => brand.name
                .trimLeft()
                .toLowerCase()
                .startsWith(element.toLowerCase()))
            .toList();
      }
    });

    groupList['#'] = [];
    // list to separate the special character
    await Future.forEach(specSet.toSet(), (String element) {
      groupList['#']?.addAll(data
          .where((brand) => brand.name.trimLeft().startsWith(element))
          .toList());
    });

    return groupList;
  }
}
