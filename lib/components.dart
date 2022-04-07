import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'bloc/tasks_cubit.dart';

Widget tasksListView( [  List<Map<dynamic, dynamic>>? list, TasksCubit? cubit ,] ){
  return ListView.builder(
    itemCount: list!.length,
    itemBuilder: (context,index) =>Dismissible(
      key: Key(
        list[index]["id"].toString()
      ),
      onDismissed: (direction){
        if(direction == DismissDirection.endToStart){

        }
        if(direction == DismissDirection.startToEnd){

        }
       cubit!.deleteTasks(task: list[index]);
      },
      background: Container(
        color: Colors.green,
        child: Icon(
          Icons.check,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Icon(
          Icons.cancel,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("${list[index]['title']}",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                ),
                IconButton(onPressed: (){
                  TasksCubit.get(context).updateTasks(status: "done",taskid: list[index]["id"]);
                },
                    icon: Icon(Icons.done,color: Colors.blue,)),
                IconButton(onPressed: (){
                  TasksCubit.get(context).updateTasks(status: "archive",taskid: list[index]["id"]);
                },
                    icon: Icon(Icons.archive,color: Colors.blue,)),
              ],
            ),
            Row(
              children: [
                Text(
                  'Date:${list[index]['date']}',
                  style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),),
                Spacer(),
                Text(
                  'Time${list[index]['time']}',
                  style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}























Widget myTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
  bool passwordVisible = false,
  TextInputType textInputType = TextInputType.text,
  required String label,
  required IconData prefixIcon,
  Widget? suffixIcon,
  GestureTapCallback? onTap,
  TextInputAction? textInputAction,
  ValueChanged<String>? onFieldSubmitted
}) {
  return TextFormField(
    onTap: onTap,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    obscureText: passwordVisible,
    controller: controller,
    keyboardType: textInputType,
    textInputAction: textInputAction,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon),
  );
}






var titleController=TextEditingController();
var ImageController=TextEditingController();
var PriceController=TextEditingController();
var dateController=TextEditingController();
var timeController=TextEditingController();
var formkey= GlobalKey<FormState>();
int bottomNavigationIndex=0;
bool isBottomSheetExpanded = false ;
var Scaffoldkey= GlobalKey<ScaffoldState>();
Widget defaultFloating({

required FormFieldValidator<String> validator,


})=> SingleChildScrollView(
  child:   FloatingActionButton(

    onPressed: (){

      if(isBottomSheetExpanded){

        if (formkey.currentState!.validate()){

          String title= titleController.text;

          String Image=ImageController.text;

          String Price=PriceController.text;

          isBottomSheetExpanded = false ;

        }



      }

      else{

        Scaffoldkey.currentState!.showBottomSheet((context) =>  buildBottomitemSheet(context))

            .closed.

        then((value) {

          isBottomSheetExpanded = false;

          ImageController.text="";

          titleController.text="";

          PriceController.text="";



        });



        isBottomSheetExpanded = true ;

      }





    },

    child:  isBottomSheetExpanded ? Icon(Icons.add,) :  Icon(Icons.edit,),

  ),
);


buildBottomitemSheet(context) {
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    child: Form(
      key:formkey ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value)=> validator(value!),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'title',
              prefixIcon: Icon(Icons.title,),
            ),
            controller: titleController,

          ),
          SizedBox(height: 10.0,),
          TextFormField(
            validator: (value)=>validator(value!),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'price',
              prefixIcon: Icon(Icons.money,),
            ),
            controller: PriceController,
            keyboardType: TextInputType.phone,
            onTap: (){
              print('price Tapped');

            },
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            validator: (value)=>validator(value!),

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Image',
              prefixIcon: Icon(Icons.image,),
            ),
            controller: ImageController,
            onTap: (){
              print('iMAGE Tapped');

            },
          ),
        ],),
    ),
  );
}
void _pickDateDialog(context) {
  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //which date will display when user open the picker
      firstDate: DateTime(1950),
      //what will be the previous supported year in picker
      lastDate: DateTime(2022)) //what will be the up to supported date in picker
      .then((pickedDate) {
    //then usually do the future job
    print('Date picker dialog');
    if (pickedDate == null) {
      //if user tap cancel then this function will stop
      return;
    }
    print(pickedDate.toString().split(" ")[0]);
    dateController.text= pickedDate.toString().split(" ")[0];

  });
}
void _picktimeDialog(context) async {
  TimeOfDay initialTime = TimeOfDay.now();
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
    builder: (BuildContext context, Widget? child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      );
    },
  );
  print('time picker');
  String realhour= (pickedTime!.hour >12)? "${pickedTime.hour -12}:${pickedTime.minute} PM"
      :"${pickedTime.hour }:${pickedTime.minute} AM";

  String time="${realhour}";
  timeController.text=time;

}



String? validator(String value){
  if(value.isEmpty){
    return "Required";
  }
  return null;
}


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: (){},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: (){},
      child: Text(
        text.toUpperCase(),
      ),
    );


Widget ButtonWidget(
    {required VoidCallback onPressed,
      required String texts,
      Color backgroundColor = Colors.blue,
      double height = 50,
      double width = 400}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      texts,
      maxLines: 1,
    ),
    style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: Size(width, height)),
  );
}

Widget myshopTextFormField(
    {required String label,
      required FormFieldValidator<String>? validator,
      required TextEditingController? controller,
      required IconData? prefixIcon,
      Widget? suffixIcon,
      bool obscureText=false,
      TextInputAction textInputAction = TextInputAction.next,
      TextInputType keyboardType = TextInputType.name,
    }) {
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: obscureText,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(fontSize: 18.sp),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.sp)),
        prefixIcon: Icon(prefixIcon, size: 22.sp,),
        suffixIcon: suffixIcon),
  );
}