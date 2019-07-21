let menuList =
    [
        { id: 0, menuName: 'Root', parentId: '#' },
        { id: 1, menuName: 'A', parentId: 0 },
        { id: 2, menuName: 'B', parentId: 0 },
        { id: 3, menuName: 'C', parentId: 5 },
        { id: 4, menuName: 'D', parentId: 5 },
        { id: 5, menuName: 'E', parentId: 0 },
        { id: 6, menuName: 'F', parentId: 5 },
        { id: 7, menuName: 'G', parentId: 1 },
        { id: 8, menuName: 'H', parentId: 1 },
        { id: 9, menuName: 'I', parentId: 6 },
        { id: 10, menuName: 'J', parentId: 6 },
        { id: 11, menuName: 'K', parentId: 3 },
        { id: 12, menuName: 'L', parentId: 3 },
        { id: 13, menuName: 'M', parentId: 3 },
        { id: 14, menuName: 'N', parentId: 12 },
        { id: 15, menuName: 'O', parentId: 12 },
        { id: 16, menuName: 'P', parentId: 18 },
        { id: 17, menuName: 'Q', parentId: 18 },
        { id: 18, menuName: 'R', parentId: 10 },
        { id: 19, menuName: 'S', parentId: 10 },
        { id: 20, menuName: 'T', parentId: 10 },
        { id: 10, menuName: "T", parentId: 20 },
    ]
    // [
    //     { "id": 0, "menuName": "O", "parentId": "#" },
    //     { "id": 1, "menuName": "A", "parentId": 0 },
    //     { "id": 2, "menuName": "AB", "parentId": 1 },
    //     { "id": 3, "menuName": "ABC", "parentId": 2 },
    //     { "id": 4, "menuName": "ABCD", "parentId": 3 },
    //     { "id": 5, "menuName": "AE", "parentId": 1 },
    //     { "id": 6, "menuName": "AF", "parentId": 1 },
    //     { "id": 7, "menuName": "G", "parentId": 0 },
    //     { "id": 8, "menuName": "H", "parentId": 0 },
    //     { "id": 4, "menuName": "H", "parentId": 8 },
    //     { "id": 0, "menuName": "H", "parentId": 8 }
    // ]
let clone = function (obj) {
    return JSON.parse(JSON.stringify(obj));
}
function convertListMenuToMapMenu(menuList) {
    let menuMap = menuList.reduce((mappedItems, record) => {
        mappedItems[record.id] = clone(record);
        delete (mappedItems[record.id].parentId);
        return mappedItems;
    }, {});
    return menuMap;
}
function buildGroup(menuList) {
    let parentIdGroup = menuList.reduce((groups, record) => {
        var parentId = record['parentId']
        if (groups[parentId] === undefined)
            groups[parentId] = []
        groups[parentId].push(record.id);
        return groups
    }, {});
    return parentIdGroup;
}
var i = 0
function buildTree(menuMap, parentIdGroups, parentIdRoot) {
    let currentParentIdGroup = parentIdGroups[parentIdRoot] || []
    return currentParentIdGroup.map((menuId, menuIdIndex) => {
        let menuItem = menuMap[menuId];
        let parentIdNext = parentIdGroups[parentIdRoot][menuIdIndex];
        var childrenMenuItem = buildTree(menuMap, parentIdGroups, parentIdNext);
        if (childrenMenuItem.length > 0)
            menuItem["children"] = childrenMenuItem;
        console.log(`-------${i++}------`)
        console.log(JSON.stringify(menuItem, null, 2))
        return menuItem;
    })
}
(function () {
    let menuMap = convertListMenuToMapMenu(menuList)
    console.log(menuMap)
    let parentIdGroups = buildGroup(menuList)
    console.log(parentIdGroups)
    //let tree = buildTree(menuMap, parentIdGroups, '#')
    //console.log(JSON.stringify(tree, null, 2));
})()
