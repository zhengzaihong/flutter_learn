    import 'package:flutter/foundation.dart';
    import 'package:flutter/material.dart';

    /// creat_user: zhengzaihong
    /// Email:1096877329@qq.com
    /// creat_date: 2019/8/28
    /// creat_time: 11:35
    /// describe 实现带有监听回调的 Drawer

    class AutoDrawer extends StatefulWidget {
      final double elevation;
      final Widget child;
      final String semanticLabel;

      //定义显示宽度百分百比 默认60%
      final double widthPercent;
      final DrawerCallback callback;

      AutoDrawer({
        Key key,
        this.elevation = 16.0,
        this.child,
        this.semanticLabel,
        this.widthPercent = 0.6,
        this.callback,
      }) : super(key: key);

      @override
      _AutoDrawerState createState() => _AutoDrawerState();
    }

    class _AutoDrawerState extends State<AutoDrawer> {
      @override
      void initState() {
        if (widget.callback != null) {
          //打开侧边栏 触发
          widget.callback(true);
        }
        super.initState();
      }

      @override
      void dispose() {
        if (widget.callback != null) {
          // 关闭侧边栏触发
          widget.callback(false);
        }
        super.dispose();
      }

      @override
      Widget build(BuildContext context) {
        assert(debugCheckHasMaterialLocalizations(context));
        String label = widget.semanticLabel;
        switch (defaultTargetPlatform) {
          case TargetPlatform.iOS:
            label = widget.semanticLabel;
            break;
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            label = widget.semanticLabel ??
                MaterialLocalizations.of(context)?.drawerLabel;
        }
        final double _width =
            MediaQuery.of(context).size.width * widget.widthPercent;
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          label: label,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(width: _width),
            child: Material(
              elevation: widget.elevation,
              child: widget.child,
            ),
          ),
        );
      }
    }
