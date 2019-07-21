var makeTree = (function() {
    var isArray = function(obj) {
      return Object.prototype.toString.call(obj) == "[object Array]";
    };
    var clone = function(obj) {
      return JSON.parse(JSON.stringify(obj));
    };
    var buildTree = function(catalog, structure, start) {
      return (structure[start] || []).map(function(id, index) {
        var record = catalog[id];
        var keys = structure[start][index];
        var children = isArray(keys) ? keys.map(function(key) {
          return buildTree(catalog, structure, key);
        }) : buildTree(catalog, structure, keys);
        if (children.length) {
          record.children = children;
        }
        return record;
      })
    };
    return function(flat) {
      var catalog = flat.reduce(function(catalog, record) {
        catalog[record.id] = clone(record);
        delete(catalog[record.id].parentId);
        return catalog;
      }, {});
      var structure = flat.reduce(function(tree, record) {
        (tree[record.parentId] = tree[record.parentId] || []).push(record.id);
        return tree;
      }, {});
      return buildTree(catalog, structure, '#'); // this might be oversimplified.
    }
  }());
  
  
  
  var flat = [{"id": 0, "menuName": "O", "parentId": "#"},
  {"id": 1, "menuName": "A", "parentId": 0},
  {"id": 2, "menuName": "AB", "parentId": 1},
  {"id": 3, "menuName": "ABC", "parentId": 2},
  {"id": 4, "menuName": "ABCD", "parentId": 3},
  {"id": 5, "menuName": "AE", "parentId": 1},
  {"id": 6, "menuName": "AF", "parentId": 1},
  {"id": 7, "menuName": "G", "parentId": 0},
  {"id": 8, "menuName": "H", "parentId": 0}]
  
console.log(JSON.stringify(makeTree(flat), null, 2));

  var clone = function(obj) {
    return JSON.parse(JSON.stringify(obj));
  };
  var catalog = flat.reduce(function(catalog, record) {
    catalog[record.id] = clone(record);
    delete(catalog[record.id].parentId);
    return catalog;
  }, {});
  console.log('catalog');
  console.log(catalog);
  var structure = flat.reduce(function(tree, record) {
    (tree[record.parentId] = tree[record.parentId] || []).push(record.id);
    return tree;
  }, {});
  console.log('structure');
  console.log(structure);
  