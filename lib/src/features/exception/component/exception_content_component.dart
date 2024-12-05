part of '../exception.dart';

class ExceptionContentComponent extends StatelessWidget {
  const ExceptionContentComponent(
      {super.key,
      required this.image,
      required this.title,
      required this.message});

  final String image;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 38),
              child: Image.asset(
                image,
                width: 330,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(message,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: ColorHelper.color("727272"))),
          ],
        ),
      ),
    );
  }
}
