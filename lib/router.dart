import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/views.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const MaterialPage(
        child: MainScreen(),
      ),
    ),
    GoRoute(
      path: '/add-expense',
      name: 'add-expense',
      pageBuilder: (context, state) => const MaterialPage(
        child: AddExpenseScreen(),
      ),
    ),
  ],
);
