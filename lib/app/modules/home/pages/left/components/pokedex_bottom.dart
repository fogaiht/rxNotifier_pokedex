import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PokedexBottom extends StatefulWidget {
  final Function onRightTap;
  final Function onLeftTap;
  final Function scanQrCode;
  final Function selectPokemon;

  const PokedexBottom({
    Key key,
    this.onRightTap,
    this.onLeftTap,
    this.scanQrCode,
    this.selectPokemon,
  }) : super(key: key);
  @override
  _PokedexBottomState createState() => _PokedexBottomState();
}

class _PokedexBottomState extends State<PokedexBottom> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height * 0.23;

    return Container(
      height: heightSize,
      width: widthSize,
      decoration: BoxDecoration(
          color: Color(0xffE51D20),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(heightSize * 0.125),
            bottomLeft: Radius.circular(heightSize * 0.125),
          )),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: heightSize * 0.01,
            right: widthSize * 0.1,
            child: ClipPath(
              clipper: ClipPlus(),
              child: Container(
                width: widthSize * 0.317,
                height: widthSize * 0.317,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.3,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: heightSize,
                  width: widthSize,
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: widthSize * 0.106,
            child: ClipPath(
              clipper: ClipPlus(),
              child: Container(
                width: widthSize * 0.317,
                height: widthSize * 0.317,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          Positioned(
            top: widthSize * 0.106,
            right: widthSize * 0.106,
            child: GestureDetector(
              onTap: widget.onRightTap,
              child: Container(
                width: widthSize * 0.106,
                height: widthSize * 0.106,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: widthSize * 0.106,
                )),
              ),
            ),
          ),
          Positioned(
            top: widthSize * 0.106,
            right: widthSize * 0.106 * 3,
            child: GestureDetector(
              onTap: widget.onLeftTap,
              child: Container(
                width: widthSize * 0.106,
                height: widthSize * 0.106,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: widthSize * 0.106,
                )),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.4,
            left: widthSize * 0.253,
            child: GestureDetector(
              onTap: widget.scanQrCode,
              child: Container(
                width: widthSize * 0.286,
                height: heightSize * 0.37,
                child: Icon(
                  MdiIcons.qrcode,
                  size: heightSize * 0.236,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.green[300]),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(1.0, 3.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: widthSize * 0.106,
            top: 0,
            child: GestureDetector(
              onTap: widget.selectPokemon,
              child: Container(
                height: heightSize * 0.236,
                width: heightSize * 0.236,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPlus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 3, 0.0);
    path.lineTo(size.width / 3, size.height / 3);
    path.lineTo(0.0, size.height / 3);
    path.lineTo(0.0, 2 * (size.height / 3));
    path.lineTo(size.width / 3, 2 * (size.height / 3));
    path.lineTo(size.width / 3, size.height);
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height));
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height / 3));
    path.lineTo((size.width), 2 * (size.height / 3));
    path.lineTo((size.width), (size.height / 3));
    path.lineTo(2 * (size.width / 3), (size.height / 3));
    path.lineTo(2 * (size.width / 3), 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class Mask extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var qrHole = RRect.fromLTRBR(
      size.width * .085,
      size.height * .16,
      size.width * .91,
      size.height * .69,
      Radius.circular(10),
    );

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0, size.height * 1)
      ..lineTo(size.width * 1, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0)
      ..fillType = PathFillType.evenOdd
      ..addRRect(qrHole);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
