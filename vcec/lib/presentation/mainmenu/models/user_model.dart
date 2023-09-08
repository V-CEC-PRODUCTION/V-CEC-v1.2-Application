// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vcec/presentation/mainmenu/models/story_model.dart';

class User {
  final String name;
  final String profileImageUrl;
  final List<Story> stories;
  User({
    required this.name,
    required this.profileImageUrl,
    required this.stories,
  });
}
