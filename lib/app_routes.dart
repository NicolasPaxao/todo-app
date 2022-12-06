import 'package:go_router/go_router.dart';
import 'package:todo_app/modules/ui/pages/todo_page.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: ((context, state) => const TodoPage())),
  ],
);
