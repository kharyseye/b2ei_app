import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/pages/authentication/RegisterPage.dart';
import 'package:b2ei_app/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../../model/Users.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _Request_empState();
}

class _Request_empState extends State<AddUserPage> {
  final users = [];
  final userManagement = UserManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("GESTION DES UTILISATEURS"),
        backgroundColor: PrimaryColor,
      ),
      body: Column(
        children: [
          //BOUTTON AJOUTER UN UTILISATEUR !!!!!!!
          Gap(12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                icon: Icon(Icons.add),
                label: Text(
                  'Ajouter un Utilisateur',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Gap(4.0),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Text("Aucun utilisateur");
                }
                List<Users> users = [];
                snapshot.data!.docs.forEach((data) {
                  users.add(Users.fromData(data));
                });
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final id = snapshot.data!.docs[index].id;
                    final user = users[index];
                    final id_user = user.uid;
                    final username = user.username;
                    final isActive = user.isActive;
                    final email = user.email;
                    if (user.supervisor && id_user == idAdmin)
                      return SizedBox();

                    return Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        child: Center(
                          child: ListTile(
                            //leading: Image.asset("assets/images/history.jpg"),
                            title: Text(
                              "$username",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            subtitle: Text('$email'),
                            trailing: Wrap(
                              spacing: -16,
                              children: [
                                SingleChildScrollView(
                                  child: LiteRollingSwitch(
                                    value: isActive ?? false,
                                    textOn: "Activé",
                                    textOff: "off",
                                    textOffColor: Colors.white,
                                    textOnColor: Colors.white,
                                    iconOn: Icons.done,
                                    iconOff: Icons.group_off_rounded,
                                    textSize: 20,
                                    onChanged: (bool state) async {
                                      await userManagement.updateIsActive(
                                          context,
                                          newIsActive: state,
                                          id: id);
                                      // await updateIsActive
                                    },
                                    onTap: () {},
                                    onDoubleTap: () {},
                                    onSwipe: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
