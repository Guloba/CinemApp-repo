import 'package:flutter/material.dart';
import 'package:cinemapp/constants/constants.dart';

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int timeIntexSelected = 1;

  var time = [
    ["01.30", 5000],
    ["06.30", 10000],
    ["10.30", 15000]
  ];

  Widget _timeItem(String time, int price, bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: appPadding * 0.75),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? primary : white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: time,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: active ? primary : white,
                  ),
                  children: <TextSpan>[
                TextSpan(
                    text: ' PM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: active ? primary : white,
                    ))
              ])),
          Text(
            "from UGX$price",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: grey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 17,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.035),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: index == 0 ? 32 : 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    timeIntexSelected = index;
                  });
                },
                child: _timeItem(
                    time[index][0].toString(),
                    time[index][1] as int,
                    index == timeIntexSelected ? true : false),
              ),
            );
          },
        ),
      ),
    );
  }
}
