import 'package:b2ei_app/pages/employee_interface/settings/screens/edit_screen.dart';
import 'package:b2ei_app/pages/employee_interface/settings/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/forward_button.dart';
import '../widgets/settings_items.dart';

class AccountScreen extends StatefulWidget {

  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  bool isDarkMode= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.chevron_left_outlined,
          size: 40,),
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PARAMETRES",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 30,),
              Text("COMPTE",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("assets/images/avatar.png",
                    width: 70,
                      height: 70,
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Khary SEYE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text("khary@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                      ForwardButton(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditAccountScreen() )
                        );
                      },),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text("Parametres",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              SettingItem(
                title: 'Langues',
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "Francais",
                onTap: (){},
              ),
              SizedBox(height: 40,),
              SettingSwitch(
                title: 'Dark Mode',
                icon: Ionicons.earth,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: isDarkMode,
                onTap: (value){
                  setState(() {
                    isDarkMode= value;
                  });
                },
              ),
              SizedBox(height: 40,),
              SettingItem(
                title: 'Confidentialité',
                icon: Ionicons.document_lock_outline,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}



