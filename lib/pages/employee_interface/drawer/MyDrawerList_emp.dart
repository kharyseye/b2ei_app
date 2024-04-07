import 'package:b2ei_app/pages/employee_interface/FormPage.dart';
import 'package:b2ei_app/pages/employee_interface/HistoryPage.dart';
import 'package:b2ei_app/pages/employee_interface/settings/screens/account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../services/user_preferences.dart';

class MyDrawerList_emp extends StatefulWidget {
  const MyDrawerList_emp({super.key});

  @override
  State<MyDrawerList_emp> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList_emp> {
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
              "D E M A N D E S",
              Icons.list_alt_outlined,
              currentPage == DrawerSections.request ? true : false
          ),
          SizedBox(
            height: 20,
          ),
          menuItem(
              3, "H I S T O R I Q U E", Icons.history_outlined,
              currentPage == DrawerSections.historical ? true : false
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
                  builder: (context) => FormPage('faire une demande'),
                ),
              );
            } else if (id == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => HistoryPage('historique'),
                ),
              );
            } else if (id == 4) {
              currentPage = DrawerSections.setting;
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => AccountScreen(),
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

enum DrawerSections { dashboard,request, historical,  setting, exit }
