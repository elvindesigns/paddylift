import 'package:flutter/material.dart';
import 'package:paddylift/style/color.dart';

import 'createTrip/route.dart';
import 'joinTrip/tripenquire.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/logo.png", width: 150),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.6 - 70),
              child: Center(
                child: Text(
                  "What Do You Want To Do?",
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      color: colorCustomGreen,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RouteScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "CREATE A TRIP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: colorCustomGreen,
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => TripEnquireScreen()
                        ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "JOIN A TRIP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
