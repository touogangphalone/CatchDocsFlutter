// import 'package:glomo/core/helpers/app_helper.dart';
// import 'package:glomo/core/persistence/abstract/json_persistable.dart';
// import 'package:glomo/core/persistence/json_serializable.dart';

import '../../helpers/app_helper.dart';
import '../../persistence/abstract/json_persistable.dart';
import '../../persistence/json_serializable.dart';

class AppConfiguration extends JsonPersistable {
  int lastInteractionAt;
  String lastUsedPhoneNumber;
  static const INTERATION_TIMEOUT = 5 * 60;
  AppConfiguration({int lastInteractionAt, String lastUsedPhoneNumber}) {
    this.lastInteractionAt = lastInteractionAt ?? timestamp();
    this.lastUsedPhoneNumber = lastUsedPhoneNumber ?? "";
  }
  static const KEY = "APP_CONFIG";
  @override
  JsonSerializable fromJson(Map<String, dynamic> json) {
    // return AppConfiguration(
    //     lastUsedPhoneNumber: json["last_used_phone_number"],
    //     lastInteractionAt: json["last_interaction_at"] ?? timestamp());
  }

  @override
  String getPersistableKey() {
    return KEY;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "last_interaction_at": lastInteractionAt,
      "last_used_phone_number": lastUsedPhoneNumber
    };
  }

  resetLastInteraction() {
    lastInteractionAt = 0;
  }

  setLastUsedPhoneNumber(String phoneNumber) {
    this.lastUsedPhoneNumber = phoneNumber;
  }
}
