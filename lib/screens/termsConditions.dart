import 'package:flutter/material.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';


class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1('Terms & Conditions'),
      body: const Text('Terms & Conditions'),
      bottomNavigationBar: CustomBottomNavigation(-1),
    );
  }
}
