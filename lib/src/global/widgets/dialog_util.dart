part of '../global.dart';

class DialogUtil {
  static void show(BuildContext context,
      {required String title,
      required String message,
      String? textButton,
      required void Function() onTap}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => _MyDialog(
              title: title,
              content: message,
              textButton: textButton,
              onTap: onTap,
            ));
  }
}

class _MyDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? textButton;
  final void Function() onTap;

  const _MyDialog({
    required this.title,
    required this.content,
    this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: ColorUtil().tertiaryBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const Gap(15),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            const Gap(25),
            ButtonOrangeWidget(
              text: textButton ?? "Coba Lagi",
              onPressed: () {
                onTap();
              },
            )
          ],
        ),
      ),
    );
  }
}
