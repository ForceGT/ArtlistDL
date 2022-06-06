import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class DownloadState extends Equatable {
  final String? message;
  final double? progress;
  final String? songId;

  const DownloadState({this.message = "", this.progress = 0, this.songId = ""});

  @override
  List<Object?> get props => [progress, songId, message];
}

class DownloadInitialState extends DownloadState {
  const DownloadInitialState();
}

class DownloadInProgress extends DownloadState {
  final double percentProgress;
  final String id;

  const DownloadInProgress({required this.percentProgress, required this.id})
      : super(progress: percentProgress, songId: id);
}

class DownloadSuccess extends DownloadState {}

class DownloadFailed extends DownloadState {
  final String error;

  const DownloadFailed({required this.error}) : super(message: error);
}
