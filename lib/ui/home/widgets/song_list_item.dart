part of '../home_screen.dart';

class SongInfoItem extends StatelessWidget {
  final SongDetailResponse songInfo;

  const SongInfoItem({Key? key, required this.songInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${songInfo.songName}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${songInfo.duration} mins",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    songInfo.artistDisplayName ?? "Unknown",
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 150,
            ),
            BlocProvider(
              create: (context) => DownloadCubit(
                songRepository: SongRepositoryImpl(
                  remoteService: SongRemoteServiceImpl(),
                  localService: SongLocalServiceImpl(),
                ),
              ),
              child: DownloadButton(
                songInfo: songInfo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
