part of '../home_screen.dart';

class DownloadButton extends StatelessWidget {
  final SongDetailResponse songInfo;

  const DownloadButton({
    Key? key,
    required this.songInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadCubit, DownloadState>(
      builder: (context, state) {
        if (state is DownloadInProgress) {
          return Wrap(
            direction: Axis.vertical,
            children: [
              const Text("Downloading..."),
              Text("${state.percentProgress.toStringAsFixed(0)}%"),
            ],
          );
        } else if (state is DownloadSuccess) {
          return Wrap(
            direction: Axis.vertical,
            children: [
              const Text("Downloaded Successfully!"),
              CupertinoButton(
                onPressed: () {
                  DownloadCubit.c(context).download(songInfo);
                },
                child: const Text("Download Again"),
              )
            ],
          );
        } else if (state is DownloadFailed) {
          return Wrap(
            direction: Axis.vertical,
            children: [
              const Text("Download Failed.."),
              Text("${state.message}"),
              CupertinoButton(
                onPressed: () {
                  DownloadCubit.c(context).download(songInfo);
                },
                child: const Text("Try again"),
              )
            ],
          );
        } else if (state is DownloadInitialState) {
          return CupertinoButton(
            onPressed: () {
              DownloadCubit.c(context).download(songInfo);
            },
            child: const Text("Download"),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
