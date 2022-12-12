import 'package:fourth_pyramid_task2/feature/qr/data/scan_model.dart';

class ScanPostModel {
  final int status;
  final String massage;
  final ScanModel scanData;

  ScanPostModel({
    required this.status,
    required this.massage,
    required this.scanData,
  });
  factory ScanPostModel.fromJson(Map<String, dynamic> json) {
    return ScanPostModel(
      status: json['status'],
      massage: json['massage'],
      scanData: ScanModel.fromJson(json['data']),
    );
  }
}
