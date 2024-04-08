import 'package:b2ei_app/pages/authentication/RegisterPage.dart';
import 'package:b2ei_app/pages/employee_interface/settings/screens/account_screen.dart';
import 'package:b2ei_app/pages/superior_interface/Dashboard_Sup.dart';
import 'package:b2ei_app/pages/superior_interface/add_user.dart';
import 'package:b2ei_app/pages/superior_interface/request_emp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../services/user_preferences.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),

      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          menuItem(
              1, "H O M E", Icons.home_outlined,
              currentPage == DrawerSections.dashboard ? true : false
          ),
          SizedBox(
            height: 20,
          ),
          menuItem(
              2,
              "U T I L I S A T E U R S",
              Icons.list_alt_outlined,
              currentPage == DrawerSections.addUser ? true : false
          ),
          SizedBox(
            height: 20,
          ),
          menuItem(
              3, "D E M A N D E S", Icons.history_outlined,
              currentPage == DrawerSections.request ? true : false
          ),
          SizedBox(
            height: 20,
          ),

          menuItem(
              4, "P A R A M E T R E S", Icons.settings_outlined,
              currentPage == DrawerSections.setting ? true : false
          ),
          SizedBox(
            height: 200,
          ),

          menuItem(
              5, "D E C O N N E X I O N", Icons.logout,
              currentPage == DrawerSections.exit ? true : false
          ),

        ],

      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => AddUserPage(),
                ),
              );
            } else if (id == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => Request_emp(),
                ),
              );
            } else if (id == 4) {
              currentPage = DrawerSections.setting;
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => AccountScreen('Parametre'),
                ),
              );

            }else if (id == 5) {
              FirebaseAuth.instance.signOut().then((value) {
                UserPreferences().logout(context);
              }).catchError((e) {
                print(e);
              });
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 30,
                  color: PrimaryColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



enum DrawerSections { dashboard, addUser, notification, request, setting, exit }
