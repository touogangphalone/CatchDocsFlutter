import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:glomo/core/helpers/app_helper.dart';
// import 'package:glomo/core/models/infrastructure/app_configuration.dart';
// import 'package:glomo/core/providers/auth_provider.dart';
// import 'package:glomo/core/providers/session_provider.dart';
// import 'package:glomo/ui/screens/auth/login_screen.dart';
// import 'package:provider/provider.dart';

class SessionMiddleware extends StatefulWidget {
  // static const TIMEOUT = AppConfiguration.INTERATION_TIMEOUT;
  SessionMiddleware({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _SessionMiddlewareState createState() => _SessionMiddlewareState();
}

class _SessionMiddlewareState extends State<SessionMiddleware> {
  Timer _timer;
  int _lastUpdateAt;
  @override
  void initState() {
    // super.initState();
    // SessionProvider session = context.read<SessionProvider>();
    // if (session.expired) {
    //   Future.delayed(Duration(milliseconds: 100), () {
    //     context.read<AuthProvider>().logout();
    //     navigateTo(
    //         context,
    //         LoginScreen(
    //           message: "Session expired, please login again",
    //         ),
    //         replaceAll: true);
    //   });
    // }
    // _lastUpdateAt = timestamp();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer2<SessionProvider, AuthProvider>(
    //   builder: (context, sessionProvider, provider, _) => GestureDetector(
    //       behavior: HitTestBehavior.translucent,
    //       onTap: () => _interaction(),
    //       onPanDown: (_) => _interaction(),
    //       onPanUpdate: (_) => _interaction(),
    //       onTapDown: (_) {
    //         _interaction();
    //       },
    //       child: widget.child),
    // );
  }

  void _interaction() {
    // int now = timestamp();
    // if ((now - _lastUpdateAt) > SessionProvider.UPDATE_TRESHOLD) {
    //   _lastUpdateAt = now;
    //   _startTimer();
    //   context.read<SessionProvider>().updateLastInteractionTime();
    // }
  }

  void _tick(Timer timer, BuildContext context) {
    // if (!context.read<AuthProvider>().loggedIn) {
    //   this.dispose();
    //   return;
    // }
    // if (timer.tick >= SessionMiddleware.TIMEOUT) {
    //   timer.cancel();
    //   navigateTo(
    //       context,
    //       LoginScreen(
    //         message: "Session expired, please login again",
    //       ),
    //       replaceAll: true);
    // }
  }

  @override
  dispose() {
    print("dispose");
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    this._timer?.cancel();
    this._timer =
        Timer.periodic(Duration(seconds: 1), (timer) => _tick(timer, context));
  }
}
