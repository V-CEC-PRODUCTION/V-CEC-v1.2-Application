import 'package:flutter/material.dart';
import 'package:vcec/presentation/common_widgets/settings_field_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: size1 * 0.05),
            child: IconButton(
                iconSize: size1 * 0.06,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontSize: size1 * 0.05, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: size1 * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SettingsFieldWidget(
                        size1: size1,
                        icon: Icons.language,
                        text: 'CEC website',
                        onPress: () {},
                      ),
                      SettingsFieldWidget(
                        size1: size1,
                        icon: Icons.password,
                        text: 'Change Password',
                        onPress: () {},
                      ),
                      SettingsFieldWidget(
                        size1: size1,
                        icon: Icons.lock_outline,
                        text: 'Privacy Policy',
                        onPress: () {},
                      ),
                      SettingsFieldWidget(
                        size1: size1,
                        icon: Icons.question_mark_outlined,
                        text: 'About us',
                        onPress: () {},
                      ),
                      SettingsFieldWidget(
                        size1: size1,
                        icon: Icons.star_border_outlined,
                        text: 'Rate us',
                        onPress: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size1 * 0.1,
                            right: size1 * 0.09,
                            top: size1 * 0.02),
                        child: ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.info_outline),
                          title: Padding(
                            padding: EdgeInsets.only(left: size1 * 0.06),
                            child: const Text(
                              'Help',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size1 * 0.05),
                child: const Text(
                  'v1.2.3',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ));
  }
}
