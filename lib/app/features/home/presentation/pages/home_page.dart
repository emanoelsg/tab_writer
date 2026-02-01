// app/features/home/presentation/pages/home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true, 
            snap: true, 
            pinned: true, 
            title: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search...',
              onSubmitted: (value) {
                // Handle search action
              },
            ),
          ),

          
          SliverToBoxAdapter(child: Column(children: [
            //list of tabs
              ]
            )),
        ],
      ),
    );
  }
}
