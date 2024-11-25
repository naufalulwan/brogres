part of '../exception.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: ExceptionContentComponent(
              image: AssetString.useMaintenance,
              title: "Ups! Layanan Sedang Dalam Perbaikan",
              message:
                  "Sepertinya tidak ada apa pun di sini. Klik tombol di bawah untuk kembali ke halaman utama.")),
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
