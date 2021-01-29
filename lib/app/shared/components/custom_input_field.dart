import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomInputField extends StatefulWidget {
  final bool isPasswordField;
  final bool isEmailField;
  final bool isNormalField;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final Function(String) validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget suffixIcon;

  const CustomInputField({
    Key key,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.isNormalField = true,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  })  : assert(isNormalField || isPasswordField || isEmailField),
        super(key: key);
  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: Colors.yellow,
      cursorHeight: 25.0,
      cursorWidth: 2.5,
      obscureText: widget.isPasswordField ? !showPassword : showPassword,
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        prefixIcon: widget.prefixIcon != null
            ? widget.prefixIcon
            : widget.isPasswordField
                ? Icon(MdiIcons.lockOutline)
                : widget.isEmailField
                    ? Icon(MdiIcons.emailOutline)
                    : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        errorMaxLines: 3,
        suffixIcon: widget.suffixIcon != null
            ? widget.suffixIcon
            : widget.isPasswordField
                ? InkWell(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(showPassword ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline),
                  )
                : null,
      ),
    );
  }
}
