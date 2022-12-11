class StatusModel {
  final int status;
  final String massage;

  StatusModel({
    required this.status,
    required this.massage,
  });
  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      status: json['status'],
      massage: json['massage'],
    );
  }
}
