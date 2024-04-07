import 'dart:io';
import 'dart:developer';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/profile/profile.dart';
import 'package:vcec/strings/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int c = 0;
  File? file;
  final TextEditingController _nameController =
      TextEditingController(text: "vcec");

  final TextEditingController _emailController =
      TextEditingController(text: "vev@gmail.com");

  final TextEditingController _ieeeController =
      TextEditingController(text: "1234567890");

  final TextEditingController _admissionController =
      TextEditingController(text: "515-525-125");

  final ValueNotifier<String> _semNotifier = ValueNotifier("S1");
  final ValueNotifier<String> _branchNotifier = ValueNotifier("CSE");

  final TextEditingController _regController =
      TextEditingController(text: "chn21cs102");
  final ValueNotifier<String> _divisionNotifier = ValueNotifier("D");
  ValueNotifier<Image?> profilepicNotifier = ValueNotifier(null);
  Future<void> pickImage() async {
    final controller = CropController(
      aspectRatio: 1,
      defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
    );
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      file = File(pickedFile.path);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: const Text('Edit Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      profilepicNotifier.value =
                          await controller.croppedImage();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done))
              ],
            ),
            body: Center(
              child: CropImage(
                controller: controller,
                image: Image.file(file!),
                paddingSize: 25.0,
                alwaysMove: true,
              ),
            ),
          );
        },
      ));
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    log("init state");
    super.initState();
    final profileState = BlocProvider.of<ProfileCubit>(context).state;
    profileState.failureOrSuccess.fold(() {
      BlocProvider.of<ProfileCubit>(context).getProfileDetails();
    }, (a) {
      a.fold((l) {
        BlocProvider.of<ProfileCubit>(context).getProfileDetails();
      }, (r) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        state.failureOrSuccesss.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                      context: context,
                      text: "Something wrong with your network16");
                } else if (failure == const MainFailure.authFailure()) {
                  displaySnackBar(
                      context: context, text: 'Access token timed out');
                } else {
                  displaySnackBar(
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) async {
              Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) {
                  return const ProfileScreen();
                },
              ));
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

        return BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.failureOrSuccess.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  if (!state.isLoading) {
                    if (failure == const MainFailure.serverFailure()) {
                      displaySnackBar(context: context, text: "Server is down");
                    } else if (failure == const MainFailure.clientFailure()) {
                      displaySnackBar(
                          context: context,
                          text: "Something wrong with your network17");
                    } else if (failure == const MainFailure.authFailure()) {
                      displaySnackBar(
                          context: context, text: 'Access token timed out');
                    } else {
                      displaySnackBar(
                          context: context,
                          text: "Something Unexpected Happened");
                    }
                  }
                },
                (r) {},
              ),
            );
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: loadingWidget,
              );
            }
            state.failureOrSuccess.fold(() {
              return const Center(child: Text('Error...'));
            }, (either) {
              either.fold((failure) {
                if (failure == const MainFailure.clientFailure()) {
                  return const Center(child: Text('Network Error...'));
                } else if (failure == const MainFailure.serverFailure()) {
                  return const Center(child: Text('Server Error...'));
                } else {
                  const Center(child: Text('Impossible Error...'));
                }
              }, (r) {
                _nameController.text = r.name!;
                _emailController.text = r.email!;
                _ieeeController.text = r.ieeeMembershipNo!;
                _admissionController.text = r.admissionNo!;
                _semNotifier.value = r.semester!;
                _branchNotifier.value = r.branch!;
                _regController.text = r.registerNo!;
                _divisionNotifier.value = r.division!;
                profilepicNotifier.value =
                    Image(image: NetworkImage('${r.imageUrl}'));
              });
            });
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                title: const Text('Edit Profile',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, bottom: 4),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<EditProfileCubit>(context)
                            .putProfileDetails(
                                name: _nameController.text,
                                email: _emailController.text,
                                adno: _admissionController.text,
                                sem: _semNotifier.value,
                                branch: _branchNotifier.value,
                                regno: _regController.text,
                                div: _divisionNotifier.value,
                                ieeeno: _ieeeController.text,
                                image: file);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Color.fromARGB(255, 66, 159, 69),
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: profilepicNotifier,
                            builder: (context, value, child) {
                              return profilepicNotifier.value == null
                                  ? const CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.grey,
                                    )
                                  : CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          profilepicNotifier.value!.image,
                                    );
                            },
                          ),
                          GestureDetector(
                            onTap: pickImage,
                            child: const CircleAvatar(
                              radius: 23,
                              backgroundColor: Color.fromARGB(255, 71, 71, 71),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      kheight20,
                      kheight20,
                      _TextFieldWithTitle(
                        title: "Name",
                        controller: _nameController,
                      ),
                      _TextFieldWithTitle(
                        title: "Email",
                        controller: _emailController,
                      ),
                      _TextFieldWithTitle(
                        title: "IEEE Membership No",
                        controller: _ieeeController,
                      ),
                      _TextFieldWithTitle(
                        title: "Admission No",
                        controller: _admissionController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.58),
                        child: _DropdownWithTitle(
                          title: "Semester",
                          items: const [
                            "S1",
                            "S2",
                            "S3",
                            "S4",
                            "S5",
                            "S6",
                            "S7",
                            "S8"
                          ],
                          selectedValue: _semNotifier,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.58),
                        child: _DropdownWithTitle(
                          title: "Branch",
                          items: const ["CSE", "ECE", "EEE"],
                          selectedValue: _branchNotifier,
                        ),
                      ),
                      _TextFieldWithTitle(
                        title: "Reg No",
                        controller: _regController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.58),
                        child: _DropdownWithTitle(
                          title: "Division",
                          items: const ["A", "B", "C", "D", "E"],
                          selectedValue: _divisionNotifier,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TextFieldWithTitle extends StatelessWidget {
  const _TextFieldWithTitle({required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}

class _DropdownWithTitle extends StatefulWidget {
  final String title;
  final List<String> items;
  final ValueNotifier<String> selectedValue;

  const _DropdownWithTitle(
      {required this.title, required this.items, required this.selectedValue});

  @override
  _DropdownWithTitleState createState() => _DropdownWithTitleState();
}

class _DropdownWithTitleState extends State<_DropdownWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        ValueListenableBuilder(
            valueListenable: widget.selectedValue,
            builder: (context, value, child) {
              return DropdownButton<String>(
                value: widget.selectedValue.value,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.selectedValue.value = newValue!;
                  });
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            }),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
