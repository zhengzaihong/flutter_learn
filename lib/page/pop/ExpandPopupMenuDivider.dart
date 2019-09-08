import 'package:flutter/material.dart';

const double _kMenuDividerHeight = 16.0;

/*
 *creat_user: zhengzaihong
 *email:1096877329@qq.com
 *creat_date: 2019/9/8 0008
 *creat_time: 21:29
 *describe: 自定义分割线
 **/


class ExpandPopupMenuDivider<T> extends PopupMenuEntry<T> {
  /// Creates a horizontal divider for a popup menu.
  ///
  /// By default, the divider has a height of 16 logical pixels.
  const ExpandPopupMenuDivider({
    Key key,
    this.height = _kMenuDividerHeight,
    this.color,
  })
      : super(key: key);

  /// The height of the divider entry.
  ///
  /// Defaults to 16 pixels.
  final double height;

  final Color color;

  @override
  bool represents(void value) => false;

@override
_ExpandPopupMenuDividerState createState() => _ExpandPopupMenuDividerState(height,color);
}

class _ExpandPopupMenuDividerState extends State<ExpandPopupMenuDivider> {

   double height;

   Color color;

  _ExpandPopupMenuDividerState(this.height,this.color);

  @override
  Widget build(BuildContext context) => Divider(height: height,color: color);
}
