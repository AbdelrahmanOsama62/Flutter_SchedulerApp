import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schedulerapp/ui/theme.dart';
import 'package:schedulerapp/ui/widgets/input_field.dart';
import 'package:intl/intl.dart';
import 'package:schedulerapp/ui/widgets/button.dart';
import 'package:schedulerapp/models/task.dart';
import 'package:schedulerapp/controllers/task_controller.dart';
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List <int> remindList=[
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = "None";
  List <String> repeatList=[
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Task",
                  style: Themes().HeadingStyle,),
                MyInputField(title: "Title", hint: "Enter your title",controller: _titleController,),
                MyInputField(title: "Note", hint: "Enter your note",controller: _noteController,),
                MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: (){
                    _getDateFromUser();
                  },
                  icon: Icon(Icons.calendar_today_rounded,
                  color: Colors.grey,),
                ),),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(title: "Start Date", hint:_startTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUse(isStartTime: true);
                          },
                          icon: Icon(Icons.access_time_rounded,color: Colors.grey,),
                        ),),
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: MyInputField(title: "End Date", hint:_endTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUse(isStartTime: false);
                          },
                          icon: Icon(Icons.access_time_rounded,color: Colors.grey,),
                        ),),
                    ),
                  ],
                ),
                MyInputField(title: "Remind", hint: "$_selectedRemind minutes early",
                widget: DropdownButton(
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedRemind=int.parse(newValue!);
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                  iconSize: 32,
                  underline: Container(height: 0,),
                  elevation: 4,
                  style: Themes().SubTitleStyle,
                  items: remindList.map<DropdownMenuItem<String>>((int value){
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );

                  }
                  ).toList(),
                ),
                ),
                MyInputField(title: "Repeat", hint: "$_selectedRepeat",
                  widget: DropdownButton(
                    onChanged: (String? newValue){
                      setState(() {
                        _selectedRepeat=newValue!;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                    iconSize: 32,
                    underline: Container(height: 0,),
                    elevation: 4,
                    style: Themes().SubTitleStyle,
                    items: repeatList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.grey),),
                      );

                    }
                    ).toList(),
                  ),
                ),
                SizedBox(height: 18.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _colorPallete(),
                    MyButton(label: "Create Task", onTap: ()=>_validateDate())
                  ],
                )

              ],
            ),
          )
      ),
    );
  }
_validateDate(){
  if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
    _addTaskToDb();
    Get.back();
  }else if(_titleController.text.isEmpty||_noteController.text.isEmpty){
    Get.snackbar("Required", "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: pinkclr,
        backgroundColor: Colors.white,
        icon: Icon(Icons.warning_amber_rounded,color: pinkclr,),
    );
  }
}
_addTaskToDb()async{
  int value = await _taskController.addTask(
        task:Task(
          note:_noteController.text,
          title:_titleController.text,
          date:DateFormat.yMd().format(_selectedDate),
          startTime:_startTime,
          endTime:_endTime,
          remind:_selectedRemind,
          repeat:_selectedRepeat,
          color: _selectedColor,
          isCompleted:0,
        )
    );
  print("MY id is " + "$value");
  print("MY Date is " + DateFormat.yMd().format(_selectedDate));
}
_colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: Themes().TitleStyle,),
        SizedBox(height: 8.0,),
        Wrap(
          children: List<Widget>.generate(
              3,
                  (int index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedColor=index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0? prcolor:index==1?pinkclr:yellowclr,
                      child: _selectedColor==index?Icon(Icons.done,size: 16,color: Colors.white,):Container(),
                    ),
                  ),
                );
              }),
        )
      ],
    );
}
_appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode? Colors.white:Colors.black,),
      ),
      actions: [
        CircleAvatar(backgroundImage: AssetImage("images/profile.png"),),
        SizedBox(width: 20,)
      ],
    );
  }
_getDateFromUser()async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if(_pickerDate!=null){
      setState((){
        _selectedDate = _pickerDate;
      });
    }else{
      print("it's null or something is wrong");
    }
  }
_getTimeFromUse({required bool isStartTime})async {
  var pickedTime = await _showTimePicker();
  String _formatedTime = pickedTime.format(context);
  if(pickedTime==null){
    print("canceled");
  }else if(isStartTime==true){
    setState(() {
      _startTime=_formatedTime;
    });
  }else if(isStartTime==false){
    setState(() {
      _endTime=_formatedTime;
    });
  }
}
_showTimePicker(){
 return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0])
      ));
}
}




