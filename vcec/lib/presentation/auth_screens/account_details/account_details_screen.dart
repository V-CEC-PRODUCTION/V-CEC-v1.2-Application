import 'package:another_flushbar/flushbar_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/adduser/adduser_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/user/user_model.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_drop_down.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_text_field.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/user.dart';

import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
//import 'package:vcec/presentation/auth_screens/otp__verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/home/home.dart';

class AccountDetailsScreen extends StatelessWidget {
  final String deviceId;
  AccountDetailsScreen({
    super.key,
    required this.deviceId,
  });
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
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
    AccountDropDownWidget semesterDropDownWidget = AccountDropDownWidget(
      title: '* Semester  ',
      dropdownItems: semesterdropdownItems,
    );

    AccountDropDownWidget batchDropDownWidget = AccountDropDownWidget(
      title: '* Batch \t     ',
      dropdownItems: batchdropdownItems,
    );

    AccountDropDownWidget genderDropDownWidget = AccountDropDownWidget(
      title: "* Gender\t\t\t\t\t\t",
      dropdownItems: genderdropdownItems,
    );

    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return BlocListener<AddUserCubit, AddUserState>(
      listenWhen: (previous, current) => previous.value != current.value,
      listener: (context, state) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      child: Scaffold(
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
                      color: auththeme),
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
                controller: controller,
              ),
              AccountTextFieldWidget(
                name: 'Branch',
                controller: controller1,
              ),
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
              AccountTextFieldWidget(
                name: 'Admission Number',
                controller: controller2,
              ),
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
                bgcolor: auththeme,
                tcolor: Colors.black,
                title: 'Submit',
                onclick: () {
                  if (isTermsChecked.value == true)
                  {
                      print(deviceId);
                  String selectedSemester =
                      semesterDropDownWidget.getSelectedValue();
                  String selectedBatch = batchDropDownWidget.getSelectedValue();
                  String selectedGender =
                      genderDropDownWidget.getSelectedValue();
                  if (UserModel.instance.role == "guest") {
                    final UserRole user = UserRole(
                      role: Role.guest,
                      name: controller.text,
                      id: deviceId,
                    );

                    final cubit = context.read<AddUserCubit>();
                    cubit.accountDetails(user.name, user.branch, user.semester,
                        user.batch, user.adno, user.gender, user.id);
                  } else {
                    final UserRole user = UserRole(
                        role: Role.student,
                        name: controller.text,
                        id: deviceId,
                        branch: controller1.text,
                        adno: controller2.text,
                        semester: selectedSemester,
                        batch: selectedBatch,
                        gender: selectedGender);

                    final cubit = context.read<AddUserCubit>();
                    cubit.accountDetails(user.name, user.branch, user.semester,
                        user.batch, user.adno, user.gender, user.id);
                  }
                  }
                else{
                   FlushbarHelper.createError(
                                message: 'Please agree to the terms and conditions to proceed')
                            .show(context);
                }
                }
                ,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
