class ScanModel {
  final int id;
  final String code;
  final String createdAt;
  final String updatedAt;
  final String scannerId;

  ScanModel({
    required this.id,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
    required this.scannerId,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['id'],
      code: json['code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      scannerId: json['scanner_id'],
    );
  }
}
