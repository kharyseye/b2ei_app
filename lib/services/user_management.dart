import 'package:b2ei_app/model/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../utils.dart';

class UserManagement{
  storeNewUser(BuildContext context,{required Users user}){
    FirebaseFirestore.instance.collection('users').add({
      'email':user.email,
      'uid':user.uid,
      'username' : user.username,
      'department' : user.department,
      'supervisor' : user.supervisor
    }).then((value) async {
      showToast(
        context,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text('Succés 🎉',
          style: TextStyle(
            fontSize: 18,
          ),),
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 3),
        description: Text('Employé ajouté avec succés',
            style: TextStyle(
              fontSize: 15,)
        ),
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
      );
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed('/AddUserPage');
    }).catchError((e){
      print(e);
    });
  }
}