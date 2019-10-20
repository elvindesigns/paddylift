import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/dateandtime.dart';
import 'package:paddylift/createTrip/select-vehicle.dart';
import 'package:paddylift/style/color.dart';

import 'common/progress.dart';

class PricingScreen extends StatefulWidget {
  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
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
                  "assets/seat.png",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Add Seats & Pricing",
                      style: TextStyle(fontSize: 20.0)),
                ),
                CustomProgressIndicator(
                  itemCount: 5,
                  step: 4,
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
                  "AVAILABLE SEATS",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.grid_on),
                    hintText: "No. of available seats",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "PRICE",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/naira.png", width: 20),
                    ),
                    hintText: "Enter Price per Seat",
                  ),
                  keyboardType: TextInputType.number,
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
                      MaterialPageRoute(builder: (context) => DateTimeScreen()),
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
