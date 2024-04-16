import 'package:b2ei_app/pages/superior_interface/drawer/DrawerPage.dart';
import 'package:b2ei_app/services/user_demande.dart';
import 'package:b2ei_app/services/user_service.dart';
import 'package:b2ei_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/Request.dart';
import '../../services/status_service.dart';
import '../../services/user_preferences.dart';

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
  final UserDemande userDemande = UserDemande();

  var height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final RequestService requestService = RequestService();

  Future _showRequestDialog(Request requestData, {required String id}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Service : ${requestData.client}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Date : ${formatDate(requestData.timestamp.toDate(), format: 'EEEE d MMMM yyyy')}'),
                Text('Affaire : ${requestData.affaire}'),
                Text('Reference : ${requestData.reference}'),
                Text('Designation : ${requestData.designation}'),
                Text('Quantite : ${requestData.quantite}'),
                //Text('statut : ${requestData.statut}'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await requestService.acceptRequest(id);
                Navigator.of(context).pop();
              },
              child: Text("Valider"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await requestService.rejectRequest(id);
                  Navigator.of(context).pop();
                },
                child: Text("Refuser")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                UserPreferences().logout(context);
              }).catchError((e) {
                print(e);
              });
            },
            child: Icon(
              Icons.logout,
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
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
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
                        stream: userDemande.getDemandesStream(context,
                            enattente: true),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(child: Text("Aucune demande"));
                          }
                          List<Request> demandes = snapshot.data!;
                          return ListView.builder(
                              padding: EdgeInsets.only(top: 14.0),
                              itemCount: demandes.length,
                              itemBuilder: (context, index) {
                                final demande = demandes[index];
                                final id = demande.id;
                                return SingleChildScrollView(
                                  child: Card(
                                    child: ListTile(
                                      title: Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: 'Demande de : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                '${capitalize(demande.name ?? '')}')
                                      ])),
                                      trailing: Wrap(
                                        spacing: -16,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.info,
                                              color: Colors.green,
                                            ),
                                            onPressed: () {
                                              _showRequestDialog(demande,
                                                  id: id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ))))
        ],
      ),
    );
  }
}
