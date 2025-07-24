import 'package:go_router/go_router.dart';

import '../../features/categories/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => const CategoriesScreen()),
    GoRoute(
      path: "/category/:id",
      builder: (context, state) =>
          CategoryScreen(categoryId: state.pathParameters['id'] ?? 'no-id'),
    ),
  ],
);
