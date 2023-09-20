import 'package:flutter/material.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_drop_down.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_text_field.dart';
import 'package:vcec/presentation/auth_screens/create_password/create_password_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
//import 'package:vcec/presentation/auth_screens/otp__verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';

class AccountDetailsScreen extends StatelessWidget {
  AccountDetailsScreen({super.key});

  List<DropdownMenuItem<String>> get semesterdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("S1"), value: "S1"),
      DropdownMenuItem(child: Text("S2"), value: "S2"),
      DropdownMenuItem(child: Text("S3"), value: "S3"),
      DropdownMenuItem(child: Text("S4"), value: "S4"),
      DropdownMenuItem(child: Text("S5"), value: "S5"),
      DropdownMenuItem(child: Text("S6"), value: "S6"),
      DropdownMenuItem(child: Text("S7"), value: "S7"),
      DropdownMenuItem(child: Text("S8"), value: "S8"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get batchdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("A"), value: "A"),
      DropdownMenuItem(child: Text("B"), value: "B"),
      DropdownMenuItem(child: Text("C"), value: "C"),
      DropdownMenuItem(child: Text("D"), value: "D"),
      DropdownMenuItem(child: Text("E"), value: "E"),
      DropdownMenuItem(child: Text("F"), value: "F"),
      DropdownMenuItem(child: Text("G"), value: "G"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get genderdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  ValueNotifier<bool> isTermsChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 285 / 1019,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: theme),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 28, left: 22),
                    child: IconButton(
                        style: IconButton.styleFrom(iconSize: 30),
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_outlined)),
                  ),
                  kheight20,
                  Row(
                    children: [
                      SizedBox(
                        width: sizew * 0.2,
                      ),
                      Text(
                        'Account\nDetails',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ]),
            AccountTextFieldWidget(
              name: 'Full name',
            ),
            AccountTextFieldWidget(name: 'Branch'),
            Padding(
                padding: EdgeInsets.only(
                    top: sizeh * .015,
                    left: sizew * 63 / 470,
                    right: sizew * 48.31 / 470),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AccountDropDownWidget(
                      title: '* Semester  ',
                      dropdownItems: semesterdropdownItems,
                    ),
                    AccountDropDownWidget(
                        title: '* Batch \t     ',
                        dropdownItems: batchdropdownItems)
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 63 / 470,
                ),
                AccountDropDownWidget(
                    title: "* Gender\t\t\t\t\t\t",
                    dropdownItems: genderdropdownItems),
              ],
            ),
            AccountTextFieldWidget(name: 'Admission Number'),
            SizedBox(
              height: sizeh * 0.08,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 63 / 470,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isTermsChecked,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Checkbox(
                      value: value,
                      onChanged: (newValue) {
                        isTermsChecked.value = newValue!;
                      },
                    );
                  },
                ),
                Text('Agree to'),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'terms and conditions',
                          style: TextStyle(),
                        ),
                        Icon(Icons.open_in_new)
                      ],
                    ))
              ],
            ),
            AuthButtonWidget(
              bgcolor: theme,
              tcolor: Colors.black,
              title: 'Submit',
              onclick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreatePasswordScreen(),
                ));
              },
            ),
          ],
        ),
      )),
    );
  }
}
