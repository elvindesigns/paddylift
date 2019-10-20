import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/pickup-destination.dart';
import 'package:paddylift/style/color.dart';

import 'common/progress.dart';
import 'common/states.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  String dropdownValue = 'Select State';
  String dropdownValue2 = 'Select State';
  bool _isWithinState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE A TRIP"),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/route.png",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Choose Route", style: TextStyle(fontSize: 20.0)),
                ),
                CustomProgressIndicator(
                  itemCount: 5,
                  step: 1,
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
                  "FROM",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: colorCustomGreen,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items:
                      statesArray.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "TO",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue2,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: colorCustomGreen,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue2 = newValue;
                    });
                  },
                  items:
                      statesArray.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isWithinState = !_isWithinState;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        _isWithinState
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: colorCustomGreen,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Transporting Within State",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: colorCustomGreen,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickupDestinationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        "NEXT",
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
