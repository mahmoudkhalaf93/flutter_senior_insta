import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/resturant/admin_screen.dart';

class BookingScreen extends StatefulWidget {


  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var formkey= GlobalKey<FormState>();
  var dateController=TextEditingController();
  var timeController=TextEditingController();
  var durationController=TextEditingController();
  var FoodController=TextEditingController();
  var ChairsController=TextEditingController();
  var TablesController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Booking'),
        backgroundColor: Colors.amber,


      ),
      body: SingleChildScrollView(
        child: Container(

          child: buildBottomitemSheet(),
        ),
      ) ,

    );
  }
  buildBottomitemSheet() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Form(
        key:formkey ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //date
            TextFormField(

              validator: (value)=>validator(value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'date',
                prefixIcon: Icon(Icons.date_range,),
              ),
              controller: dateController,
              keyboardType: TextInputType.none,
              onTap: (){
                print('Date Tapped');
                _pickDateDialog();
              },
            ),
            SizedBox(height: 20.0,),
            //time
            TextFormField(
              validator: (value)=>validator(value!),

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'time',
                prefixIcon: Icon(Icons.timer_outlined,),
              ),
              controller: timeController,
              keyboardType: TextInputType.none,
              onTap: (){
                print('time Tapped');
                _picktimeDialog();
              },
            ),
            SizedBox(height: 20.0,),
            //Duration
            TextFormField(
              validator: (value)=>validator(value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                labelText: 'Duration',
                prefixIcon: Icon(Icons.access_alarms_outlined,),
              ),
              controller: durationController,
              keyboardType: TextInputType.phone,
              onTap: (){
                print('Duration Tapped');
              },
            ),
            SizedBox(height: 20.0,),
            //TYPE OF FOOD
            TextFormField(
              validator: (value)=>validator(value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                labelText: 'Food Type',
                prefixIcon: Icon(Icons.restaurant,),
              ),
              controller: FoodController,
              onTap: (){
                print('Food Tapped');
              },
            ),
            SizedBox(height: 20.0,),
            //No of chairs
            TextFormField(
              validator: (value)=>validator(value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                labelText: 'Chairs Number',
                prefixIcon: Icon(Icons.chair,),
              ),
              controller: ChairsController,
              keyboardType: TextInputType.phone,
              onTap: (){
                print('Chairs Tapped');
              },
            ),
            SizedBox(height: 20.0,),
            //No of tables
            TextFormField(
              validator: (value)=>validator(value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                labelText: 'Tables Number',
                prefixIcon: Icon(Icons.airline_seat_recline_normal_sharp,),
              ),
              controller: TablesController,
              keyboardType: TextInputType.phone,
              onTap: (){
                print('tables Tapped');
              },
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(onPressed: (){
                  if (formkey.currentState!.validate()){
                    print('Ok');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReservationScreen()
                      ),
                    );}
                },
                  color: Colors.amber,
                  child: Text('ok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  textColor: Colors.white,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(2018),
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
  void _picktimeDialog() async {
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
}
