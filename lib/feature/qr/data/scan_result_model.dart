import 'package:fourth_pyramid_task2/feature/qr/data/scan_model.dart';

class ScanResultModel {
  final int status;
  final String massage;
  final List<ScanModel> scanData;

  ScanResultModel({
    required this.status,
    required this.massage,
    required this.scanData,
  });
  factory ScanResultModel.fromJson(Map<String, dynamic> json) {
    return ScanResultModel(
      status: json['status'],
      massage: json['massage'],
      scanData: List<ScanModel>.from(
        json['data'].map((scan) => ScanModel.fromJson(scan)),
      ),
    );
  }
}
