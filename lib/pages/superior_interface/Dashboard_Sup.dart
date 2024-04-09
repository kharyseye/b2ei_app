import 'package:b2ei_app/pages/superior_interface/drawer/DrawerPage.dart';
import 'package:b2ei_app/services/user_service.dart';
import 'package:b2ei_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';

class Dashboard_Sup extends StatefulWidget {
  @override
  State<Dashboard_Sup> createState() => _DashboardState();
}

class RouteItem {
  final String name; // Nom de la route
  final Widget route; // Widget de la route

  RouteItem({required this.name, required this.route});
}

class _DashboardState extends State<Dashboard_Sup> {
  final UserService userService = UserService();

  var height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    /* Future<void> showHistoryDialog(Request requestData) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(' Service : ${requestData.client}'),
            backgroundColor: Colors.green[100],
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Date : ${formatDate(requestData.timestamp.toDate(), format: 'EEEE d MMMM yyyy')}'),
                  Text('Affaire : ${requestData.affaire}'),
                  Text('Reference : ${requestData.reference}'),
                  Text('Designation : ${requestData.designation}'),
                  Text('Quantite : ${requestData.quantite}'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Valider")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Refuser")
              ),
            ],
          );
        },
      );
    }*/

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 35,
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8.0),
            margin: EdgeInsets.only(bottom: 16.0),
            child: StreamBuilder(
                stream: userService.getUserInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showLoading();
                  }
                  if (snapshot.hasError)
                    return Center(
                      child: Text('${snapshot.error.toString()}'),
                    );
                  final user = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${saluer(capitalize(user?.username ?? ''))}',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('demande')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Une erreur s\'est produite'),
                      );
                    }

                    final demands = snapshot.data!.docs;

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          for (var demand in demands)
                            Card(
                              child: ListTile(
                                title: Text('Affaire: ${demand['affaire']}'),
                                subtitle: Text(
                                    'Client: ${demand['id_user']}\nDate: ${(demand['date'] as Timestamp).toDate()}'),
                                trailing: Wrap(
                                  spacing: -16,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
