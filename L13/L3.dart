import 'L.dart';

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
int findIndexMenuById(menuId){
  for(int i = 0; i< menu.length; i++){
    if(menu[i]["id"] == menuId){
        return i;
    }
  }
  return -1;
}
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
void buildTree(int i){
    int level = 0;
    if(tree[level]['children'] == null)
      node = tree[level];
    else 
    node = tree[level]["children"];
    while(i < menu.length){
      //print(i);
      if(menu[i]["parentId"] == node["id"]){
        if(node['children'] == null)
          node['children'] = [];
        node['children'].add(menu[i]);
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
  addRootElement();
  buildTree(0);
  printJson(tree);
  // tree[0]["children"] = [];
  // tree[0]["children"].add(menu[1]);
  // printJson(tree);

  //print(findIndexMenuById(7));
}