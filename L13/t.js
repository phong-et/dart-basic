let isArray = function (obj) {
    return Object.prototype.toString.call(obj) == "[object Array]";
  }
  function buildTree(menuMap, parentIdGroups, parentIdRoot) {
      let currentNode = parentIdGroups[parentIdRoot]
      if (currentNode === undefined)
          currentNode = []
      return currentNode.map((menuId, index) => {
          let record = menuMap[menuId];
          let keys = parentIdGroups[parentIdRoot][index];
          var children = isArray(keys) ?
              keys.map(key => buildTree(menuMap, parentIdGroups, key)) :
              buildTree(menuMap, parentIdGroups, keys);
          if (children.length) {
              record.children = children;
          }
          return record;
      })
  }
  (function () {
      let menuMap = {
          '0': { id: 0, menuName: 'Root' },
          '1': { id: 1, menuName: 'A' },
          '2': { id: 2, menuName: 'B' },
          '3': { id: 3, menuName: 'C' },
          '4': { id: 4, menuName: 'D' },
          '5': { id: 5, menuName: 'E' },
          '6': { id: 6, menuName: 'F' },
          '7': { id: 7, menuName: 'G' },
          '8': { id: 8, menuName: 'H' },
          '9': { id: 9, menuName: 'I' },
          '10': { id: 10, menuName: 'J' },
          '11': { id: 11, menuName: 'K' },
          '12': { id: 12, menuName: 'L' },
          '13': { id: 13, menuName: 'M' },
          '14': { id: 14, menuName: 'N' },
          '15': { id: 15, menuName: 'O' },
          '16': { id: 16, menuName: 'P' },
          '17': { id: 17, menuName: 'Q' },
          '18': { id: 18, menuName: 'R' },
          '19': { id: 19, menuName: 'S' },
          '20': { id: 20, menuName: 'T' }
      }
      let parentIdGroups = {
          '0': [1, 2, 5],
          '1': [7, 8],
          '3': [11, 12, 13],
          '5': [3, 4, 6],
          '6': [9, 10],
          '10': [18, 19, 20],
          '12': [14, 15],
          '18': [16, 17],
          '#': [0]
      }
      let tree = buildTree(menuMap, parentIdGroups, '#')
      console.log(JSON.stringify(tree, null, 2))
  })()