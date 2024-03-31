import 'package:b2ei_app/constant.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer_emp extends StatefulWidget {
  const MyHeaderDrawer_emp({super.key});

  @override
  State<MyHeaderDrawer_emp> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyHeaderDrawer_emp> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: PrimaryColor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/PP.jpg")
                )
            ),
          ),
          Text("TEST 2",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Text("test2@test.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
