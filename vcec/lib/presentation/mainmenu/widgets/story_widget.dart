// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:vcec/core/constants.dart';
// import 'package:vcec/presentation/mainmenu/widgets/story_image_upload_widget.dart';

// import 'package:vcec/presentation/mainmenu/widgets/story_user_widget.dart';
// import 'package:vcec/presentation/mainmenu/widgets/story_video_upload_widget.dart';

// class StoryWidget extends StatefulWidget {
//   const StoryWidget({super.key});

//   @override
//   State<StoryWidget> createState() => _StoryPartState();
// }

// class _StoryPartState extends State<StoryWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         kwidth10,
//         GestureDetector(
//           onTap: () {
//             showModalBottomSheet(
//                 context: context,
//                 builder: ((context) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       height: 150,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const StoryImageUploadWidget()));
//                               },
//                               icon: Container(
//                                 width: 60,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: Colors.pink, width: 2),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.image_sharp,
//                                   color: Colors.black,
//                                 ),
//                               )),
//                           IconButton(
//                               onPressed: () async {
//                                 XFile? media = await ImagePicker()
//                                     .pickVideo(source: ImageSource.gallery);

//                                 if (media != null) {
//                                   final path = media.path;
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               StoryVideoUploadWidget(
//                                                 path: path,
//                                               )));

//                                   setState(() {
//                                     media = null;
//                                   });
//                                 }
//                               },
//                               icon: Container(
//                                 width: 60,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: Colors.pink, width: 2),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.slow_motion_video_outlined,
//                                   color: Colors.black,
//                                 ),
//                               ))
//                         ],
//                       ),
//                     ),
//                   );
//                 }));
//           },
//           child: Stack(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.pink, width: 2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Center(child: Text('Image')),
//               ),
//               Positioned(
//                 top: 35,
//                 bottom: 0,
//                 left: 40,
//                 right: 3,
//                 child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.pink,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         size: 15,
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     )),
//               ),
//             ],
//           ),
//         ),
//         kwidth10,
//         const StoryUserWidget()
//       ],
//     );
//   }
// }
