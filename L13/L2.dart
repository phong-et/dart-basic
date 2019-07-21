dynamic node = ""; 
List<Map<String, dynamic>> tree = [];
void appendChild(int level, List<int> rootIds, Map<String, dynamic> menuItem){
  node = tree[rootIds[level]];
  if(level == rootIds.length -1)
    node["children"].add(menuItem);  
  else
    appendChild(level++, rootIds, menuItem);
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
void addRootElement() {
  for (int i = 0; i < menu.length; i++) {
    if (menu[i]["parentId"] == null) {
      tree.add(menu[i]);
      menu.removeAt(i);
      node = tree[0];
      print(node);
      break;
    }
  }
}
void buildTree(i){
  addRootElement();
  while(i < menu.length){
    //print(i);
    if(menu[i]["parentId"] == tree.first["id"]){
      if(tree.first['children'] == null)
        tree.first['children'] = [];
      tree.first['children'].add(menu[i]);
      menu.removeAt(i);
      //printJson(tree);
      buildTree(i);
    }
    else{
      buildTree(++i);
    }
  }
}
void main(){
  buildTree(0);
  // tree[0]["children"] = [];
  // tree[0]["children"].add(menu[1]);
  // printJson(tree);
}