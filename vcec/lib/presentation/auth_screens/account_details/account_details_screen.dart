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

  late AccountDropDownWidget semesterDropDownWidget;
  late AccountDropDownWidget batchDropDownWidget;
  late AccountDropDownWidget genderDropDownWidget;
  ValueNotifier<bool> isTermsChecked = ValueNotifier<bool>(false);
  @override
  initState() {
    semesterDropDownWidget = AccountDropDownWidget(
      title: '* Semester  ',
      dropdownItems: semesterdropdownItems,
    );

    batchDropDownWidget = AccountDropDownWidget(
      title: '* Batch \t     ',
      dropdownItems: batchdropdownItems,
    );

    genderDropDownWidget = AccountDropDownWidget(
      title: "* Gender\t\t\t\t\t\t",
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
                    displaySnackBar(context: context, text: "Server is down");
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
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: loadingWidget,
            );
          }
          return SafeArea(
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
                if (AuthTokenManager.instance.userRole != UserRole.student) ...[
                  SizedBox(
                    height: 160.h,
                  ),
                  AccountTextFieldWidget(
                    name: 'Full name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ] else ...[
                  AccountTextFieldWidget(
                    name: 'Full name',
                    controller: nameController,
                  ),
                  AccountTextFieldWidget(
                    name: 'Branch',
                    controller: branchController,
                  ),
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
                ],
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
                      builder:
                          (BuildContext context, bool value, Widget? child) {
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
                      ),
                    ),
                  ],
                ),
                AuthButtonWidget(
                  bgcolor: auththeme,
                  tcolor: Colors.black,
                  title: 'Submit',
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
              ],
            ),
          ));
        },
      ),
    );
  }
}
