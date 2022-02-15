import 'package:flutter/material.dart';
import 'package:cinemapp/constants/constants.dart';
import 'package:cinemapp/screens1/Ticket_screen.dart';

class PayButton extends StatefulWidget {
  static const routeName = '/pay-button';

  const PayButton({Key? key}) : super(key: key);

   @override
  _PayButtonState createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  GlobalKey previewContainer = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: white),
                      ),
                    ),
                    Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 12,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white
                      ),
                    ),
                    Text(
                      "Resvered",
                      style: TextStyle(
                        fontSize: 12,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: primary
                      ),
                    ),
                    Text(
                      "Selected",
                      style: TextStyle(
                        fontSize: 12,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.08,
                width: size.width * 0.45,
                child: Center(
                  child: Text(
                    '\$9.00',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              FlatButton(
                color: secondary,
                onPressed: (){
                          Navigator.of(context).pushNamed(TicketScreen.routeName);
                        },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
                ),
                child: Container(
                  width: size.width * 0.45,
                  height: size.width * 0.08,
                  child: Center(
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}