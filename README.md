﻿﻿﻿# dart-basic
# Lesson 14
* **Knowledge** : *Recursive, List, Map, algorithm*
* **Deadline**: *6:00 PM Tuesday 16th Jul 2019*
* **Fored Standards**:
  - Get latest code from **master** branch
  - Code in L14 folder
  - Always create a feature with format : **feature/L14-name-member**
  - Pull request title is **L14 Finish**
  - Pull request body is link screenshot your result
  - All code only in L14.dart

* **Requirements**:
  Give a json data 
  ```js
  List<Map<String, dynamic>> menuList = [
    { "id": 0, "menuName": "Root", parentId: "#" },
    { "id": 1, "menuName": "A", parentId: 0 },
    { "id": 2, "menuName": "B", parentId: 0 },
    { "id": 3, "menuName": "C", parentId: 5 },
    { "id": 4, "menuName": "D", parentId: 5 },
    { "id": 5, "menuName": "E", parentId: 0 },
    { "id": 6, "menuName": "F", parentId: 5 },
    { "id": 7, "menuName": "G", parentId: 1 },
    { "id": 8, "menuName": "H", parentId: 1 },
    { "id": 9, "menuName": "I", parentId: 6 },
    { "id": 10, "menuName": "J", parentId: 6 },
    { "id": 11, "menuName": "K", parentId: 3 },
    { "id": 12, "menuName": "L", parentId: 3 },
    { "id": 13, "menuName": "M", parentId: 3 },
    { "id": 14, "menuName": "N", parentId: 12 },
    { "id": 15, "menuName": "O", parentId: 12 },
    { "id": 16, "menuName": "P", parentId: 18 },
    { "id": 17, "menuName": "Q", parentId: 18 },
    { "id": 18, "menuName": "R", parentId: 10 },
    { "id": 19, "menuName": "S", parentId: 10 },
    { "id": 20, "menuName": "T", parentId: 10 }
  ]
  ```
  - **L14.1**: Convert ***menuList*** to ***menuMap*** [2 marks]
    ```js
    function convertListMenuToMapMenu(menuList) {
      // todo
    }
    ```
  Result :
    ```js
    { 
      "0": { "id": 0, "menuName": "Root"},
      "1": { "id": 1, "menuName": "A" },
      "2": { "id": 2, "menuName": "B" },
      "3": { "id": 3, "menuName": "C" },
      "4": { "id": 4, "menuName": "D" },
      "5": { "id": 5, "menuName": "E" },
      "6": { "id": 6, "menuName": "F" },
      "7": { "id": 7, "menuName": "G" },
      "8": { "id": 8, "menuName": "H" },
      "9": { "id": 9, "menuName": "I" },
      "10": { "id": 10, "menuName": "J" },
      "11": { "id": 11, "menuName": "K" },
      "12": { "id": 12, "menuName": "L" },
      "13": { "id": 13, "menuName": "M" },
      "14": { "id": 14, "menuName": "N" },
      "15": { "id": 15, "menuName": "O" },
      "16": { "id": 16, "menuName": "P" },
      "17": { "id": 17, "menuName": "Q" },
      "18": { "id": 18, "menuName": "R" },
      "19": { "id": 19, "menuName": "S" },
      "20": { "id": 20, "menuName": "T" }
    }
    ```
  - **L14.2** : group menu by parentId : [2 marks]
    ```js
    function buildGroup(menuList) {
      // todo
    }
    ```
  Result :
    ```js
    {
      "0": [ 1, 2, 5 ],
      "1": [ 7, 8 ],
      "3": [ 11, 12, 13 ],
      "5": [ 3, 4, 6 ],
      "6": [ 9, 10 ],
      "10": [ 18, 19, 20 ],
      "12": [ 14, 15 ],
      "18": [ 16, 17 ],
      "#": [ 0 ] 
    }
    ```
  - **L14.3** : covert this ***javascript*** algorithm to ***dart*** [5 marks]
      ```js
        function buildTree(menuMap, parentIdGroups, parentIdRoot) {
          let currentParentIdGroup = parentIdGroups[parentIdRoot] || []
          return currentParentIdGroup.map((menuId, menuIdIndex) => {
              let menuItem = menuMap[menuId];
              let parentIdNext = parentIdGroups[parentIdRoot][menuIdIndex];
              let childrenMenuItem = buildTree(menuMap, parentIdGroups, parentIdNext);
              if (childrenMenuItem.length > 0)
                  menuItem["children"] = childrenMenuItem;
              return menuItem;
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
      ```
      - **Result**: Run above code by **Nodejs** or **Chrome** to see result

  - **L14.4** : Validate data(menuList) don't loop [1 mark]

# Lesson 13
* **Knowledge** : *clean code & algorithm*
* **Deadline**: *6:00 PM Friday 05th Jul 2019*
* **Fored Requirements**:
  - Clean your **L12** code & follow the scenario of **main** function [4 marks]
    ```dart
    void main(){
      // L12.1.1 kịch bản tổng đài 1 hàm
      

      // L12.1.2 kịch bản tổng đài tách hàm 


      // L12.2.1 khai báo và sử dụng array số nguyên


      // L12.2.2 khai báo và sử dụng ma trận số nguyên bằng List & Map


      // L12.2.3 khai báo và sử dụng dữ liệu json tổng hợp(từa lưa kiểu) bằng Map


      // L12.3 sắp xếp mảng số nguyên

    
      // L12.4 tìm kiếm phần tử bất kỳ trong mảng


      // L12.5 tìm kiếm nhị phân phần tử bất kỳ trong mảng

    }
    ```
  - Create a function convert raw json to nested json [5 marks]
    - Input raw json
      ```dart
      List<Map<String, dynamic>> rawJson = [
        {"id": 1, "menuName": "A", "parentId": null},
        {"id": 2, "menuName": "AB", "parentId": 1},
        {"id": 3, "menuName": "ABC", "parentId": 2},
        {"id": 4, "menuName": "ABCD", "parentId": 3},
        {"id": 5, "menuName": "AE", "parentId": 1},
        {"id": 6, "menuName": "AF", "parentId": 1},
        {"id": 7, "menuName": "G", "parentId": null},
        {"id": 8, "menuName": "H", "parentId": null},
      ]
      ```
    - Output nested json 
      ```dart
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
                      "children":[
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
      ```
  - print pretty console for json data as this screen : http://prntscr.com/o9e825 [1 mark]

# Lesson 12
* **Knowledge** : *Recursive, List, Map, sort & find algorithm*
* **Deadline**: *6:00 PM Thursday 27th Jun 2019*
* **Fored Requirements**:
  - Get latest code from **master** branch
  - Code in L12 folder
  - Always create a feature with format : **feature/L12-name-member**
  - Pull request title is **L12 Finish**
  - Pull request body is link screenshot your result
  - All code only in L12.dart

* **Đề bài** 
  - Mô tả kịch bản tổng đài [3 marks]
     ```
     - Nhấn phím 1 : nghe tiếng việt
     - Nhấn phím 2 : gặp tổng viên
     - Nhấn phím 3 : để nghe lại
    ```
    - Làm tất cả trong một hàm [1 marks]
    - Sau đó tách  3 hàm [2 marks]
      - Hàm thủ tục nhập số
      - Hàm thủ tục in ra menu như trên
      - Hàm nhận giá trị số nhập vào và trả về một chuỗi có ý nghĩa tương ứng với mô tả trên.
  - Khai báo & sử dụng array, json [2 marks]
      - Hãy khai báo một mảng với 5 chữ số tự nhiên bất kỳ(không thứ tự). In ra màn hình giá trị bất kì. Sử dụng 2 cách, dùng biến $ và nối chuỗi thông thường
      ```
        // Kết quả màn hình giống nhau nhưng cách dùng khác nhau
        a[0] = 1
        a[0] = 1
      ```
      - Hãy khai báo một ma trận gồm 5 mảng trên (bắt buộc sử dụng 2 cách Map & List). In ra màn hình giá trị bất kì. Sử dụng 2 cách, dùng biến $ và nối chuỗi thông thường
        ```
          List matrixList = ...
          Map matrixMap = ...
        ```
      - Hãy khai báo một biến Map chứa json,bắt buộc để chính xác kiểu dữ liệu. In ra màn hình 1 giá trị bất kì. Sử dụng 2 cách, dùng biến $ và nối chuỗi thông thường
  
  - Viết thuật toán sắp sếp mảng 5 chữ số
    - Hàm có 2 tham số **array** đầu vào & **sortType** 'desc'(giảm dần), 'asc'(tăng dần), giá trị trả về là 1 mảng mới đã sắp xếp [1 mark]
  - Viết hàm tìm kiếm phần tử bất kỳ trong mảng (có 2 tham số array & giá trị cần tìm,  trả về phần tử tìm được) [1 mark]
  - Viết hàm tìm kiếm nhị phân phần tử bất kỳ trong mảng (có 2 tham số array & giá trị cần tìm, trả về phần tử tìm được) [2 mark]
  - Code đẹp, đặt tên hàm tên biến đúng chuẩn ***Camel Case*** ... [1 mark]

# Lesson 11 advanced
* **Knowledge** : *Default Factory Constructor, Future then, Recursive*
* **Deadline**: *6:00 PM Friday 21th Jun 2019*
* **Requirements** 
  - **L11 advanced**: createAvengers() function without async await, but fetching data is orderly [5 marks]
  - **L11 clean code** : make your code cleaner [5 marks]

# Lesson 11
* **Knowledge** : *Factory Constructor(named & default), Future ansyc await, Future then, dynamic*
* **Deadline**: *6:00 PM Wednesday 19th Jun 2019*
* **Fored Requirements**:
  - Get latest code from **master** branch
  - Code in L11 folder
  - Alway create a feature with format : **feature/L11-name-member**
  - Pull request title is **L11 done**
  - Pull request body is link screenshot your result

* **Đề bài**   
    Knowledge : Default Factory Constructor, Future then, Recursive
    Deadline: 5h:30 PM Friday 21th Jun 2019
* **Đề bài cơ bản** 
   - Tạo hàm fetAvenger(url) có cách sử dụng như sau: 
     ```dart
      // In Avenger.dart
      Avengers.fetchAvenger(url)
     ```
     Hàm mẫu fetAvenger lấy thông tin từ json url
      ```dart
            Future<dynamic> fetchAvenger(url) async {
            try {
              final response = await http
                  .get(url);
              if (response.statusCode == 200) {
                // If server returns an OK response, parse the JSON
                return JSON.jsonDecode((response.body));
              } else {
                // If that response was not OK, throw an error.
                print('Failed to load post');
              }
            } catch (e) {
              print(e);
            }
        ```
   - Tạo ***named factory constructor*** có tính chất như ***default factory constructor*** nhưng chỉ có một tham số ***fromURL(String url)***.  **[3 marks]**
     Gợi ý thêm :
     - **name**, **sexual** lấy từ nội dung url, 
     - **type** là tên file json của url. ví dụ url https://blogspotscraping.herokuapp.com/avengers/Thor.json -> type là 'Thor'
     - Viết hàm lấy type có cách sử dụng như sau : bắt buộc dùng thuật toán cắt chuỗi.
     ```dart
      String type = Avengers.getFileNameFromUrl(url)
     ```
     - Cách sử dụng như sau: 
        - Gọi hàm showInfo trong hàm khởi tạo
        - Phải dùng hàm ***etchAvenger(url)*** bên trong hàm này
     ```dart
      Thor thor = Avenger.fromURL(urlThor);
     ```
   - Trong file L11.dart, tạo hàm có tên là *createAvengers()* cho phép tạo hàng loạt aveneger show ra info từng avenger đúng thứ tự danh sách URL bên dưới( Thor -> Thanos -> Captain America). **[4 marks]**
      - Bắt buộc sử dụng lại hàm **default factory constructor** bên trong ***createAvengers()*** 
      - Bắt buộc sử dụng vòng lặp for
      ```dart
       // don't change position of url in list
       // In L11.dart
       const List<String> urlAvengers = [
          'https://blogspotscraping.herokuapp.com/avengers/Thor.json',
          'https://blogspotscraping.herokuapp.com/avengers/Thanos.json',
          'https://blogspotscraping.herokuapp.com/avengers/CaptainAmerica.json',
        ];
      ```
   - Code đẹp ... **[3 marks]**
* **Kết quả** 
  https://prnt.sc/o1n3wb

# Lesson 10 - Avengers Endgame: Avenger Factory & Captian America fetch Thor's Mjolnir hammer
* **Knowledge** : *Factory Constructor, Polymorphism(implement, extend)*
* **Deadline**: *5:00 PM Wednesday 12th Jun 2019*

* **Đề bài** 
   - Tạo abtract class Avenger có 2 thuộc tính public name & sexaul, hàm showInfo(), có factory constructor... **[3 marks]**
   - Tạo 2 class CaptainAmerica & Thor kế thừa từ abtract class Avenger sao cho có 2 cách khởi tạo như code bên dưới **[3 marks]**
      ```dart
       Thor thorFactoryMade = Avenger(type: Avengers.Thor, name:'Thor Factorymade', sexual: 'Male');
       Thor thorHomeMade = Thor(name:'Thor Homemade', sexual: 'Male');
       thorFactoryMade.showInfo();
       thorHomeMade.showInfo();
      ```
   - Trong tập cuối Captain America có khả năng gọi búa Mjolnir của Thor. Hãy mô tả tính chất đó bằng thuộc tính từ khóa implement **[2 marks]**
   ```dart
    CaptainAmerica ca = Avenger(type: Avengers.CaptainAmerica, name: Avengers.CaptainAmerica, sexual: 'Male');
    ca.showInfo();
    ca.fetchMjolnir();
    ```
   - Code đẹp, tách hàm, đặt tên biến, tổ chức code, class ... **[2 marks]**

# Lesson 9 - Avengers Endgame: Chống giả mạo
* **Knowledge** : *Singleton(desgin pattern), Factory Constructor, Http*
* **Deadline**: *6:00 PM Thursday 3th Jun 2019*

* **Đề bài** 
    (*Yêu cầu nâng cao L8*)
   - Thor chỉ có một, không có một nhân vật khác giả mạo(-> sử dụng Singleton, một class chỉ có duy nhất 1 new instance ) **[5 marks]**
   - Viết hàm kiểm tra 2 new instance của Thor để đảm bảo không bị giả mạo (Sử dụng operator ==) **[1 marks]**
      ```dart
        Thor thor = Thor(name: 'Thần Sét', sexual: 'Male');
        Thor thorFake = Thor(name: 'Thần Sét Fakebede', sexual: 'Female');
        thor.showInfo();
        thorFake.showInfo();
        print("Thor can't be fake: ${thor == thorFake}");
      ```
      - Screen ressult : http://prntscr.com/nxbobg
   - Thor lúc này bụng phệ, não teo vì rượu hay đãng trí, thường xuyên quên cây búa thần Mjolnir, trước lối ra đường hầm hệ thống sẽ check vũ khí chỉ avenger có type là Thor. Nên muốn qua đường hầm lượng tử Thor phải triển khai phương thức *fetchMjolnir()*( khởi tạo Gadget, tham số name lấy từ URL). Yêu cầu : dùng http fetch tên búa qua URL : https://blogspotscraping.herokuapp.com/mjolnir.json (-> Sử dụng Future, async, await, http) **[3 marks]**
   - Code đẹp, tách hàm, đặt tên biến ... [1 mark]
# Lesson 8 - Avengers Endgame: Đánh cắp thời gian
* **Knowledge** : *Stream, StreamController, StreamSubscription, Future, async, await*
* **Deadline**: *6:00 PM Thursday 4th Jun 2019*

**Đề bài** : 

 * **Dẫn nhập** :
   - Trận Infinity War các Avengers thua Thanos, họ quyết định chọn phương án đánh cắp thời gian trở về quá khứ cướp lại 6 viên đá để thay đổi kết quả cuộc chiến. Các Avengers sử dụng đừờng hầm lượng tử để du hành thời gian. Triển khai code mô tả kịch bản này.

 * **Các đối tượng mô phỏng** : 
   - List<dynamic> Avengers = [...] : Danh sách các avenger
   - StreamController : Bộ điều khiển đường hầm lượng tử
   - StreamSubscription : Bộ cảm biến đường hầm lượng tử đặt ở lối ra đường hầm: StreamController().stream.listen((data)) -> StreamSubscription
   - Stream :
      - StreamSink : StreamController().sink - Lối vào để đưa Avenger vô đường hầm lượng tử [sink.add(avenger)]
      - Stream : StreamController().stream - Lối ra đường hầm lượng tử
 * **Yêu cầu cơ bản** :  
   - Bộ cảm biến có nhiệm vụ lọc avenger, chỉ avenger có vũ khí mới cho qua. Hiển thị thông tin avengers được chấp nhận(Accepted) & không chấp nhận(Rejected) qua đường hầm lượng tử ở bộ cảm biến(-> sử dụng StreamSubscription) **[2 marks]**
   - Cứ cách 1s là mỗi avenger sẽ được cho vào đường hầm lượng tử (-> sử dụng StreamController().sink.add, Future, await, asyn) **[3 marks]**
   - Đường hầm sẽ đóng lại sau 4s, avenger nào nhảy vào không kịp thì phải ở lại (-> sử dụng StreamController().close, Future) **[2 marks]**
   - Lưu lại một danh sách mới chứa các avenger được chấp nhận(transformedAvengers) và hiển thị lại. **[3 marks]**
   - **Kết quả demo**
      - http://prntscr.com/nup9nh static picture
      - https://i.imgur.com/tWw37xk.gif  dynamic picture
 ```dart
import 'dart:async';
import '../L6/Avenger.dart';
import '../L6/Spiderman.dart';
import '../L6/CaptainAmerica.dart';
import '../L6/Thanos.dart';
import '../L6/Hulk.dart';
import '../L6/Spiderman.dart';
const STREAM_CLOSE_TIMEOUT = 4;
const AVENGER_GO_TIMEOUT = 1;
Future<List<dynamic>> transformAvengers(List<dynamic> avengers) async {
  List<dynamic> transformedAdvengers = [];
  // Triển khai kịch bản tại đây 
  // Dùng  StreamController, StreamSubscription...
  // start todo
  // ...
  // end todo
  return transformedAdvengers;
}

// Liệt kê avengers đã qua đường hầm lượng tử
void showAvengers(List<dynamic> transformedAvengers){

}
List<dynamic> avengers = [
  Thanos(
    name:'Củ khoai tím',
    sexual:'Male',
    gadget:Gadget('Găng tay vô cực 6 đá')
  ),
  Thor(
    name:'Thần Sét',
    sexual:'Male'
  ),
  CaptainAmerica(
    name:'Lớp trưởng Mỹ',
    sexual:'Male',
    gadget:Gadget('Supper Khiên')
  ),
  Spiderman(
    name:'Người Nhện',
    sexual:'Male',
    gadget:Gadget('Tơ Nhện')
  ),
  Hulk(
    name:'Khổng Lồ Xanh',
    sexual:'Male',
    gadget:Gadget('Cú đấm')
  ),
];
void main() {
  transformAvengers(avengers).then((transformedAvengers) { 
    showAvengers(transformedAvengers);
  });
}
```
* **Result screen** :
  - http://prntscr.com/nup9nh static picture
  - https://i.imgur.com/tWw37xk.gif  dynamic picture

# Lesson 7 - dynamic vs var keyword
* Deadline: 6:00 PM Thursday 23th May 2019

**Main Requirements** : 

* Create file L7.dart into L7 folder
* Copy under dart code [1 mark]
* Fill missing places http://prntscr.com/nrot1q [6 marks]
* Print class name of 20 random Avengers in **avengers** variable as http://prntscr.com/nrhrg7 [3 marks]
* Note : *Run error 1 mark*
 ```dart
import '../L6/CaptainAmerica.dart';
import '../L6/Thanos.dart';
import '../L6/Hulk.dart';
import '../L6/Spiderman.dart';
import 'dart:math';

List<...> avengers = [<list to avengers here>];
String checkAvenger(... avenger){
  // get "class name" of a avenger here such as "Thanos", "Spiderman", "Hulk" ...
}
... getAvenger(){
  // get a random avenger from List here
}
void main(){
  // list random avengers here
  for(20)
    print(checkAvenger(getAvenger()));
}
```
console screen :
 ```dart
a list random avengers, refer here http://prntscr.com/nrhrg7
```

# Lesson 6 - Avengers: Endgame
* Structure of L6 lesson, L6.dart and result screen : http://prntscr.com/nk6pv7
* Create files in L6 folder and do following requirements
* Deadline: Tuesday 9th May 2019

**Main Requirements** : 
 ```dart
Thanos tn = Thanos(
    name:'Thanos / Củ khoai tím',
    sexual:'Male',
    gadget:Gadget('Găng tay vô cực 6 đá')
);
tn.showInfo();
```
Console screen :
 ```dart
// Name: Thanos / Củ khoai tím
// Sexual: Male
// Bảo bối: Găng tay vô cực 6 đá
```
 ```dart
Thanos tnChild = Thanos(
    name:'Thanos Con',
    sexual:'Bê đê',
);
tnChild.showInfo();
```
Console screen :
 ```dart
// Name: Thanos Con
// Sexual: Bê đê
// Bảo bối: Chưa đủ đẳng cấp để sử dụng bảo bối
 ``` 
**Detail Requirements** : 
-  Define **Avenger abtract class** [5 marks]
    + Have three private properties : 
        ```dart 
        String name 
        String sexual 
        Gadget gadget
        ```
    + Have constructor method with three named optional parameters, each parameter has default value [4 marks]
    + doSkill() is a abtract method (extended class will override it) [0.5 mark]
    + showInfo() [0.5 mark]
-  Define **Gadget class** [1 mark]
    + Have a private property "name"
    + Have a constructor method with one position optional parameter
    + Have a public method getName()
-  Define one in list figures: https://en.wikipedia.org/wiki/List_of_Marvel_Cinematic_Universe_films (*each member have to define separate figure*)
    + Class definition, force extend from Avenger *abtract* class [0.5 mark]
    + Constructor method, force call the supper constructor method of Avenger class [2 marks]
    + doSkill method, force override from Avenger class [0.5 mark]
    + Print a funny/pretty unicode text related the avenger in doSkill() [1 mark]
      - Example Thanos's flick Off =)) @@
```dart
                            `y.             :o                                          
                                         .y`           -h`                                          
                                          `           `.`                                           
                                                     `y.                                            
                                                     o-                                             
                              .`               `                                                    
                             `:++/ ..`      .+/:oos+/.          -//+.                               
                                 ` `:++:    s. .s-y.`+/`        ```        .-:::.                   
                                            h  +: .+/-+s:               `/+:.``./s                  
                                            h  -o   `..`:o-            :o.     `s-                  
                                           `h   ++       `:o-         :+`     `o-                   
                                           -o    -o:`      `/+`      .s`     `s-                    
                                          .s`     `-y/       -s`   `/+.     .o.                     
                               `:++`     `s`       `y/+       -o. .o-      -o`                      
                               --`       o-        // :o.      .o/s.      -o`                       
                                        +/        -s`  .o-      `-s:     .s`                        
                                      `+/        `s.    `+/`      `/+   .s.                         
                                     -o-         o:      `y//.      o- `s-                          
                                   -+/`      `../y..`...-o+--.`     +-`o-                           
                                 -+/.``..-://:----------.-...-/+`   y.+:                            
                               :+:-++::-o/.`   .-----..`       //  `yo:                             
                             .+/` s++-://``.-//:-....-:://-.   `y` /h+                              
                            /+.   s--:/:/+s:.`           `-+/   //`hy                               
                          `+/     `+/ho//+-      `.`        o-  `y-m-                               
                          o:        `o+:`   `.-:///o        o-  `y:h                                
                         -o           .:/+ss+/-.   o:`      s-  `y-s                                
                         o-           .:/:-`       `y.      //   y-s                                
                         y          .//-           //       `s.  +:y`                               
                        `y        .+/.             -o`       .s` .///                               
                        :/       -o.                -`        -o   .y                               
                       .s`      :o`                            s. `+/                               
                      .o.      .s`                             s--o-                                
                    `:o.       --                             `h/o`                                 
                  `-+:                                    `.-/+/.                                   
                `:+:`                                 `.//:-.                                       
              ./+-             `                  `.://-`                                           
           `-+/.               :o.             `-/+:.                                               
         ./+:`                  `///-.``````.:+/-`                                                  
       -+/.                        .+s::::::-`                                                      
       :o                         :o-                                                               
        :o.                     -o:                                                                 
         `++.                 `o+`                                                                  
           `/+:`            `++`                                                                    
              -++:`        /o.                                                                      
                 ./+/:.` :o-                                                                        
                     `-::-                                                                          
                                                                                                    

```

# Lesson 5
* Result on screen as : http://prntscr.com/ng2tt4
* Use code in L5 folder and follow requirement

**Requirements** : 
-  Define **Show()** has one optional positional parameter not optional named parameter [1 mark]
-  Define **Move()**, force re-use setXY() [1 mark]
-  Calculate distance between two points [3 marks]
-  Define **Plus()** with usage as [1 mark]
 ```dart
 Point p3 = Point.plus(p1, p2);
 ```
 -  Define **(+)** operator with usage as [3 marks]
 ```dart
 Point p3 = p1 + p2;
 ``` 
- Pretty code [1 marks]
  - Use arrow function
  - ...
