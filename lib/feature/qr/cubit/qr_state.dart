part of 'qr_cubit.dart';

abstract class QrState {}

class QrInitial extends QrState {}

class QrScanLoading extends QrState {}

class QrScanLoaded extends QrState {}

class QrResultLoading extends QrState {}

class QrResultLoaded extends QrState {
  final ScanResultModel scanResult;

  QrResultLoaded({required this.scanResult});
}
