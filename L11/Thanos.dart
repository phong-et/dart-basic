import 'Avenger.dart';
class Thanos extends Avenger {
  Thanos({String name, String sexual})
      : super.forExtendConstructor(name: name, sexual: sexual){
      }
  @override
  void doSkill() {
    print('===> Búng tay quỷ khóc thần sầu <=== ');
  }
}
