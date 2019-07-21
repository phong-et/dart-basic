import 'dart:convert';

void printJson(jsonData) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonData);
  print(prettyPrint);
}

List<Map<String, dynamic>> treeMenu = [
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
      }
    ]
  }
];
dynamic node;
void appendChild(int level, List<int> rootIndexMenuIds, Map<String, dynamic> menuItem) {
  if (node == null)
    node = treeMenu[rootIndexMenuIds[level]]['children'];
  else
    node = node[rootIndexMenuIds[level]]["children"];
  if (level == rootIndexMenuIds.length - 1)
    node.add(menuItem);
  else
    appendChild(++level, rootIndexMenuIds, menuItem);
}

void main() {
  var menuItem = {
    "id": 4,
    "menuName": "ABCD",
  };
  
  appendChild(0, [0, 0, 0], menuItem);
  printJson(treeMenu);
  appendChild(0, [0, 0, 0], menuItem);
  printJson(treeMenu);

  ////// Test Add //////
  //printJson(treeMenu[0]["children"][0]["children"].add(menuItem));
  //printJson(treeMenu);

  //////// test level access tree //////
  // var a = treeMenu[0]["children"];
  // printJson(a);
  // var b = a[0]["children"];
  // printJson(b);
  // var c = b[0]['children'];
  // c.add(menuItem);
  // printJson(c);
  // printJson(treeMenu);
}
