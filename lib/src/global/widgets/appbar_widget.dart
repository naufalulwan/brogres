part of '../global.dart';

class AppbarWidget {
  const AppbarWidget({this.title = "Makanan"});

  final String? title;

  PreferredSizeWidget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        elevation: 0,
        backgroundColor: ColorUtil().secondaryVanilla,
        automaticallyImplyLeading: false,
        leadingWidth: title != null ? 50 : 88,
        leading: leading(context),
        title: title != null
            ? Text(
                title.toString(),
                style: GoogleFonts.poppins(
                    color: ColorUtil().tertiaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: ColorUtil().tertiaryBlack,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget leading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: title != null ? 0 : 11),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            context.pop();
          },
          child: Row(
            mainAxisAlignment: title != null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: ColorUtil().tertiaryBlack,
              ),
              Gap(title != null ? 0 : 5),
              title != null
                  ? const SizedBox.shrink()
                  : Text(
                      "Back",
                      style: GoogleFonts.poppins(
                          color: ColorUtil().tertiaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
