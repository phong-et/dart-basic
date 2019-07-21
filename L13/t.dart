
void main() {
  List _sample = ['a', 'b', 'c'];
  // var a = _sample
  //     .asMap()
  //     .map((index, str) {
  //       // print(index);
  //       // print(str);
  //       var a = MapEntry(index, str + index.toString());
  //       print(a);
  //       return a;
  //     })
  //     .values
  //     .toList();
// returns ['a0', 'b1', 'c2']

  //print(a);
  int index = 0;
  var b = _sample.map((value) {
    print(value);
    value = value + index.toString();
    index++;
    return value;
  });
  print(b);
}
