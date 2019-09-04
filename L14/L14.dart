import 'dart:convert';
void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<String, dynamic>> menuList = 
// [
//   {"id": 0, "menuName": "O", "parentId": '#'},
//   {"id": 1, "menuName": "A", "parentId": 0},
//   {"id": 2, "menuName": "AB", "parentId": 1},
//   {"id": 3, "menuName": "ABC", "parentId": 2},
//   {"id": 4, "menuName": "ABCD", "parentId": 3},
//   {"id": 5, "menuName": "AE", "parentId": 1},
//   {"id": 6, "menuName": "AF", "parentId": 1},
//   {"id": 7, "menuName": "G", "parentId": 0},
//   {"id": 8, "menuName": "H", "parentId": 0},
// ];

[
  { "id": 0, "menuName": "Root", "parentId": "#" },
  { "id": 1, "menuName": "A", "parentId": 0 },
  { "id": 2, "menuName": "B", "parentId": 0 },
  { "id": 3, "menuName": "C", "parentId": 5 },
  { "id": 4, "menuName": "D", "parentId": 5 },
  { "id": 5, "menuName": "E", "parentId": 0 },
  { "id": 6, "menuName": "F", "parentId": 5 },
  { "id": 7, "menuName": "G", "parentId": 1 },
  { "id": 8, "menuName": "H", "parentId": 1 },
  { "id": 9, "menuName": "I", "parentId": 6 },
  { "id": 10, "menuName": "J", "parentId": 6 },
  { "id": 11, "menuName": "K", "parentId": 3 },
  { "id": 12, "menuName": "L", "parentId": 3 },
  { "id": 13, "menuName": "M", "parentId": 3 },
  { "id": 14, "menuName": "N", "parentId": 12 },
  { "id": 15, "menuName": "O", "parentId": 12 },
  { "id": 16, "menuName": "P", "parentId": 18 },
  { "id": 17, "menuName": "Q", "parentId": 18 },
  { "id": 18, "menuName": "R", "parentId": 10 },
  { "id": 19, "menuName": "S", "parentId": 10 },
  { "id": 20, "menuName": "T", "parentId": 10 },
  //{ "id": 10, "menuName": "T", "parentId": 20 },
];

Map<String, List<int>> buildGroup() {
  Map<String, List<int>> parentIdGroups = {};
  for (int i = 0; i < menuList.length; i++) {
    String key = menuList[i]["parentId"].toString();
    if (!parentIdGroups.containsKey(key)) parentIdGroups[key] = [];
    parentIdGroups.update(key, (e) {
      e.add(menuList[i]["id"]);
      return e;
    });
  }
  //printJson(parentIdGroups);
  return parentIdGroups;
}
bool isValidMenuList(Map<String, List<int>> parentGroups, int menuCount){
  List childMenuIds = [];
  parentGroups.forEach((parentId, childIds){
    childMenuIds.add(childIds);
  });
  //print(childMenuIds);
  childMenuIds = childMenuIds.expand((menuId) => menuId).toList().toSet().toList();
  //print(childMenuIds);
  
  print('menuList.length = $menuCount');
  //print('parentMenuIds.length = ${parentGroups.length}');
  print('childMenuIds.length = ${childMenuIds.length}');

  bool isValidTreeMenu = menuCount == childMenuIds.length;
  //print(isValidTreeMenu);
  print(isValidTreeMenu ? 'Menu is valid': 'Menu is invalid');
  return isValidTreeMenu;
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
dynamic buildTree(Map<String, Map<String, dynamic>> menuMap,Map<String, List<int>> parentIdGroups, String parentIdRoot) {
  List currentParentIdGroup = parentIdGroups[parentIdRoot];
  if (currentParentIdGroup == null) currentParentIdGroup = [];
  return currentParentIdGroup.asMap().map((menuIdIndex, menuId) {
    var menuItem = menuMap[menuId.toString()];
    String parentIdNext = parentIdGroups[parentIdRoot][menuIdIndex].toString();
    dynamic childrenMenuItem = buildTree(menuMap, parentIdGroups, parentIdNext);
    //print(childrenMenuItem.runtimeType.toString());
    if (childrenMenuItem.length > 0) {
      print(childrenMenuItem);
      menuItem["children"] = childrenMenuItem.values.toList();
    }
    return MapEntry(menuIdIndex, menuItem);
  });
}

void main() {
  Map<String, List<int>> parentIdGroups = buildGroup();
  //printJson(parentIdGroups);
  Map<String, Map<String, dynamic>> menuMap = convertListMenuToMapMenu();
  // print(menuMap);
  if(isValidMenuList(parentIdGroups, menuList.length)){
    var tree = buildTree(menuMap, parentIdGroups, '#');
    print('----- Final Tree ------');
    printJson(tree.values.toList());
    // print(tree.runtimeType.toString());
    // print(tree.values.runtimeType.toString());
    // print(tree.values.toList().runtimeType.toString());
    // print(tree.values.toList().toString().runtimeType.toString());
  }
}
