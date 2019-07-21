import 'dart:convert';
void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<String, dynamic>> menu = [
  {"id": 0, "menuName": "O", "parentId": null},
  {"id": 1, "menuName": "A", "parentId": 0},
  {"id": 2, "menuName": "AB", "parentId": 1},
  {"id": 3, "menuName": "ABC", "parentId": 2},
  {"id": 4, "menuName": "ABCD", "parentId": 3},
  {"id": 5, "menuName": "AE", "parentId": 1},
  {"id": 6, "menuName": "AF", "parentId": 1},
  {"id": 7, "menuName": "G", "parentId": 0},
  {"id": 8, "menuName": "H", "parentId": 0},
];
List<List<List<dynamic>>> a = [
  [[0,null]],
  [[1,0],[7,0],[8,0]],
  [[2.1],[5,1],[6,1]],
  [[3,2]],
  [[3,4]]
];
// <List<dynamic> always have 2 element
// [0] : id
// [1] : parentId
List<List<List<dynamic>>> matrixLinkedMenuId = [
  //[[0,null]]
];
void addRootElement() {
  for (int i = 0; i < menu.length; i++) {
    if (menu[i]["parentId"] == null) {
      // no need check array null, because tree always one root node (default)
      matrixLinkedMenuId.add([]);
      matrixLinkedMenuId.last
          .add([menu[i]["id"], menu[i]["parentId"]]);
      menu.removeAt(i);
      break;
    }
  }
}

void convertMenu() {
  addRootElement();
  int level = 1;
  for (int i = 0; i < menu.length; i++) {
    bool isLevelIncrease = true;
    for (int j = 0; j < matrixLinkedMenuId.last.length; j++) {
        // if menu table id have parentId is a id of matrixLinkedMenuId
        if (menu[i]["parentId"] == matrixLinkedMenuId.last[j][0]) {
          if(isLevelIncrease){
            matrixLinkedMenuId.add([]);
            isLevelIncrease = false;
          }            
          matrixLinkedMenuId.last.add([menu[i]["id"], menu[i]["parentId"]]);
        }
      }
      
    }
}

void main() {
  //var menuClone = new List<Map<String, dynamic>>.from(menu);
  convertMenu();
  print(matrixLinkedMenuId);
}
