import 'package:flutter_app/bean/wy_news_entity.dart';
import 'package:flutter_app/bean/weather_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "WyNewsEntity") {
      return WyNewsEntity.fromJson(json) as T;
    } else if (T.toString() == "WeatherEntity") {
      return WeatherEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}