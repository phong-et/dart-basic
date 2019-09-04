import 'Avenger.dart';
class Thor extends Avenger {
  Thor({String name, String sexual})
      : super.forExtendConstructor(name: name, sexual: sexual){
      }
  @override
  void doSkill() {
    print('Thor\'s Skill');
  }
  void fetchMjolnir(){
    doSkill();
  }
}
