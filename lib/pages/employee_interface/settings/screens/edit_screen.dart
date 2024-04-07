import 'package:b2ei_app/pages/authentication/resetpassword.dart';
import 'package:b2ei_app/pages/employee_interface/settings/widgets/settings_items.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_outlined,
            size: 40,),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: (){},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(60, 50),
                  elevation: 10
                ),
                icon: Icon(
                  Ionicons.checkmark,
                  color: Colors.white,
                ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Compte",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
            SizedBox(height: 40,),
            EditItem(
              title: 'Photo',
              widget: Column(
                children: [
                  Image.asset("assets/images/avatar.png",
                    width: 100,
                    height: 100,
                  ),
                  TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.green.shade200
                    ),
                    child: Text("Changer",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            SettingItem(
                title: "Mot de passe",
                bgColor: Colors.green.shade100,
                iconColor: Colors.green,
                icon: Ionicons.swap_horizontal_outline,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage() )
                  );
                })
        ],
        ),
      ),
    );
  }
}

