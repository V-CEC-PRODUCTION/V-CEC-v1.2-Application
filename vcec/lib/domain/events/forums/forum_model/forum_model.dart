import 'dart:convert';

import 'forum_role_name.dart';

class ForumModel {
  List<AllForum>? forumRoleNames;

  ForumModel({this.forumRoleNames});

  @override
  String toString() => 'ForumModel(forumRoleNames: $forumRoleNames)';

  factory ForumModel.fromMap(Map<String, dynamic> data) => ForumModel(
        forumRoleNames: (data['ForumRoleNames'] as List<dynamic>?)
            ?.map((e) => AllForum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'ForumRoleNames': forumRoleNames?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ForumModel].
  factory ForumModel.fromJson(String data) {
    return ForumModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ForumModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ForumModel copyWith({
    List<AllForum>? forumRoleNames,
  }) {
    return ForumModel(
      forumRoleNames: forumRoleNames ?? this.forumRoleNames,
    );
  }
}
