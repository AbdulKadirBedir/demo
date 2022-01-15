
import 'package:facebook_project/auth/login.dart';
import 'package:facebook_project/auth/signup.dart';

class AppRoutes{
    static const String LoginRoute = "/login";
    static const String SingupRoute = "/Singup";

    static final routes = {
     LoginRoute : (context)=> LoginScreen(),
     SingupRoute : (context)=> SignupScreen()
    };

    
}
