import 'dart:convert';

void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<String, dynamic>> menuList = [
  {"id": 0, "menuName": "O", "parentId": '#'},
  {"id": 1, "menuName": "A", "parentId": 0},
  {"id": 2, "menuName": "AB", "parentId": 1},
  {"id": 3, "menuName": "ABC", "parentId": 2},
  {"id": 4, "menuName": "ABCD", "parentId": 3},
  {"id": 5, "menuName": "AE", "parentId": 1},
  {"id": 6, "menuName": "AF", "parentId": 1},
  {"id": 7, "menuName": "G", "parentId": 0},
  {"id": 8, "menuName": "H", "parentId": 0},
];
Map<String, List<int>> buildGroup() {
  Map<String, List<int>> parentIdGroup = {};
  for (int i = 0; i < menuList.length; i++) {
    String key = menuList[i]["parentId"].toString();
    if (!parentIdGroup.containsKey(key)) parentIdGroup[key] = [];
    parentIdGroup.update(key, (e) {
      e.add(menuList[i]["id"]);
      return e;
    });
  }
  //printJson(parentIdGroup);
  return parentIdGroup;
}

Map<String, Map<String, dynamic>> convertListMenuToMapMenu() {
  Map<String, Map<String, dynamic>> menuMap = {};
  for (int i = 0; i < menuList.length; i++) {
    String key = menuList[i]["id"].toString();
    if (!menuMap.containsKey(key)) menuMap[key] = {};
    menuMap.update(key, (e) {
      menuList[i].remove('parentId');
      return menuList[i];
    });
  }
  return menuMap;
}

List<dynamic> tree;
dynamic node;
dynamic buildTree(Map<String, Map<String, dynamic>> menuMap,
    Map<String, List<int>> parentIdGroup, dynamic parentIdRoot) {
  dynamic node = parentIdGroup.containsKey(parentIdRoot)
      ? parentIdGroup[parentIdRoot]
      : [];
  for (int i = 0; i < node.length; i++) {
    
    dynamic keys = parentIdGroup[parentIdRoot][i];
    dynamic children;
    if (keys is List) {
      children = keys.map((key) {
        key = key.toString();
        return buildTree(menuMap, parentIdGroup, key);
      });
    } else
      children = buildTree(menuMap, parentIdGroup, keys);
      if (children is List) {
        node["children"] = children;

      tree.add(menuMap[node[i]]);
    }
  }

  // return().asMap().forEach((index,menuId){
  //   menuId = menuId.toString();
  //   dynamic menuMapItem = menuMap[menuId];
  //   dynamic keys = parentIdGroup[parentIdRoot][index];
  //   var children = keys is List ?
  //     keys.map((key) {
  //       key = key.toString();
  //       return buildTree(menuMap, parentIdGroup, key);
  //     }) :
  //     buildTree(menuMap, parentIdGroup, keys);
  //     print(children);
  //   if (children is Map && children.containsKey('children')) {
  //     menuMapItem["children"] = children;
  //   }
  //   return menuMapItem;
  // });
}

void main() {
  Map<String, List<int>> parentIdGroup = buildGroup();
  print(parentIdGroup);
  Map<String, Map<String, dynamic>> menuMap = convertListMenuToMapMenu();
  printJson(menuMap);
  dynamic tree = buildTree(menuMap, parentIdGroup, '#');
  printJson(tree);
}
