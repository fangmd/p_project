import 'package:flutter/material.dart';
import 'package:p_project/utils/logger.dart';

class TextWidget extends StatefulWidget {
  final String name;
  TextWidget({Key key, this.name}) : super(key: key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  int last = 0;
  int count = 0;
  int systemTime = 0;
  int lastTime = 0;
  @override
  void initState() {
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    //   // 一个页面渲染总时间
    //   count += timeStamp.inMilliseconds - last;

    //   lastTime = timeStamp.inMilliseconds;
    //   Logger.d(
    //       msg: '${(timeStamp.inMilliseconds - last) / 1000}ms'); // >16000 ms
    //   last = timeStamp.inMilliseconds;
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // WidgetsBinding.instance.addObserver(this);
    print('_TextWidgetState didChangeDependencies');

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(TextWidget oldWidget) {
    print('_TextWidgetState didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('_TextWidgetState deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('_TextWidgetState build');
    return Container(
      child: Text('${widget.name}'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class NameText extends StatelessWidget {
  const NameText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('12'),
    );
  }
}
