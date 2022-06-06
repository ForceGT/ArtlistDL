part of 'home_screen.dart';

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [CircularProgressIndicator(), Text("Loading results..")],
    );
  }
}
