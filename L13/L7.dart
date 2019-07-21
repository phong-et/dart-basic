import 'dart:convert';
void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<dynamic, dynamic>> menuList = [
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
Map<dynamic, List<int>> buildGroup() {
  Map<dynamic, List<int>> parentIdGroups = {};
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

Map<dynamic, Map<dynamic, dynamic>> convertListMenuToMapMenu() {
  Map<dynamic, Map<dynamic, dynamic>> menuMap = {};
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

bool isList(dynamic obj) {
  return obj is List;
}

List<dynamic> tree = [];
dynamic currentNode;
void buildTree(Map<dynamic, Map<dynamic, dynamic>> menuMap,
    Map<dynamic, List<int>> parentIdGroups, dynamic parentIdRoot) {
  var childMenuIds = parentIdGroups[parentIdRoot.toString()];
  if(currentNode == null)
    currentNode = [];
  //currentNode.add(menuMap[parentIdRoot]);
  if (childMenuIds is List) {
    for (int i = 0; i < childMenuIds.length; i++) {
      var currentMenuItem = menuMap[childMenuIds[i].toString()];
      currentNode.add(currentMenuItem);
      var nextChildMenuIds = parentIdGroups[childMenuIds[i].toString()];
      if (nextChildMenuIds is List) {
        currentMenuItem["children"] = [];
        currentNode = currentMenuItem['children'];
        for (int j = 0; j < nextChildMenuIds.length; j++)
          buildTree(menuMap, parentIdGroups, nextChildMenuIds[j].toString());
      }
      else{
        currentNode.add(menuMap[nextChildMenuIds.toString()]);
        //buildTree(menuMap, parentIdGroups, parentIdGroups[childMenuIds]);
      }
    }
  }
  // else{
  //   currentNode.add(menuMap[parentIdGroups[parentIdRoot.toString()]]);
  //   buildTree(menuMap, parentIdGroups, parentIdGroups[childMenuIds]);
  // }
}

void main() {
  Map<dynamic, List<int>> parentIdGroupss = buildGroup();
  print(parentIdGroupss);
  // for (int i = 0; i < parentIdGroupss.length; i++) {
  //   print(parentIdGroupss[i.toString()]);
  // }
  //print(parentIdGroupss.values);
  Map<dynamic, Map<dynamic, dynamic>> menuMap = convertListMenuToMapMenu();
  printJson(menuMap);
  buildTree(menuMap, parentIdGroupss, '#');
  printJson(tree);
}
