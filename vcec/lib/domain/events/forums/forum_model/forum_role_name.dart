import 'dart:convert';

class AllForum {
  int? id;
  String? forumName;
  String? displayName;
  String? forumRoleName;

  AllForum({
    this.id,
    this.forumName,
    this.displayName,
    this.forumRoleName,
  });

  @override
  String toString() {
    return 'ForumRoleName(id: $id, forumName: $forumName, displayName: $displayName, forumRoleName: $forumRoleName)';
  }

  factory AllForum.fromMap(Map<String, dynamic> data) => AllForum(
        id: data['id'] as int?,
        forumName: data['forum_name'] as String?,
        displayName: data['display_name'] as String?,
        forumRoleName: data['forum_role_name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'forum_name': forumName,
        'display_name': displayName,
        'forum_role_name': forumRoleName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllForum].
  factory AllForum.fromJson(String data) {
    return AllForum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllForum] to a JSON string.
  String toJson() => json.encode(toMap());

  AllForum copyWith({
    int? id,
    String? forumName,
    String? displayName,
    String? forumRoleName,
  }) {
    return AllForum(
      id: id ?? this.id,
      forumName: forumName ?? this.forumName,
      displayName: displayName ?? this.displayName,
      forumRoleName: forumRoleName ?? this.forumRoleName,
    );
  }
}
