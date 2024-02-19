import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

class StoryVideoTextEditor extends StatefulWidget {
  const StoryVideoTextEditor({super.key});

  @override
  _StoryVideoTextEditorState createState() => _StoryVideoTextEditorState();
}

class _StoryVideoTextEditorState extends State<StoryVideoTextEditor> {
  final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];
  TextStyle _textStyle = const TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'Billabong',
  );
  String _text = '';
  TextAlign _textAlign = TextAlign.center;

  void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: TextEditor(
                fonts: fonts,
                text: text,
                textStyle: textStyle,
                textAlingment: textAlign,
                minFontSize: 10,
                onEditCompleted: (style, align, text) {
                  setState(() {
                    _text = text;
                    _textStyle = style;
                    _textAlign = align;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => _tapHandler(_text, _textStyle, _textAlign),
        onPanUpdate: (details) {
          setState(() {
            top += details.delta.dy;
            left += details.delta.dx;
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Text(
            _text,
            style: _textStyle,
            textAlign: _textAlign,
          ),
        ),
      ),
    );
  }
}
