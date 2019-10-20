import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/common/states.dart';
import 'package:paddylift/joinTrip/tripsList.dart';
import 'package:paddylift/style/color.dart';

class TripEnquireScreen extends StatefulWidget {
  @override
  _TripEnquireScreenState createState() => _TripEnquireScreenState();
}

class _TripEnquireScreenState extends State<TripEnquireScreen> {
  String dropdownValue = 'Select State';
  String dropdownValue2 = 'Select State';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOIN A TRIP"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 45,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Select your \ntravel route",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: colorCustomGreen,
                          fontSize: 55.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
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
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: colorCustomGreen,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TripsListScreen()),
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
