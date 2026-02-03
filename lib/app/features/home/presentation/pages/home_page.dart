// app/features/home/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:tab_writer/app/core/themes/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          leading: const Icon(Icons.search),
          hintText: 'Search...',
          onSubmitted: (value) {
            // Handle search action
          },
        ),
      ),
      backgroundColor: AppColors.homeBackground,
      drawer: const Drawer(),
    );
  }
}
