part of '../exception.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ExceptionContentComponent(
          image: AssetString.useMaintenance,
          title: "Ups! Layanan Sedang Dalam Perbaikan",
          message:
              "Sepertinya tidak ada apa pun di sini. Klik tombol di bawah untuk kembali ke halaman utama."),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: buttonOrangeWidget(
            text: "Kembali",
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
    );
  }
}
