import 'dart:convert';

class RequestModel {
  RequestModel._internal();
  static RequestModel instance = RequestModel._internal();
  String? accessToken;
  

  RequestModel({this.accessToken,});

  @override
  String toString() {
    return 'RequestModel(accessToken: $accessToken)';
  }

  factory RequestModel.fromMap(Map<String, dynamic> data) => RequestModel(
        accessToken: data['access_token'] as String?,
       
      );

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RequestModel].
  factory RequestModel.fromJson(String data) {
    return RequestModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RequestModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
