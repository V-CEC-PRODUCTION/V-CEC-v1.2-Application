// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:story/story_image.dart';
// import 'package:vcec/presentation/mainmenu/models/story_model.dart';
// import 'package:vcec/presentation/mainmenu/widgets/story_data.dart';
// import 'package:vcec/presentation/mainmenu/widgets/story_user_widget.dart';

// import 'package:video_player/video_player.dart';

// import '../models/user_model.dart';

// class StoryUserScreen extends StatefulWidget {
//   final List<Story> stories;
//   int userPageIndex;

//   StoryUserScreen({
//     super.key,
//     required this.stories,
//     required this.userPageIndex,
//   });

//   @override
//   _StoryScreenState createState() => _StoryScreenState();
// }

// class _StoryScreenState extends State<StoryUserScreen>
//     with SingleTickerProviderStateMixin {
//   late PageController _childPageController;
//   late PageController _pageController;
//   late AnimationController _animController;
//   VideoPlayerController? _videoController;
//   int _currentIndex = 0;
//   final _pageNotifier = ValueNotifier(0.0);
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();

//     _childPageController = PageController();
//     _pageController = PageController(initialPage: widget.userPageIndex);
//     _animController = AnimationController(vsync: this);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _pageController.addListener(_listener);
//     });
//     _pageTimer();
//     final Story firstStory = widget.stories.first;
//     _loadStory(story: firstStory, animateToPage: false);

//     _animController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animController.stop();
//         _animController.reset();
//         setState(() {
//           if (_currentIndex + 1 < widget.stories.length) {
//             _currentIndex += 1;
//             _loadStory(story: widget.stories[_currentIndex]);
//           } else {
//             // _currentIndex = 0;
//             // _loadStory(story: widget.stories[_currentIndex]);
//             Navigator.of(context).pop();
//           }
//         });
//       }
//     });
//   }

//   void _listener() {
//     _pageNotifier.value = _pageController.page!;
//   }

//   void _handlePage(int page) {
//     setState(() {
//       widget.userPageIndex = page;
//       _currentIndex = 0;
//       _animController.reset();
//       _animController.forward();
//       isStoryViewed[page] = true;
//     });
//   }

//   void _pageTimer() {
//     _timer =
//         Timer.periodic(widget.stories[_currentIndex].duration, (Timer timer) {
//       if (_currentIndex == widget.stories.length - 1) {
//         widget.userPageIndex++;
//       } else {
//         widget.userPageIndex;
//       }

//       _pageController.animateToPage(
//         widget.userPageIndex,
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeIn,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _pageController.removeListener(_listener);
//     _childPageController.dispose();
//     _animController.dispose();
//     _videoController?.dispose();
//     _pageNotifier.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final User user = users[widget.userPageIndex];
//     final Story story = user.stories[_currentIndex];
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: ValueListenableBuilder(
//             valueListenable: _pageNotifier,
//             builder: (context, value, child) {
//               return PageView.builder(
//                   controller: _pageController,
//                   physics: const ClampingScrollPhysics(),
//                   itemCount: users.length,
//                   onPageChanged: _handlePage,
//                   itemBuilder: ((context, index) {
//                     final isLeaving = (index - value) <= 0;
//                     final t = (index - value);
//                     final rotationY = lerpDouble(0, 90, t);
//                     final transform = Matrix4.identity();

//                     transform.setEntry(3, 2, 0.003);
//                     transform.rotateY(double.parse('${-degToRad(rotationY!)}'));

//                     return GestureDetector(
//                         onTapDown: (details) => _onTapDown(details, story),
//                         child: Transform(
//                           alignment: isLeaving
//                               ? Alignment.centerRight
//                               : Alignment.centerLeft,
//                           transform: transform,
//                           child: Stack(
//                             children: <Widget>[
//                               PageView.builder(
//                                 controller: _childPageController,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemCount: user.stories.length,
//                                 itemBuilder: (context, index) {
//                                   final Story story = user.stories[index];
//                                   switch (story.media) {
//                                     case MediaType.image:
//                                       return StoryImage(
//                                         key: ValueKey(story.url),
//                                         imageProvider: NetworkImage(
//                                           story.url,
//                                         ),
//                                         fit: BoxFit.cover,
//                                       );
//                                     case MediaType.video:
//                                       if (_videoController != null &&
//                                           _videoController!
//                                               .value.isInitialized) {
//                                         return FittedBox(
//                                           fit: BoxFit.cover,
//                                           child: SizedBox(
//                                             width: _videoController!
//                                                 .value.size.width,
//                                             height: _videoController!
//                                                 .value.size.height,
//                                             child:
//                                                 VideoPlayer(_videoController!),
//                                           ),
//                                         );
//                                       }
//                                   }
//                                   return const SizedBox.shrink();
//                                 },
//                               ),
//                               Positioned(
//                                 top: 40.0,
//                                 left: 10.0,
//                                 right: 10.0,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Row(
//                                       children: widget.stories
//                                           .asMap()
//                                           .map((i, e) {
//                                             return MapEntry(
//                                               i,
//                                               AnimatedBar(
//                                                 animController: _animController,
//                                                 position: i,
//                                                 currentIndex: _currentIndex,
//                                               ),
//                                             );
//                                           })
//                                           .values
//                                           .toList(),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 1.5,
//                                         vertical: 10.0,
//                                       ),
//                                       child: UserInfo(user: user),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ));
//                   }));
//             }));
//   }

//   void _onTapDown(TapDownDetails details, Story story) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double dx = details.globalPosition.dx;
//     if (dx < screenWidth / 3) {
//       setState(() {
//         if (_currentIndex - 1 >= 0) {
//           _currentIndex -= 1;
//           _loadStory(story: widget.stories[_currentIndex]);
//         } else {
//           _pageController.animateToPage(widget.userPageIndex - 1,
//               duration: const Duration(milliseconds: 250),
//               curve: Curves.easeIn);
//         }
//       });
//     } else if (dx > 2 * screenWidth / 3) {
//       setState(() {
//         if (_currentIndex + 1 < widget.stories.length) {
//           _currentIndex += 1;
//           _loadStory(story: widget.stories[_currentIndex]);
//         } else {
//           // _currentIndex = 0;
//           // _loadStory(story: widget.stories[_currentIndex]);

//           _pageController.animateToPage(widget.userPageIndex + 1,
//               duration: const Duration(milliseconds: 250),
//               curve: Curves.easeIn);

//           if (widget.userPageIndex + 1 == users.length) {
//             if (_currentIndex + 1 == widget.stories.length) {
//               Navigator.of(context).pop();
//             }
//           }
//         }
//       });
//     } else {
//       if (story.media == MediaType.video) {
//         if (_videoController!.value.isPlaying) {
//           _videoController?.pause();
//           _animController.stop();
//         } else {
//           _videoController?.play();
//           _animController.forward();
//         }
//       }
//     }
//   }

//   void _loadStory({required Story story, bool animateToPage = true}) {
//     _animController.stop();
//     _animController.reset();
//     try {
//       switch (story.media) {
//         case MediaType.image:
//           _animController.duration = story.duration;
//           _animController.forward();
//           break;
//         case MediaType.video:
//           _videoController = null;
//           _videoController?.dispose();
//           _videoController =
//               VideoPlayerController.networkUrl(Uri.parse(story.url))
//                 ..initialize().then((_) {
//                   setState(() {});
//                   if (_videoController!.value.isInitialized) {
//                     _animController.duration = _videoController!.value.duration;
//                     _videoController?.play();
//                     _animController.forward();
//                   }
//                 });
//           break;
//       }
//     } catch (e) {
//       //  print(e);
//     }
//     if (animateToPage) {
//       _childPageController.animateToPage(
//         _currentIndex,
//         duration: const Duration(milliseconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
// }

// class AnimatedBar extends StatelessWidget {
//   final AnimationController animController;
//   final int position;
//   final int currentIndex;

//   const AnimatedBar({
//     super.key,
//     required this.animController,
//     required this.position,
//     required this.currentIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 1.5),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return Stack(
//               children: <Widget>[
//                 _buildContainer(
//                   double.infinity,
//                   position < currentIndex
//                       ? Colors.white
//                       : Colors.white.withOpacity(0.5),
//                 ),
//                 position == currentIndex
//                     ? AnimatedBuilder(
//                         animation: animController,
//                         builder: (context, child) {
//                           return _buildContainer(
//                             constraints.maxWidth * animController.value,
//                             Colors.white,
//                           );
//                         },
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Container _buildContainer(double width, Color color) {
//     return Container(
//       height: 5.0,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(
//           color: Colors.black26,
//           width: 0.8,
//         ),
//         borderRadius: BorderRadius.circular(3.0),
//       ),
//     );
//   }
// }

// class UserInfo extends StatelessWidget {
//   final User user;

//   const UserInfo({
//     super.key,
//     required this.user,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Hero(
//           tag: user.name,
//           child: CircleAvatar(
//             radius: 20.0,
//             backgroundColor: Colors.grey[300],
//             backgroundImage: NetworkImage(
//               user.profileImageUrl,
//             ),
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         Expanded(
//           child: Text(
//             user.name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(
//             Icons.close,
//             size: 30.0,
//             color: Colors.white,
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     );
//   }
// }

// double pI = 3.141592653589793238;
// double degToRad(double degree) {
//   return degree * pI / 180;
// }
