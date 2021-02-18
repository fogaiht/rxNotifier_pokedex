import 'package:flutter/material.dart';

class BaseStatsRow extends StatelessWidget {
  final String label;
  final int statValue;

  const BaseStatsRow({Key key, this.label, this.statValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.9;
    double heightSize = MediaQuery.of(context).size.height * 0.9;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: widthSize * 0.3,
          child: Text(
            label,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: heightSize * 0.023,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: widthSize * 0.2,
          child: Text(
            statValue.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: heightSize * 0.023,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              width: widthSize * 0.4,
              height: heightSize * 0.025,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: widthSize * 0.4 * ((statValue > 100 ? 100 : statValue) / 100),
              height: heightSize * 0.025,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.black),
                  bottom: BorderSide(width: 0.5, color: Colors.black),
                  left: BorderSide(width: 0.5, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
