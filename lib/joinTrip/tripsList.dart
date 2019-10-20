import 'package:flutter/material.dart';
import 'package:paddylift/joinTrip/tripdetail.dart';
import 'package:paddylift/style/color.dart';

class TripsListScreen extends StatefulWidget {
  @override
  _TripsListScreenState createState() => _TripsListScreenState();
}

class _TripsListScreenState extends State<TripsListScreen> {
  List trips = [
    {
      'from': 'Kaduna',
      'to': 'Plateau',
      'pickup': 'Kawo Park',
      'destination': 'NTA Park',
      'date': 'MON 23 SEPT 2019',
      'time': '08:00 am',
      'vehicle': {
        'image': 'assets/car1.jpg',
        'model': 'TOYOTA',
        'platenumber': '756 BHU',
        'color': 'Dark Blue',
        'aircondition': 'YES'
      },
      'availableSeats': 4,
      'price': 2000,
    },
    {
      'from': 'Kaduna',
      'to': 'Plateau',
      'pickup': 'Kawo Park',
      'destination': 'NTA Park',
      'date': 'TUE 24 SEPT 2019',
      'time': '10:00 am',
      'vehicle': {
        'image': 'assets/car2.jpg',
        'model': 'CAMRY',
        'platenumber': '456 BHU',
        'color': 'Dark Blue',
        'aircondition': 'NO'
      },
      'availableSeats': 1,
      'price': 1800,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOIN A TRIP'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailScreen(
                    tripdetail: trips[index],
                  ),
                ),
              );
            },
            trailing: Icon(Icons.chevron_right),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${trips[index]["from"]} - ${trips[index]["to"]}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_car,
                      size: 12,
                      color: colorCustomGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${trips[index]["vehicle"]["model"]}'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.grid_on,
                      size: 12,
                      color: colorCustomGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                          '${seatChecker(trips[index]["availableSeats"])}'),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: colorCustomGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${trips[index]["date"]}'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.alarm,
                      size: 12,
                      color: colorCustomGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${trips[index]["time"]}'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset("assets/naira.png", width: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${trips[index]["price"]} per Seat',
                        style: TextStyle(
                            fontSize: 17,
                            color: colorCustomGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
            // contentPadding: EdgeInsets.all(10),
            // subtitle: ,
          ),
        ),
      ),
    );
  }

  String seatChecker(trip) {
    String finalString;
    if (trip > 1) {
      finalString = '$trip Seats Available';
    } else {
      finalString = '$trip Seat Available';
    }
    return finalString;
  }
}
