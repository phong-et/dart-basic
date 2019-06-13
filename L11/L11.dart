import 'Avenger.dart';
import 'Thor.dart';
const List<String> urlAvengers = [
  'https://blogspotscraping.herokuapp.com/avengers/Thor.json',
  'https://blogspotscraping.herokuapp.com/avengers/Thanos.json',
  'https://blogspotscraping.herokuapp.com/avengers/CaptainAmerica.json',
];

void fetchAvengers() {
  for(final url in urlAvengers){
    Avengers.fetchAvenger(url).then((onValue) => print(onValue["Avenger"]["name"]));
  }
}
Future<dynamic> createAvengers() async {
  for(final url in urlAvengers){
     Avenger.fromURL(url);
  }
}

void main() async {
  //fetchThor().then((onValue) => print(onValue));
  //fetchAvengers();
  //print(Avengers.getFileNameFromURL(urlAvengers[0]));

   //Avenger.fromURL(urlAvengers[0]);
   createAvengers();
}
