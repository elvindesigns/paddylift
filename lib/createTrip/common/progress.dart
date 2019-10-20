import 'package:flutter/material.dart';
import 'package:paddylift/style/color.dart';

class CustomProgressIndicator extends StatefulWidget {
  CustomProgressIndicator({this.itemCount, this.step});
  final int itemCount;
  final int step;
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: 50,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8),
                color: colorCustomGreen,
                height: 4.0,
                width: 30 * widget.itemCount.toDouble() - 20,
              ),
              _buildProgressIndicator(widget.itemCount, widget.step),
            ],
          )
        ],
      ),
    );
  }

  _buildProgressIndicator(int iterate, int step) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < iterate; i++) {
      Color stepColor;
      if (step > i) {
        stepColor = colorCustomGreen;
      } else {
        stepColor = Colors.white;
      }
      list.add(
        new Container(
          width: 20,
          height: 20,
          margin: EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: stepColor,
            border: Border.all(color: colorCustomGreen, width: 3.0),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
    }
    return new Row(children: list);
  }
}
