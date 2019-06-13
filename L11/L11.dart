

import 'Avenger.dart';

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

void main() {
  //fetchThor().then((onValue) => print(onValue));
  fetchAvengers();
}
