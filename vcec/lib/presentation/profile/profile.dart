import 'package:flutter/material.dart';
import 'package:vcec/presentation/common_widgets/multiple_column_text_widget.dart';
import 'package:vcec/presentation/common_widgets/profile_menu_widget.dart';
import 'package:vcec/presentation/profile/subpages/edit_profile.dart';
import 'package:vcec/presentation/profile/subpages/settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              iconSize: size1 * 0.05,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Padding(
            padding: EdgeInsets.only(left: size1 * 0.24),
            child: Text(
              'Profile',
              style: TextStyle(
                  fontSize: size1 * 0.05, fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size1 * 0.05),
              child: Container(
                width: size1 * 0.28,
                height: size1 * 0.28,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/d7/bd/93/d7bd934adc5e5a50da570cb1bc98e946.jpg'))),
              ),
            ),
            const SizedBox(height: 10),
            Text('Alvin Johns',
                style: TextStyle(
                    fontSize: size1 * 0.07, fontWeight: FontWeight.bold)),
            Text('chn21cs109@ceconline.edu',
                style: TextStyle(
                  fontSize: size1 * 0.03,
                )),
            Padding(
              padding: EdgeInsets.only(left: size1 * 0.301, top: size1 * 0.015),
              child: Row(
                children: [
                  Text('Computer Science',
                      style: TextStyle(
                          fontSize: size1 * 0.03, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size1 * 0.025,
                    height: size1 * 0.025,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('S4 C',
                      style: TextStyle(
                          fontSize: size1 * 0.03, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size1 * 0.35,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text('Edit Profile',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: size1 * 0.07,
                left: size1 * 0.13,
              ),
              child: Column(
                children: [
                  MultipleColumnText(
                      width: 44,
                      size1: size1,
                      text: 'Register Number',
                      text1: '515-525-125'),
                  const SizedBox(
                    height: 10,
                  ),
                  MultipleColumnText(
                      width: 27,
                      size1: size1,
                      text: 'Admission Number',
                      text1: '515-525-125'),
                  const SizedBox(
                    height: 10,
                  ),
                  MultipleColumnText(
                      width: 20,
                      size1: size1,
                      text: 'IEEE Membership ID',
                      text1: '515-525-125'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size1 * 0.09, right: size1 * 0.09, top: size1 * 0.09),
              child: Column(
                children: [
                  ProfileMenuWidget(
                      title: "Settings",
                      icon: Icons.settings,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ));
                      }),
                  ProfileMenuWidget(
                      title: "Notification",
                      icon: Icons.notifications,
                      onPress: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                      title: "Logout",
                      icon: Icons.logout_outlined,
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
