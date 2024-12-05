part of '../../auth.dart';

class LoginRunningtextComponent extends StatelessWidget {
  const LoginRunningtextComponent({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: ColorHelper.primaryOrange),
      child: Marquee(
        text: text.toString(),
        style:
            GoogleFonts.poppins(fontSize: 14, color: ColorHelper.tertiaryBlack),
      ),
    );
  }
}
