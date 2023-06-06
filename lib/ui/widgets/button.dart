import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:schedulerapp/ui/theme.dart';
class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String label;
  const MyButton({Key? key,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color: prcolor,

        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
