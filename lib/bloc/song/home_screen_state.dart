import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class HomeScreenState extends Equatable {
  final List<SongDetailResponse>? songList;
  final String? message;

  const HomeScreenState({this.songList, this.message});

  @override
  List<Object?> get props => [songList, message];
}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenSuccess extends HomeScreenState {
  const HomeScreenSuccess({required List<SongDetailResponse> data}) : super(songList: data);
}

class HomeScreenFailed extends HomeScreenState {
  const HomeScreenFailed({required String message}) : super(message: message);
}
