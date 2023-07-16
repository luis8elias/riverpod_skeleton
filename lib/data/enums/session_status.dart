import '/presentation/home/home_screen.dart';
import '/presentation/login/login_screen.dart';
import '/widgets/loaders.dart';

enum SessionState{
  loading(LoaderScreen.routeName),
  unauthenticatedUser(LoginScreen.routeName),
  authenticatedUser(HomeScreen.routeName);
  
  final String route;
  const SessionState(this.route);
}