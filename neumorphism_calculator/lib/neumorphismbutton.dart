import 'package:flutter/material.dart';
import 'dart:async';

class NeumorphismButton extends StatefulWidget {
  final Function(String) onPressed;
  final Color colortext;
  final child;
  final shape;
  final borderR;

  NeumorphismButton({
    required this.onPressed,
    required this.colortext,
    required this.child,
    required this.shape,
    this.borderR,
  });

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonPressed();
        widget.onPressed(widget.child.toString());
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Center(
          child: Text(
            widget.child.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isButtonPressed
                  ? widget.colortext.withOpacity(0.5)
                  : widget.colortext.withOpacity(0.8),
              fontSize: 25,
            ),
          ),
        ),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: widget.borderR,
          border: Border.all(
            color: isButtonPressed
                ? Colors.grey.shade400
                : Colors.grey.shade300,
          ),
          shape: widget.shape,
          boxShadow: isButtonPressed
              ? []
              : [
            BoxShadow(
              color: Colors.grey.shade600,
              offset: Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-6, -6),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    setState(() {
      isButtonPressed = true;
    });

    Timer(Duration(milliseconds: 300), () {
      setState(() {
        isButtonPressed = false;
      });
    });
  }
}


