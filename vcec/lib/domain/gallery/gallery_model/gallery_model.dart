import 'dart:convert';

import 'gallery_file.dart';

class GalleryModel {
	List<GalleryFile>? galleryFiles;

	GalleryModel({this.galleryFiles});

	@override
	String toString() => 'GalleryModel(galleryFiles: $galleryFiles)';

	factory GalleryModel.fromMap(Map<String, dynamic> data) => GalleryModel(
				galleryFiles: (data['gallery_files'] as List<dynamic>?)
						?.map((e) => GalleryFile.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'gallery_files': galleryFiles?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GalleryModel].
	factory GalleryModel.fromJson(String data) {
		return GalleryModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GalleryModel] to a JSON string.
	String toJson() => json.encode(toMap());
}
