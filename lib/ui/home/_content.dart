part of 'home_screen.dart';

class _Content extends StatelessWidget {
  final List<SongDetailResponse> songList;

  const _Content({Key? key, required this.songList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: ListView.builder(
          itemCount: songList.length,
          itemBuilder: (_, index) {
            return SongInfoItem(
              songInfo: songList[index],
            );
          }),
    );
  }
}
