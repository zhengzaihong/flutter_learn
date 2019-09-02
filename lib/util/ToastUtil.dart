import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastUtil{

    static void  show(String info) {

        Fluttertoast.showToast(
            msg:info,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
    }

    static String name = "";

}