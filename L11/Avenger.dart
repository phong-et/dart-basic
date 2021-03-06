import 'CaptainAmerica.dart';
import 'Thanos.dart';
import 'Thor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:io';
import 'package:path/path.dart';

abstract class Avenger {
  String name;
  String sexual;
  Avenger.forExtendConstructor({String name = "Avenger", String sexual = "Unkown"}) {
    this.name = name;
    this.sexual = sexual;
  }
  void showInfo() {
    print('------ Info ------');
    print('Name: $name');
    print('Sexual: $sexual');
  }
  
  factory Avenger({String type, String name = "Avenger", String sexual = "Unkown"}){
    dynamic avenger;
    switch(type){
      case Avengers.Thanos:  avenger = Thanos(name:name, sexual: sexual); break;
      case Avengers.Thor:  avenger = Thor(name:name, sexual: sexual); break;
      case Avengers.CaptainAmerica:  avenger = CaptainAmerica(name:name, sexual: sexual); break;
    }
    return avenger;
  }
  factory Avenger.fromURL(String url) {
    //print(url);
    String type = Avengers.getFileNameFromURL(url);
    //print(type);
    Avenger avenger;
    Avengers.fetchAvenger(url).then((jsonAvenger) {
      jsonAvenger = jsonAvenger["Avenger"];
      //print(jsonAvenger);
      String name = jsonAvenger["name"];
      String sexual = jsonAvenger["sexual"];
      //print("$name $sexual");
      switch(type){
        case Avengers.Thanos:  avenger = Thanos(name:name, sexual: sexual); break;
        case Avengers.Thor:  avenger = Thor(name:name, sexual: sexual); break;
        case Avengers.CaptainAmerica:  avenger = CaptainAmerica(name:name, sexual: sexual); break;
      }
      avenger.showInfo();
      return avenger;
    });
    return avenger;   
  }
  void doSkill();
}
class Avengers {
  static const String Thanos = 'Thanos';
  static const String CaptainAmerica = 'CaptainAmerica';
  static const String Thor = 'Thor';
  static Future<dynamic> fetchAvenger(url) async {
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
  }
  static String getFileNameFromURL(url){
    File file = new File(url);
    String fileName = basename(file.path);
    fileName = fileName.substring(0, fileName.length - 5);
    return fileName;
  }
}
