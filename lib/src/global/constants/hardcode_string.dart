import '../global.dart';

class HardCodeString {
  static final List<Map<String, dynamic>> onboardingPages = [
    {
      "title": "Pelayanan Terjamin",
      "description":
          "Memastikan layanan yang konsisten, berkualitas, dan dapat diandalkan, memberikan rasa aman serta kepuasan pelanggan.",
      "image": AssetString.useOnboarding1,
      "intersect": AssetString.useIntersect1
    },
    {
      "title": "Pembayaran Mudah",
      "description":
          "Menyediakan proses pembayaran yang cepat, sederhana, dan tanpa hambatan untuk kenyamanan pelanggan.",
      "image": AssetString.useOnboarding2,
      "intersect": AssetString.useIntersect2
    },
    {
      "title": "Makanan Istimewa",
      "description":
          "Menawarkan hidangan berkualitas tinggi dengan cita rasa unik yang disiapkan secara khusus untuk memberikan pengalaman kuliner yang berkesan.",
      "image": AssetString.useOnboarding3,
      "intersect": AssetString.useIntersect3
    }
  ];

  static const String errorRemote =
      "tidak dapat terhubung ke server, silahkan coba lagi";
}
