import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/select-vehicle.dart';
import 'package:paddylift/style/color.dart';

import 'common/date.dart';
import 'common/progress.dart';

class DateTimeScreen extends StatefulWidget {
  @override
  _DateTimeScreenState createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  String _date = "Choose Departure Date";
  String _time = "Choose Departure Time";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE A TRIP"),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/calendar.png",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Choose Date & Time",
                      style: TextStyle(fontSize: 20.0)),
                ),
                CustomProgressIndicator(
                  itemCount: 5,
                  step: 5,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65 - 80,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SELECT DATE",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                InkWell(
                  onTap: () {
                    Future<DateTime> selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child,
                        );
                      },
                    );
                    selectedDate.then((value) {
                      setState(() {
                        _date =
                            "${getDay(value.weekday)}, ${getMonth(value.month)} ${value.day}, ${value.year}";
                      });
                      // print(getDay(value.day));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.date_range),
                            SizedBox(
                              width: 10,
                            ),
                            Text(_date, style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[800],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "SELECT TIME",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                InkWell(
                  onTap: () {
                    Future<TimeOfDay> selectedTime = showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    selectedTime.then((value) {
                      setState(() {
                        _time =
                            "${getHour(value.hour)}:${value.minute} ${getAmPm(value.hour)}";
                      });
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.timer),
                            SizedBox(
                              width: 10,
                            ),
                            Text(_time, style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[800],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: colorCustomGreen,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => SelectVehicleScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        "FINISH",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
