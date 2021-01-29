import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/sub_states.dart';
import 'state_button.dart';

class LoginSignUpButton extends StatefulWidget {
  final SubState subState;
  final String firstLabel;
  final String secondLabel;
  final Function firstOnTap;
  final Function secondOnTap;

  const LoginSignUpButton({
    Key key,
    @required this.subState,
    @required this.firstLabel,
    @required this.secondLabel,
    @required this.firstOnTap,
    @required this.secondOnTap,
  }) : super(key: key);

  @override
  _LoginSignUpButtonState createState() => _LoginSignUpButtonState();
}

class _LoginSignUpButtonState extends State<LoginSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: widget.subState == SubState.start ? 1 : 0,
            child: StateButton(
              subState: widget.subState,
              onTap: widget.firstOnTap,
              secondaryColor: Colors.red,
              primaryColor: Colors.white,
              textLabel: Text(
                widget.firstLabel,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
            child: Row(
              children: [
                Flexible(child: Divider(color: Colors.white, thickness: 1.0)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: _stateButton(),
                ),
                Flexible(child: Divider(color: Colors.white, thickness: 1.0)),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: widget.subState == SubState.start ? 1 : 0,
            child: StateButton(
              subState: widget.subState,
              secondaryColor: Colors.red,
              primaryColor: Colors.red,
              borderColor: Colors.white,
              textLabel: Text(
                widget.secondLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: widget.secondOnTap,
            ),
          ),
          SizedBox(height: 32.0)
        ],
      ),
    );
  }

  Widget _stateButton() {
    switch (widget.subState) {
      case SubState.start:
        return Text(
          "or",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        );
      case SubState.loading:
        return SpinKitRing(
          color: Colors.white,
          lineWidth: 3.0,
          size: 40,
        );
      case SubState.success:
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
        );
      case SubState.error:
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
        );
      default:
        return SizedBox();
    }
  }
}
