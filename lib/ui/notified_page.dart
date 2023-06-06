import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schedulerapp/ui/theme.dart';

class NotifiedPage extends StatelessWidget {
  final String? label;
  const NotifiedPage({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.label.toString().split("|")[4] == "1"? pinkclr:
      this.label.toString().split("|")[4] == "2"?yellowclr:
        this.label.toString().split("|")[4] == "0"?prcolor:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.white:Colors.white,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon:Icon(Icons.arrow_back_ios,
          color: Get.isDarkMode?Colors.white:Colors.grey,
          ),
        ),
      title: Text(this.label.toString().split("|")[0],style: TextStyle(color: Colors.black,fontSize: 35),),
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            color: Get.isDarkMode?Colors.white:Colors.white
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text(this.label.toString().split("|")[1],style: TextStyle(
                    color: Get.isDarkMode?Colors.black:Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 80,),
                Text("Start time",style: TextStyle(
                    color: Get.isDarkMode?Colors.black:Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w500
                ),),
                Text(this.label.toString().split("|")[2],style: TextStyle(
                    color: Get.isDarkMode?Colors.grey[700]:Colors.grey[700],
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 35,),

                Text("End time",style: TextStyle(
                    color: Get.isDarkMode?Colors.black:Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w500
                ),),
                Text(this.label.toString().split("|")[3],style: TextStyle(
                    color: Get.isDarkMode?Colors.grey[700]:Colors.grey[700],
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),),
              ],
            )
          )
        ),
      )
    );
  }
}
