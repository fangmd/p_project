import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/widget/sticker/sticker_c.dart';
import 'package:p_project/widget/sticker/sticker_data.dart';
import 'package:p_project/widget/sticker/sticker_utils.dart';

class StickerPage extends BasePage {
  static const routeName = '/sticker';
  StickerPage({Key key}) : super(key: key);

  @override
  _StickerPageState createState() => _StickerPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _StickerPageState extends State<StickerPage> {
  List<Sticker> emojisData;
  TextEditingController _textC = TextEditingController();

  String showContent = '';

  @override
  void initState() {
    emojisData = StickerData.getDmGifData();
    super.initState();
  }

  @override
  void dispose() {
    _textC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sticker')),
      body: Column(
        children: <Widget>[
          StickerUtils.createRichText(showContent),
          TextField(
            controller: _textC,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emojisData.length,
              itemBuilder: (context, index) {
                final img = emojisData[index].img;
                final text = emojisData[index].zhName;
                if (index == 0) {
                  return Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          if (_textC.text.isEmpty) return;
                          if (_textC.text.endsWith(']')) {
                            final c = _textC.text;
                            final endIndex = c.lastIndexOf('[');
                            _textC.text = c.substring(0, endIndex);
                          } else {
                            _textC.text = _textC.text
                                .substring(0, _textC.text.length - 1);
                          }
                        },
                        child: Text('Delete'),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            showContent = _textC.text;
                          });
                        },
                        child: Text('Send'),
                      ),
                    ],
                  );
                }

                return InkWell(
                  onTap: () {
                    _textC.text = '${_textC.text}$text';
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(img, width: 24, height: 24),
                      Text(text)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
