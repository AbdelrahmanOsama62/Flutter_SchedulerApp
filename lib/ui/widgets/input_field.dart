import 'package:flutter/cupertino.dart';
import 'package:schedulerapp/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Themes().TitleStyle,),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            height: 52,
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 17,
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Get.isDarkMode? Colors.grey[100]:Colors.grey[700],
                    controller: controller,
                    style: Themes().SubTitleStyle,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: hint,
                      hintStyle: Themes().SubTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor,
                              width: 0
                          )
                      ),
                    ),
                  ),
                ),
                widget==null?Container():Container(child: widget,)
              ],
            ),

          )
          

        ],
      ),
    );
  }
}
