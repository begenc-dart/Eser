import 'package:mobx/mobx.dart';
part 'bottom_controller.g.dart';

class BottomController = _BottomControllerBase with _$BottomController;

abstract class _BottomControllerBase with Store {
  @observable
  int index= 0 ;
  @action
  changeIndex(int realIndex){
    index= realIndex;
  }
}