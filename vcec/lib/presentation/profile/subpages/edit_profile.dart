import 'dart:io';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcec/core/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "vcec");

  final TextEditingController _emailController =
      TextEditingController(text: "vev@gmail.com");

  final TextEditingController _phoneController =
      TextEditingController(text: "1234567890");

  final TextEditingController _admissionController =
      TextEditingController(text: "515-525-125");

  final TextEditingController _rollController =
      TextEditingController(text: "45");

  final TextEditingController _branchController =
      TextEditingController(text: "CSE");

  final TextEditingController _regController =
      TextEditingController(text: "chn21cs102");
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
      final file = File(pickedFile.path);
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
                image: Image.file(file),
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
  Widget build(BuildContext context) {
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
                              backgroundImage: profilepicNotifier.value!.image,
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
                title: "Phone",
                controller: _phoneController,
              ),
              _TextFieldWithTitle(
                title: "Admission No",
                controller: _admissionController,
              ),
              _TextFieldWithTitle(
                title: "Roll No",
                controller: _rollController,
              ),
              _TextFieldWithTitle(
                title: "Branch",
                controller: _branchController,
              ),
              _TextFieldWithTitle(
                title: "Reg No",
                controller: _regController,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
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
