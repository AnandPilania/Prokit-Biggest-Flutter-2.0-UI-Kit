import 'package:flutter/material.dart';
import 'package:prokit_flutter/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

Container LearnerEditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 40, showShadow: true, bgColor: learner_white),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: learner_white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
      ),
    ),
  );
}

class LearnerButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  LearnerButton({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return T9ButtonState();
  }
}

class T9ButtonState extends State<LearnerButton> {
  @override
  Widget build(BuildContext context) {
    return
      RaisedButton(
        onPressed: widget.onPressed,
        textColor: learner_white,
        elevation: 4,
        color: learner_colorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget>? createState() {
    // TODO: implement createState
    return null;
  }
}
