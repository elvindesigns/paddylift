import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/select-vehicle.dart';
import 'package:paddylift/style/color.dart';

import 'common/progress.dart';
import 'common/states.dart';

class PickupDestinationScreen extends StatefulWidget {
  @override
  _PickupDestinationScreenState createState() =>
      _PickupDestinationScreenState();
}

class _PickupDestinationScreenState extends State<PickupDestinationScreen> {
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
                  "assets/map.png",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Choose Pickup & Destination",
                      style: TextStyle(fontSize: 20.0)),
                ),
                CustomProgressIndicator(
                  itemCount: 5,
                  step: 2,
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
                  "PICKUP",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Pick up point",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "DESTINATION",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Drop off point",
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                          builder: (context) => SelectVehicleScreen()),
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
