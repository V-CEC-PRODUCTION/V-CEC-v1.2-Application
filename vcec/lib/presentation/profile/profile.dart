import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/logout/log_out_cubit.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/common_widgets/multiple_column_text_widget.dart';
import 'package:vcec/presentation/common_widgets/profile_menu_widget.dart';
import 'package:vcec/presentation/profile/subpages/edit_profile.dart';
import 'package:vcec/presentation/profile/subpages/map_branch.dart';
import 'package:vcec/presentation/profile/subpages/settings.dart';
import 'package:vcec/strings/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final profileState = BlocProvider.of<ProfileCubit>(context).state;
      if (profileState.failureOrSuccess == none()) {
        BlocProvider.of<ProfileCubit>(context).getProfileDetails();
      }
    });
    final size1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<LogOutCubit, LogOutState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
              () => {},
              (either) => either.fold((failure) {
                    if (!state.isLoading) {
                      if (failure == const MainFailure.serverFailure()) {
                        displaySnackBar(
                            context: context, text: "Server is down");
                      } else {
                        displaySnackBar(
                            context: context, text: "Something went wrong");
                      }
                    }
                  },
                      (r) => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ))));
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: loadingWidget,
            );
          }
          return BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: loadingWidget,
              );
            }
            state.failureOrSuccess.fold(() {}, (either) {
              either.fold((failure) {
                if (failure == const MainFailure.clientFailure()) {
                } else {
                  BlocProvider.of<ProfileCubit>(context).getProfileDetails();
                }
              }, (r) {});
            });
            return state.profileModel == null
                ? const SizedBox()
                : Scaffold(
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
                                fontSize: size1 * 0.05,
                                fontWeight: FontWeight.bold),
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${state.profileModel!.imageUrl}'))),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('${state.profileModel!.name}',
                              style: TextStyle(
                                  fontSize: size1 * 0.07,
                                  fontWeight: FontWeight.bold)),
                          Text('${state.profileModel!.email}',
                              style: TextStyle(
                                fontSize: size1 * 0.03,
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size1 * 0.301, top: size1 * 0.015),
                            child: Row(
                              children: [
                                Text('${state.profileModel!.branch}',
                                    style: TextStyle(
                                        fontSize: size1 * 0.03,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size1 * 0.025,
                                  height: size1 * 0.025,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('${maps["${state.profileModel!.branch}"]}',
                                    style: TextStyle(
                                        fontSize: size1 * 0.03,
                                        fontWeight: FontWeight.bold)),
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
                                state.profileModel!.registerNo!.isNotEmpty
                                    ? MultipleColumnText(
                                        width: 44,
                                        size1: size1,
                                        text: 'Register Number',
                                        text1:
                                            '${state.profileModel!.registerNo}')
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 10,
                                ),
                                state.profileModel!.admissionNo!.isNotEmpty
                                    ? MultipleColumnText(
                                        width: 27,
                                        size1: size1,
                                        text: 'Admission Number',
                                        text1:
                                            '${state.profileModel!.admissionNo}')
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 10,
                                ),
                                state.profileModel!.admissionNo!.isNotEmpty
                                    ? MultipleColumnText(
                                        width: 20,
                                        size1: size1,
                                        text: 'IEEE Membership ID',
                                        text1: '${state.profileModel!.ieeeNo}')
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: size1 * 0.09,
                                right: size1 * 0.09,
                                top: size1 * 0.09),
                            child: Column(
                              children: [
                                ProfileMenuWidget(
                                    title: "Settings",
                                    icon: Icons.settings,
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsPage(),
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
                                    onPress: () {
                                      BlocProvider.of<LogOutCubit>(context)
                                          .logOut();
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          });
        },
      ),
    );
  }
}
