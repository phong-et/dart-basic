import 'dart:convert';
void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<String, dynamic>> tableMenus = [
  {"id": 1, "menuName": "A", "parentId": null},
  {"id": 2, "menuName": "AB", "parentId": 1},
  {"id": 3, "menuName": "ABC", "parentId": 2},
  {"id": 4, "menuName": "ABCD", "parentId": 3},
  {"id": 5, "menuName": "AE", "parentId": 1},
  {"id": 6, "menuName": "AF", "parentId": 1},
  {"id": 7, "menuName": "G", "parentId": null},
  {"id": 8, "menuName": "H", "parentId": null},
];

int level = 0;
Map<int, List<int>> matrixLevelMenuIds = {};
// 
List<Map<int,List<int>>> matrixLinkedMenuId = [];
List<Map<String, dynamic>> treeMenu = [];
int findMenuById(menuId){
  for(int i = 0; i < tableMenus.length; i++)
    if(tableMenus[i]["id"] == menuId)
      return i;
    return -1;
}
dynamic node = ""; 
void appendChild(int level, List<int> rootIds, Map<String, dynamic> menuItem){
  node = treeMenu[rootIds[level]];
  if(level == rootIds.length -1)
    node["children"].add(menuItem);  
  else
    appendChild(level++, rootIds, menuItem);
}
void convertToNestedJson() {
  //while (tableMenus.length > 0) {
    for(int i = 0 ; i < tableMenus.length; i++){
      if(tableMenus[i]["parentId"] == null && level == 0){
        treeMenu.add(tableMenus[i]);
        if(matrixLevelMenuIds[level] == null)
          matrixLevelMenuIds[level] = [];
        matrixLevelMenuIds[level].add(tableMenus[i]["id"]);
        tableMenus.removeAt(i);
        i--;
      }else if(level ==1){
        if(matrixLevelMenuIds[level].indexOf(tableMenus[i]["id"]) >= 0){
          
        }
      }
      level++;
    //}
  }
}
void main() {
  convertToNestedJson();
  printJson(treeMenu);
  printJson(tableMenus);
  print(matrixLevelMenuIds);
  // matrixLevelMenuIds = {
  //   0:[1,2,3]
  // };
  // matrixLevelMenuIds[0] = [1,2,3];
  // matrixLevelMenuIds[0].add(tableMenus[0]["id"]);
  // print(matrixLevelMenuIds);
  // treeMenu.add(tableMenus[0]);
  // print(tableMenus[0]);

  List<Map<String, dynamic>> rawJson = [
    {"id": 1, "menuName": "A", "parentId": null},
    {"id": 2, "menuName": "AB", "parentId": 1},
    {"id": 3, "menuName": "ABC", "parentId": 2},
    {"id": 4, "menuName": "ABCD", "parentId": 3},
    {"id": 5, "menuName": "AE", "parentId": 1},
    {"id": 6, "menuName": "AF", "parentId": 1},
    {"id": 7, "menuName": "G", "parentId": null},
    {"id": 8, "menuName": "H", "parentId": null},
  ];
  List<Map<String, dynamic>> nestedJson = [
    {
      "id": 1,
      "menuName": "A",
      "children": [
        {
          "id": 2,
          "menuName": "AB",
          "children": [
            {
              "id": 3,
              "menuName": "ABC",
              "children": [
                {
                  "id": 4,
                  "menuName": "ABCD",
                }
              ]
            }
          ]
        },
        {
          "id": 5,
          "menuName": "AE",
        },
        {
          "id": 6,
          "menuName": "AF",
        }
      ]
    },
    {
      "id": 7,
      "menuName": "G",
    },
    {
      "id": 8,
      "menuName": "H",
    }
  ];
  //printJson(nestedJson);

  //print(nestedJson.indexWhere(test));
}
