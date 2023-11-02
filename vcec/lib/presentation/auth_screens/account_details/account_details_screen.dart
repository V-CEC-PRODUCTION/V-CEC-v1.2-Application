import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/adduser/adduser_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/user/user_model.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_drop_down.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_text_field.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/user.dart';

import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_top_title.dart';
import 'package:vcec/presentation/home/home.dart';

class AccountDetailsScreen extends StatefulWidget {
  final String deviceId;
  const AccountDetailsScreen({
    super.key,
    required this.deviceId,
  });

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  List<DropdownMenuItem<String>> get branchdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "CSE", child: Text("Computer Science & Engineering")),
      const DropdownMenuItem(
          value: "ECE", child: Text("Electronics & Communication ")),
      const DropdownMenuItem(
          value: "EEE", child: Text("Electrical And Electronics ")),
      const DropdownMenuItem(
          value: "EI", child: Text("Electrical And Instrumentation ")),
      const DropdownMenuItem(
          value: "MCA", child: Text("Master of Computer Applications")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get semesterdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "S1", child: Text("S1")),
      const DropdownMenuItem(value: "S2", child: Text("S2")),
      const DropdownMenuItem(value: "S3", child: Text("S3")),
      const DropdownMenuItem(value: "S4", child: Text("S4")),
      const DropdownMenuItem(value: "S5", child: Text("S5")),
      const DropdownMenuItem(value: "S6", child: Text("S6")),
      const DropdownMenuItem(value: "S7", child: Text("S7")),
      const DropdownMenuItem(value: "S8", child: Text("S8")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get batchdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "A", child: Text("A")),
      const DropdownMenuItem(value: "B", child: Text("B")),
      const DropdownMenuItem(value: "C", child: Text("C")),
      const DropdownMenuItem(value: "D", child: Text("D")),
      const DropdownMenuItem(value: "E", child: Text("E")),
      const DropdownMenuItem(value: "F", child: Text("F")),
      const DropdownMenuItem(value: "G", child: Text("G")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get genderdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Male", child: Text("Male")),
      const DropdownMenuItem(value: "Female", child: Text("Female")),
      const DropdownMenuItem(value: "Others", child: Text("Others")),
    ];
    return menuItems;
  }

  late AccountDropDownWidget branchDropDownWidget;
  late AccountDropDownWidget semesterDropDownWidget;
  late AccountDropDownWidget batchDropDownWidget;
  late AccountDropDownWidget genderDropDownWidget;
  ValueNotifier<bool> isTermsChecked = ValueNotifier<bool>(false);
  @override
  initState() {
    branchDropDownWidget = AccountDropDownWidget(
      title: "* Branch",
      dropdownItems: branchdropdownItems,
    );

    semesterDropDownWidget = AccountDropDownWidget(
      title: '* Semester  ',
      dropdownItems: semesterdropdownItems,
    );

    batchDropDownWidget = AccountDropDownWidget(
      title: '* Batch \t     ',
      dropdownItems: batchdropdownItems,
    );

    genderDropDownWidget = AccountDropDownWidget(
      title: "* Gender",
      dropdownItems: genderdropdownItems,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return BlocListener<AddUserCubit, AddUserState>(
      listenWhen: (previous, current) => previous.value != current.value,
      listener: (context, state) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              AuthTopTitleWidget(
                title: 'Account Details',
              ),
              kheight15,
              AccountTextFieldWidget(
                name: 'Full name',
                controller: controller,
              ),
             
              kheight10,
              SizedBox(width: 356.w, height: 70.h, child: branchDropDownWidget),
              Padding(
                  padding: EdgeInsets.only(
                      top: sizeh * .015,
                      left: sizew * 63 / 470,
                      right: sizew * 48.31 / 470),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      semesterDropDownWidget,
                      batchDropDownWidget,
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 63 / 470,
                  ),
                  genderDropDownWidget,
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
                  const Text('Agree to'),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          'terms and conditions',
                          style: TextStyle(),
                        ),
                        Icon(Icons.open_in_new)
                      ],
                    ),
                  ),
                ],
              ),
              kheight15,
              SizedBox(
                width: 413.w,
                height: 60.w,
                child: AuthButtonWidget(
                  bgcolor: auththeme,
                  tcolor: Colors.black,
                  title: 'Submit',
                  borderRadius: 5,
                  elevation: 8,
                  onclick: () {
                    if (isTermsChecked.value == true) {
                      print(widget.deviceId);
                      String selectedSemester =
                          semesterDropDownWidget.getSelectedValue();
                      String selectedBatch =
                          batchDropDownWidget.getSelectedValue();
                      String selectedGender =
                          genderDropDownWidget.getSelectedValue();
                      final UserRole user = UserRole(
                          role: Role.student,
                          name: controller.text,
                          id: widget.deviceId,
                          branch: controller1.text,
                          adno: controller2.text,
                          semester: selectedSemester,
                          batch: selectedBatch,
                          gender: selectedGender);
                      if (UserModel.instance.role == "guest") {
                        final cubit = context.read<AddUserCubit>();
                        cubit.accountDetails(
                          user.name,
                          user.branch,
                          user.semester,
                          user.batch,
                          user.adno,
                          user.gender,
                          user.id,
                        );
                      } else {
                        final cubit = context.read<AddUserCubit>();
                        cubit.accountDetails(
                          user.name,
                          user.branch,
                          user.semester,
                          user.batch,
                          user.adno,
                          user.gender,
                          user.id,
                        );
                      }
                    } else {
                      FlushbarHelper.createError(
                              message:
                                  'Please agree to the terms and conditions to proceed')
                          .show(context);
                    }
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
