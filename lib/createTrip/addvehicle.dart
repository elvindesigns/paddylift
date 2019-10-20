import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paddylift/style/color.dart';

import 'package:image_picker/image_picker.dart';

class AddVehicle extends StatefulWidget {
  AddVehicle({this.addVehicleFunction});
  final Function addVehicleFunction;
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  bool _image1Preview = false;
  File _image1Pic;
  String dropdownValue = "NO";
  String _model;
  String _plateNumber;
  String _color;

  Future getImage1() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);

    if (image != null) {
      setState(() {
        _image1Preview = true;
      });
    }
    setState(() {
      _image1Pic = image;
    });
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
          InkWell(
            onTap: () {
              setState(() {
                getImage1();
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image1Preview == false
                      ? Image.asset(
                          "assets/photo.png",
                          height: 100,
                        )
                      : Container(),
                  _image1Preview
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage(
                              _image1Pic.path,
                            ),
                            fit: BoxFit.cover,
                          ))
                      : Container(),
                  _image1Preview == false
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text("Take Photo",
                              style: TextStyle(fontSize: 20.0)),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.65 - 80,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Vehicle details",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    _model = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.local_taxi),
                    hintText: "Vehicle Model",
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    _plateNumber = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.straighten),
                    hintText: "Plate Number",
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    _color = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.color_lens),
                    hintText: "Vehicle Color",
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Is Vehicle AirConditioned?",
                  style: TextStyle(color: colorCustomGreen, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20,
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
                  items: ["YES", "NO"]
                      .map<DropdownMenuItem<String>>((String value) {
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
                    var vehicledetails = {
                      'image': _image1Pic.path,
                      'model': _model,
                      'plateNumber': _plateNumber,
                      'color': _color,
                      'airconditioned': dropdownValue
                    };
                    widget.addVehicleFunction(vehicledetails);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        "ADD VEHICLE",
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
