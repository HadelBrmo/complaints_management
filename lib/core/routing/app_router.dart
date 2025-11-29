import 'package:flutter/material.dart';

import '../../features/otp/ui/screens/otp_screen.dart';

class AppRouter{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "/otp":
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text("No Route Define "),
          ),
        ));
    }
    return null;
  }
}