part of '../product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
