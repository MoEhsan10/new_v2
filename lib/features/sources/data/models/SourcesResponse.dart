import 'Source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;

  SourcesResponse({
      this.status, 
      this.sources,});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
}