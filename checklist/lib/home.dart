import 'package:checklist/features/product/veiws/product_view.dart';
import 'package:flutter/material.dart';
import 'package:checklist/features/auth/data/repository/user_repo.dart';
import 'package:checklist/features/product/data/model/product_model.dart';
import 'package:checklist/features/product/data/repositry/product_repo.dart';

class HomePage extends StatefulWidget {
  final ProductRepository productRepository;
  final UsersRepository usersRepository;
  const HomePage({
    super.key,
    required this.productRepository,
    required this.usersRepository,
  });

  @override
  State<HomePage> createState() => _HomePageState(
    productRepository: productRepository,
    usersRepository: usersRepository,
  );
}

class _HomePageState extends State<HomePage> {
  final productRepository;
  final usersRepository;
  _HomePageState({required this.productRepository, this.usersRepository});
  @override
  Widget build(BuildContext context) {
    return ProductView(productRepository, usersRepository);
  }
}
