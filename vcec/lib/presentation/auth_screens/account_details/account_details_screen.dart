import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/authentication/signup/user_details_enum/user_details.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_drop_down.dart';
import 'package:vcec/presentation/auth_screens/account_details/widgets/account_text_field.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_top_title.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';

class AccountDetailsScreen extends StatefulWidget {
  final String password;
  AccountDetailsScreen({
    super.key,
    required this.password,
  });

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController branchController = TextEditingController();

  TextEditingController adNumController = TextEditingController();

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
    return Scaffold(
      body: BlocConsumer<CreateNewAccountCubit, CreateNewAccountState>(
          listener: (context, state) {
        state.isFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
                  (failure) {
                    if (!state.isLoading) {
                      if (failure == const MainFailure.serverFailure()) {
                        displaySnackBar(
                            context: context, text: "Server is down");
                      } else if (failure == const MainFailure.authFailure()) {
                        displaySnackBar(
                            context: context, text: "Please try again later");
                      } else if (failure == const MainFailure.clientFailure()) {
                        displaySnackBar(
                            context: context, text: "Email already in use");
                      } else {
                        displaySnackBar(
                            context: context, text: "Something went wrong");
                      }
                    }
                  },
                  (r) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home', (route) => false);
                  },
                ));
      }, builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: loadingWidget,
          );
        }
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              AuthTopTitleWidget(
                title: 'Account Details',
              ),
              kheight15,
              AccountTextFieldWidget(
                name: 'Full name',
                controller: nameController,
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
                controller: adNumController,
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
                      final UserDetailsModel userDetailsModel;
                      if (AuthTokenManager.instance.userRole ==
                          UserRole.guest) {
                        if (nameController.text.length < 3) {
                          return;
                        }
                        userDetailsModel =
                            UserDetailsModel(fullName: nameController.text);
                      } else {
                        final sem = semesterDropDownWidget.getSelectedValue();
                        final batch = batchDropDownWidget.getSelectedValue();
                        final gender = genderDropDownWidget.getSelectedValue();
                        if (nameController.text.length < 3 ||
                            branchController.text.length < 3 ||
                            adNumController.text.length < 3 ||
                            sem.isEmpty ||
                            batch.isEmpty ||
                            gender.isEmpty) {
                          return;
                        }
                        userDetailsModel = UserDetailsModel(
                          fullName: nameController.text,
                          branch: branchController.text,
                          semester: sem,
                          batch: batch,
                          gender: gender,
                          adNumber: adNumController.text,
                        );
                      }
                      BlocProvider.of<CreateNewAccountCubit>(context)
                          .createNewAccount(
                              email: AuthTokenManager.instance.email!,
                              password: widget.password,
                              userDetailsModel: userDetailsModel);
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
        ));
      }),
    );
  }
}
