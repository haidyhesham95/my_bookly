import 'image_link.dart';

class VolumeInfo {
  final String? title;
  final String? publisher;
  final String? description;
  final List<String>?authors;
  final  int? pageCount;
  final String? publishedDate;
  final  String? previewLink;

  final ImageLinks? imageLinks;

  VolumeInfo( { required this.previewLink,required this.publishedDate, required this.pageCount, required this.publisher, required this.description,required this.title, required this.authors, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      previewLink: json['previewLink'],
      publishedDate: json['publishedDate'],
      pageCount: json['pageCount'],
      publisher: json['publisher'],
      description: json['description'],
      title: json['title'],
      authors: List<String>.from(json['authors']),
      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'previewLink': previewLink,
      'publishedDate': publishedDate,
      'pageCount': pageCount,
      'publisher': publisher,
      'description': description,
      'title': title,
      'authors': authors,
      'imageLinks': imageLinks?.toJson(),
    };
  }
}
