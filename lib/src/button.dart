import 'package:flutter/material.dart';
import 'package:onscreen_keyboard/src/button_widget.dart';

class Button extends StatefulWidget {
  final Function? onPressed;
  final Widget label;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? focusColor;
  final bool? autofocus;
  final Function? onTapDown;
  final Function? onTapUp;
  final Function? onTapCancel;
  Button({
    required this.label,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onPressed,
    this.autofocus,
    this.borderColor,
    this.focusColor,
    this.buttonColor,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  FocusNode? _node;

  @override
  void initState() {
    _node = new FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent details) {
        widget.onTapDown!();
      },
      onPointerUp: (PointerUpEvent details) {
        widget.onTapUp!();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
      margin: EdgeInsets.all(2),
      child: RawMaterialButton(
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        autofocus: widget.autofocus ?? widget.autofocus!,
        fillColor: widget.buttonColor ?? widget.buttonColor,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        focusColor: widget.focusColor ?? widget.focusColor,
        focusNode: _node,
        onPressed: () {
          widget.onPressed!();
        },
        child: new ButtonWidget(
          label: widget.label,
        ),
      ),
    ),
    );
  }
}
