import 'package:shared_preferences/shared_preferences.dart';

/* 
 *SharedPreferences in flutter uses NSUserDefaults on iOS and SharedPreferences on Android, providing a persistent store for simple data. 
 * 
*/
class SharedPrefrenceHelper {
  static const String DEFAULT_COUNTRY = "default_country";
  static const String DEFAULT_NEWS_SOURCE = "default_news_source";
  static const String IS_ONBOARDING_COMPLETED = "is_onboarding_completed";

// Shared  Pref instance
  Future<SharedPreferences> getSharePrefInstance() {
    return SharedPreferences.getInstance();
  }

  setDefaultCountry(String countryCode) async {
    SharedPreferences pref = await getSharePrefInstance();
    pref.setString(DEFAULT_COUNTRY, countryCode);
  }

  getDefaultCountry() async {
    SharedPreferences pref = await getSharePrefInstance();
    return pref.getString(DEFAULT_COUNTRY);
  }

  setDefaultNewsSources(String newsSources) async {
    SharedPreferences pref = await getSharePrefInstance();
    pref.setString(DEFAULT_NEWS_SOURCE, newsSources);
  }

  getDefaultNewsSources() async {
    SharedPreferences pref = await getSharePrefInstance();
    return pref.getString(DEFAULT_NEWS_SOURCE);
  }

  setOnBoardingCompleted(bool isOnBoardinComplete) async {
    SharedPreferences pref = await getSharePrefInstance();
    pref.setBool(IS_ONBOARDING_COMPLETED, isOnBoardinComplete);
  }

  isOnBoardingCompleted() async {
    SharedPreferences pref = await getSharePrefInstance();
    return pref.getBool(IS_ONBOARDING_COMPLETED);
  }
}
