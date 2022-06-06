import 'package:artlist_dl/bloc/download/download_cubit.dart';
import 'package:artlist_dl/bloc/download/download_state.dart';
import 'package:artlist_dl/bloc/song/home_screen_state.dart';
import 'package:artlist_dl/bloc/song/song_cubit.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:artlist_dl/data/repository/song_repository_impl.dart';
import 'package:artlist_dl/data/service/local/song_local_service_impl.dart';
import 'package:artlist_dl/data/service/remote/song_remote_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '_content.dart';
part '_failed.dart';
part '_loading.dart';
part 'widgets/download_button.dart';
part 'widgets/song_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Welcome to Artlist DL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                hintText: 'Enter the url you want to download',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  SongCubit.c(context).search(value);
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SongCubit, HomeScreenState>(
              builder: (context, state) {
                final loading = state is HomeScreenLoading;
                final failed = state is HomeScreenFailed;
                final success = state is HomeScreenSuccess;

                Widget content = const SizedBox();
                if (loading) {
                  content = const _Loading();
                } else if (success) {
                  content = _Content(
                    songList: state.songList!,
                  );
                } else if (failed) {
                  content = const _Failed();
                }

                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: content,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
