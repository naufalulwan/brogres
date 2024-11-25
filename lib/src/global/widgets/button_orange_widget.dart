part of '../global.dart';

class ButtonOrangeWidget extends StatelessWidget {
  const ButtonOrangeWidget(
      {super.key,
      this.onPressed,
      this.text,
      this.isLoading = false,
      this.width = double.infinity});

  final void Function()? onPressed;
  final String? text;
  final bool isLoading;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Ink(
        width: width ?? double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: !isLoading
                ? ColorUtil().primaryOrange
                : ColorUtil().disabledAnthracite,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [ShadowUtil.boxButton()]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: !isLoading ? onPressed : () {},
            child: Center(
              child: !isLoading
                  ? Text(
                      text ?? "",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )
                  : LoadingAnimationWidget.progressiveDots(
                      color: ColorUtil().secondaryVanilla, size: 30),
            ),
          ),
        ),
      ),
    );
  }
}
