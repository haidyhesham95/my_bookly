import 'package:bookly_app/features/model/volume_info.dart';

class BookModel {
  final VolumeInfo? volumeInfo;

  BookModel({this.volumeInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfo.fromJson(json['volumeInfo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'volumeInfo': volumeInfo?.toJson(),
    };
  }
}

