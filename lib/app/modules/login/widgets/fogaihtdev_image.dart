import 'package:flutter/material.dart';

class FogaihtDevImage extends StatelessWidget {
  final MainAxisAlignment alignment;

  const FogaihtDevImage({Key key, @required this.alignment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Image.asset(
            "assets/FogaihtDev.png",
            fit: BoxFit.contain,
            width: (_widthSize * 0.2),
          ),
        ],
      ),
    );
  }
}
