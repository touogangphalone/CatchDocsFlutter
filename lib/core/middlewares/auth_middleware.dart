import 'package:flutter/cupertino.dart';

class AuthMiddleware extends StatefulWidget {
  final Widget child;

  const AuthMiddleware({Key key, this.child}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AuthMiddlewareState();
  }
}

class AuthMiddlewareState extends State<AuthMiddleware> {
  @override
  Widget build(BuildContext context) {
    // return Consumer<AuthProvider>(
    //   builder: (w, authProvider, _) {
    //     if (!authProvider.loggedIn) {
    //       return LoginScreen();
    //     }
    //     if (!authProvider.hasSendSignature) {
    //       return AcceptTermsAndConditionsScreen();
    //     }
    //     if (!authProvider.hasSendProfileImages) {
    //       return UpdateProfileImagesScreen();
    //     }
    //     return SessionMiddleware(child: widget.child);
    //   },
    // );
  }
}
