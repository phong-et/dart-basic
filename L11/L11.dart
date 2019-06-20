import 'Avenger.dart';
import 'Thor.dart';

const List<String> urlAvengers = [
  'https://blogspotscraping.herokuapp.com/avengers/Thor.json',
  'https://blogspotscraping.herokuapp.com/avengers/Thanos.json',
  'https://blogspotscraping.herokuapp.com/avengers/CaptainAmerica.json',
];

void fetchAvengers() {
  for (final url in urlAvengers) {
    Avengers.fetchAvenger(url)
        .then((onValue) => print(onValue["Avenger"]["name"]));
  }
}

Future<dynamic> createAvengers() async {
  for (final url in urlAvengers) {
    var jsonAvenger = await Avengers.fetchAvenger(url);
    jsonAvenger = jsonAvenger["Avenger"];
    String name = jsonAvenger["name"];
    String sexual = jsonAvenger["sexual"];
    String type = Avengers.getFileNameFromURL(url);
    Avenger avenger = Avenger(type: type, name: name, sexual: sexual);
    avenger.showInfo();
  }
}

void createAvengers2() {
  for (final url in urlAvengers) {
    Avengers.fetchAvenger(url).then((jsonAvenger) {
      jsonAvenger = jsonAvenger["Avenger"];
      String name = jsonAvenger["name"];
      String sexual = jsonAvenger["sexual"];
      String type = Avengers.getFileNameFromURL(url);
      Avenger avenger = Avenger(type: type, name: name, sexual: sexual);
      avenger.showInfo();
    });
  }
}

void createAvengersRecursive(int i) {
  String url = urlAvengers[i];
  Avengers.fetchAvenger(url).then((jsonAvenger) {
    jsonAvenger = jsonAvenger["Avenger"];
    String name = jsonAvenger["name"];
    String sexual = jsonAvenger["sexual"];
    String type = Avengers.getFileNameFromURL(url);
    Avenger avenger = Avenger(type: type, name: name, sexual: sexual);
    avenger.showInfo();
    i++;
    if (i < urlAvengers.length) {
      createAvengersRecursive(i);
    } else {
      print('Done');
    }
  });
}

void main() async {
  // =========== Test ===========
  //fetchAvengers();
  //print(Avengers.getFileNameFromURL(urlAvengers[0]));

  // =========== Method 1( use Future then 1st) ===========
  // print('============ Named factory constructor ============');
  // Avenger.fromURL(urlAvengers[2]);
  // Future.delayed(Duration(seconds: 3), () => {
  //   print('============ Call Default Factory Constructor Orderly ============'),
  //   createAvengers()
  // });

  // =========== Method 2( use Future async await 1st) ===========
  print(
      '============ L11.2 - Call Default Factory Constructor Orderly ============');
  //await createAvengers();
  createAvengers2();
  // print('============ L11.1 - Named factory constructor ============');
  // Avenger.fromURL(urlAvengers[2]);
  //print('============ L11.3 - Recursive ============');
  //createAvengersRecursive(0);
}
