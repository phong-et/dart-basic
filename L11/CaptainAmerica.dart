import 'Avenger.dart';
import 'Thor.dart';
class CaptainAmerica extends Avenger implements Thor {
  CaptainAmerica({String name, String sexual})
      : super.forExtendConstructor(
          name: name,
          sexual: sexual
        );
  @override
  void doSkill() {
    print('=====> Bảo vệ hòa bình thế giới =)) <=====');
  }

  void fetchMjolnir(){
    print('Captain Amarica implements Thor\'s fetchMjolnir function here...');
  }
}
