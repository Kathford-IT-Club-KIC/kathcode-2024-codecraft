

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPref {
  static String accessToken = 'accessToken';
  static String hasSeenOnBoarding = 'hasSeenOnBoarding';


  static const secureStorage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  static Future<void> saveOnboardingStatus(
      {required bool hasSeenOnboarding}) async {
    await secureStorage.write(
        key: hasSeenOnBoarding, value: hasSeenOnboarding ? 'true' : 'false');
  }
  static Future<bool> getOnboardingStatus() async{
    final onboardingStatusStr =
    (await secureStorage.readAll())[hasSeenOnBoarding];
    if (onboardingStatusStr == null) {
      return false; // User hasn't seen onboarding yet
    }
  return onboardingStatusStr == 'true';
}

static Future<bool> checkAccessToken() async {
  try {
    final String? token = (await secureStorage.read(key: accessToken));
    print("Token: ${token}");
if (token == null || token.isEmpty) {
// Token not present
return false;
}
// For simplicity, we're considering a non-empty token as valid
return token.length > 40; // Assuming token is valid if present
} catch (e) {
// Handle any errors here, such as reading from secure storage failing
return false;
}
}
static Future<void> updateAccessToken({required String token}) async {
  await secureStorage.write(key: accessToken, value: token);
}
static Future<String> getAccessToken() async {
  String? accessTokenValue = (await secureStorage.read(key: accessToken));
return accessTokenValue ?? '';
}

static reset() async {
await secureStorage.deleteAll();
}

}
