import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callBack;
  const CalButton({Key key, this.text, this.fillColor, this.textColor=0xFFFFFFFF, this.textSize=28, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          onPressed: () {
            callBack(text);
          },
          color: fillColor != null ? Color(fillColor):null,
          textColor: Color(textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),

          ),
        ),
      ),
    );
  }
}
