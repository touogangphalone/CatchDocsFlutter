// import 'package:glomo/ui/helpers/dialogs.dart';

abstract class AbstractApiError extends Error {
  final int code;
  final String message;
  final String type;
  Map<String, dynamic> data = {};
  String explanation = "";
  AbstractApiError(this.code, this.message, this.type,
      {this.explanation, this.data})
      : super();

  bool isErrorOfType(String errorType) {
    return this.type == errorType;
  }

  void toToast(context) {
    showWarningDialog(
      context,
      message,
    );
  }

  @override
  String toString() {
    return this.runtimeType.toString() + ": " + message;
  }

  void showWarningDialog(context, String message) {}
}
