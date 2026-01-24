// app/core/routes/router.dart
import 'package:go_router/go_router.dart';
import 'package:tab_writer/app/features/home/presentation/pages/home_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
   
  ],
);