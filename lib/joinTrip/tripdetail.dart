import 'package:flutter/material.dart';
import 'package:paddylift/style/color.dart';

import 'imageviewer.dart';

class TripDetailScreen extends StatelessWidget {
  final tripdetail;
  TripDetailScreen({this.tripdetail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'JOIN A TRIP',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            )
          ],
        ),
        body: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    color: colorCustomGreen,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ImageViewerScreen(
                                          image:
                                              '${tripdetail["vehicle"]["image"]}',
                                        )),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                  border: Border.all(
                                      color: Colors.white, width: 4)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                // child: Image.network(
                                //   'https://blogmedia.dealerfire.com/wp-content/uploads/sites/193/2019/01/How-Safe-is-the-2019-Toyota-Camry-A_O.png',
                                //   fit: BoxFit.cover,
                                //   loadingBuilder: (context, child, loadinProgress) {
                                //     if (loadinProgress == null) return child;
                                //     return Center(
                                //       child: CircularProgressIndicator(
                                //         value: loadinProgress.expectedTotalBytes != null
                                //             ? loadinProgress.cumulativeBytesLoaded /
                                //                 loadinProgress.expectedTotalBytes
                                //             : null,
                                //       ),
                                //     );
                                //   },
                                // ),
                                child: Image(
                                  image: AssetImage(
                                      '${tripdetail["vehicle"]["image"]}'),
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadinProgress) {
                                    if (loadinProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value:
                                            loadinProgress.expectedTotalBytes !=
                                                    null
                                                ? loadinProgress
                                                        .cumulativeBytesLoaded /
                                                    loadinProgress
                                                        .expectedTotalBytes
                                                : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '${tripdetail["from"]} - ${tripdetail["to"]}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${tripdetail["availableSeats"]} Available Seats',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PICKUP",
                          style: TextStyle(
                              color: colorCustomGreen,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${tripdetail["pickup"]}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "DROP OFF",
                          style: TextStyle(
                              color: colorCustomGreen,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${tripdetail["destination"]}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: colorCustomGreen,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${tripdetail["date"]}',
                                style: TextStyle(fontSize: 18),
                              ),
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
                              child: Text(
                                '${tripdetail["time"]}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "VEHICLE DETAILS",
                          style: TextStyle(
                              color: colorCustomGreen,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Model: ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${tripdetail["vehicle"]["model"]}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Car Color: ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${tripdetail["vehicle"]["color"]}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Plate Number: ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${tripdetail["vehicle"]["platenumber"]}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Air Conditioned: ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${tripdetail["vehicle"]["aircondition"]}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    showBottomSheet(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      context: context,
                      builder: (context) => new SeatBooking(
                        seats: tripdetail["availableSeats"],
                        amount: tripdetail["price"],
                      ),
                    );
                  },
                  color: colorCustomGreen,
                  child: Text(
                    'BOOK @ ₦${tripdetail["price"]} PER SEAT',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SeatBooking extends StatefulWidget {
  final int seats;
  final amount;

  const SeatBooking({this.seats, this.amount});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SeatBookingState();
  }
}

class _SeatBookingState extends State<SeatBooking> {
  List seatvalue = [];
  String dropdownValue = '1';
  String _calculatedAmount;
  @override
  void initState() {
    createSeats();
    super.initState();
  }

  void createSeats() {
    for (var i = 0; i < widget.seats; i++) {
      seatvalue.add((i + 1).toString());
    }
    print(seatvalue);
    setState(() {
      _calculatedAmount = widget.amount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "SEAT BOOKING",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colorCustomGreen),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Text(
                  "Number of Seats to book",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: DropdownButton<String>(
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
                        _calculatedAmount =
                            (int.parse(newValue) * widget.amount).toString();
                        dropdownValue = newValue;
                      });
                    },
                    items: seatvalue.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            padding: EdgeInsets.all(12),
            color: colorCustomGreen,
            onPressed: () {},
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'PAY ₦$_calculatedAmount',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: colorCustomGreen, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
