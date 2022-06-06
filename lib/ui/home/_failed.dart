part of 'home_screen.dart';

class _Failed extends StatelessWidget {
  const _Failed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = SongCubit.c(context, true).state.message;

    return Text(
      message ?? "Something went wrong, please try again",
      style: const TextStyle(fontSize: 16, color: Colors.redAccent),
    );
  }
}
