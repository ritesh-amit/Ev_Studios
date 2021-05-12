import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String title;
  String des;
  String videoLink;
  String thumbnail;
  Timestamp timestamp;

  VideoModel(
      this.title, this.des, this.videoLink, this.thumbnail, this.timestamp);
}
