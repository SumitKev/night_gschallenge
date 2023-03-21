import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
class CountDownProvider extends ChangeNotifier{

  final CountDownController controller = new CountDownController();
  bool isPause = false;

  void start(){
    controller.start();
    isPause =false;
    notifyListeners();
  }

  void pause(){
    controller.pause();
    isPause=true;
    notifyListeners();
  }
  void resume(){
    controller.resume();
    isPause = false;
    notifyListeners();
  }
  void restart(){
    controller.restart();
    isPause = false;
    notifyListeners();
  }
  

}