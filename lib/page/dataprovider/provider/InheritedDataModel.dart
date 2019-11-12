

// 用于保存数据的Mode
import 'package:flutter_learn/page/dataprovider/provider/listener/ChangeListener.dart';

class InheritedDataModel extends ChangeListener {


   void addValue(int value){

      notifyListeners();

      print(value);
   }

}