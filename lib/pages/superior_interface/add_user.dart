import 'package:b2ei_app/pages/authentication/RegisterPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/Users.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _Request_empState();
}

class _Request_empState extends State<AddUserPage> {

  final users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GESTION DES UTILISATEURS"),
        backgroundColor: Colors.green[200],
      ),
      body: Stack(
        children: [
          //BOUTTON AJOUTER UN UTILISATEUR !!!!!!!
          Positioned(
            top: 40.0,
            right: 10.0,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ));

              },
              icon: Icon(Icons.add),
              label: Text('Ajouter un Utilisateur'),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
              child:StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if(!snapshot.hasData){
                    return Text("Aucun utilisateur");
                  }
                  List<Users> users = [];
                  snapshot.data!.docs.forEach((data) {
                    users.add(Users.fromData(data));
                  });
                  return  ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index){
                      final user = users[index];
                      final email = user.email;
                      final username = user.username;
                      final uid = user.uid;
                      final department = user.department;
                      final supervisor = user.supervisor;

                      return Card(
                        child: ListTile(
                          //leading: Image.asset("assets/images/history.jpg"),
                          title: Text("$username",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),),
                          //subtitle: Text("$affaire,$client, $date, $quantite"),
                          trailing: IconButton(
                            icon :Icon(Icons.info,
                              color: Colors.green,),
                            onPressed: () {},
                          ),

                          onTap: (){},
                        ),
                      );
                    },
                  );
                } ,
              )
          ),
        ],
      ),
    );
  }
}
