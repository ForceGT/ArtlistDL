import 'package:artlist_dl/bloc/song/home_screen_state.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/song_repository.dart';

class SongCubit extends Cubit<HomeScreenState> {
  final SongRepository songRepository;

  SongCubit({required this.songRepository}) : super(HomeScreenInitialState());

  static SongCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<SongCubit>(context, listen: listen);

  Future<void> search(String searchText) async {
    emit(HomeScreenLoading());
    try {
      var id = _extractIdFromSearchText(searchText);
      List<SongDetailResponse> response;
      if (id[0] == "song") {
        debugPrint("Searching for songId: ${id[1]}");
        response = await songRepository.getSingleSongInfo(songId: id[1]);
      } else {
        debugPrint("Searching for albumId: ${id[1]}");
        response = await songRepository.getSongInfoFromAlbum(albumId: id[1]);
      }
      emit(HomeScreenSuccess(data: response));
    } catch (e) {
      emit(HomeScreenFailed(message: e.toString()));
    }
  }

  List<String> _extractIdFromSearchText(String searchText) {
    var splits = searchText.split("/");
    debugPrint('splits: $splits');
    var type = splits[3];
    var id = splits[4];
    debugPrint('type: $type, id: $id');

    if (type == "album") {
      return ["album", id];
    } else {
      return ["song", id];
    }
  }
}
