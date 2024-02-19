// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';

final List<User> users = [
  User(name: 'Abhishekh', profileImageUrl: image[0], stories: [
    Story(
      url: image[1],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url: image[0],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url:
          'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
      media: MediaType.video,
      duration: const Duration(seconds: 10),
    )
  ]),
  User(name: 'Abhishek', profileImageUrl: image[1], stories: [
    Story(
      url: image[0],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url: image[1],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url:
          'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
      media: MediaType.video,
      duration: const Duration(seconds: 10),
    )
  ]),
  User(name: 'Abhi', profileImageUrl: image[2], stories: [
    Story(
      url: image[1],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url: image[2],
      media: MediaType.image,
      duration: const Duration(seconds: 10),
    ),
    Story(
      url:
          'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
      media: MediaType.video,
      duration: const Duration(seconds: 10),
    )
  ]),
];
