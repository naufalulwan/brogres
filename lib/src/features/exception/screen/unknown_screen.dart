part of '../exception.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: ExceptionContentComponent(
        image: AssetString.useEmpty,
        title: "Ups! Halaman ini kosong",
        message:
            "Sepertinya tidak ada apa pun di sini. Klik tombol di bawah untuk kembali ke halaman utama.",
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ButtonOrangeWidget(
          text: "Kembali",
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
