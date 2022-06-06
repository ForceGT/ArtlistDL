import 'package:artlist_dl/bloc/global_bloc_observer.dart';
import 'package:artlist_dl/bloc/song/song_cubit.dart';
import 'package:artlist_dl/data/repository/song_repository_impl.dart';
import 'package:artlist_dl/data/service/local/song_local_service_impl.dart';
import 'package:artlist_dl/data/service/remote/song_remote_service_impl.dart';
import 'package:artlist_dl/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: GlobalBlocObserver());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artlist DL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SongCubit(
              songRepository: SongRepositoryImpl(
                remoteService: SongRemoteServiceImpl(),
                localService: SongLocalServiceImpl(),
              ),
            ),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
