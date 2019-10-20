import 'package:flutter/material.dart';
import 'package:paddylift/createTrip/addvehicle.dart';
import 'package:paddylift/createTrip/pricing.dart';
import 'package:paddylift/style/color.dart';

import 'common/progress.dart';

class SelectVehicleScreen extends StatefulWidget {
  @override
  _SelectVehicleScreenState createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  List vehicles = [];
  bool _isListEmpty = true;
  bool _isSelected = false;
  int _selectedIndex = 0;

  addVehicleToList(vehicle) {
    setState(() {
      vehicles.add(vehicle);
    });
    if (vehicles.length > 0) {
      setState(() {
        _isListEmpty = false;
      });
    }
    print(vehicles);
  }

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
                  "assets/car.png",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child:
                      Text("Select Vehicle", style: TextStyle(fontSize: 20.0)),
                ),
                CustomProgressIndicator(
                  itemCount: 5,
                  step: 3,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "VEHICLE",
                      style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                    ),
                    _isListEmpty == false
                        ? FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddVehicle(
                                    addVehicleFunction: addVehicleToList,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add),
                                Text("ADD VEHICLE")
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                _isListEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          "oops you dont have any vehicle registered",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: _isListEmpty
                      ? Container()
                      : ListView.builder(
                          itemCount: vehicles.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(bottom: 10.0),
                              color: _selectedIndex == index
                                  ? vehicleSelectedColor
                                  : vehicleUnSelectedColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        vehicles[index]['model'],
                                        style: _selectedIndex == index
                                            ? vehicleTitleSelected
                                            : vehicleTitleUnSelected,
                                      ),
                                      Text(
                                        "Plate Number: ${vehicles[index]['plateNumber']}",
                                        style: _selectedIndex == index
                                            ? vehicleDescSelected
                                            : vehicleDescUnSelected,
                                      )
                                    ],
                                  ),
                                  _selectedIndex == index
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                _isListEmpty
                    ? RaisedButton(
                        color: colorCustomGreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddVehicle(
                                addVehicleFunction: addVehicleToList,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  "ADD VEHICLE",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : RaisedButton(
                        color: colorCustomGreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PricingScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "NEXT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
