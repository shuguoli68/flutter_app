import 'package:flutter_app/bean/wy_news_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_catalog_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_category_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_content_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_detail_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_query_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_rank_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_rank_one_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_recommend_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_search_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_sort_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_source_entity.dart';
import 'package:flutter_app/bean/zhuishu/search_hotword_entity.dart';
import 'package:flutter_app/items/weather_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "WyNewsEntity") {
      return WyNewsEntity.fromJson(json) as T;
    } else if (T.toString() == "BookCatalogEntity") {
      return BookCatalogEntity.fromJson(json) as T;
    } else if (T.toString() == "BookCategoryEntity") {
      return BookCategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "BookContentEntity") {
      return BookContentEntity.fromJson(json) as T;
    } else if (T.toString() == "BookDetailEntity") {
      return BookDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "BookQueryEntity") {
      return BookQueryEntity.fromJson(json) as T;
    } else if (T.toString() == "BookRankEntity") {
      return BookRankEntity.fromJson(json) as T;
    } else if (T.toString() == "BookRankOneEntity") {
      return BookRankOneEntity.fromJson(json) as T;
    } else if (T.toString() == "BookRecommendEntity") {
      return BookRecommendEntity.fromJson(json) as T;
    } else if (T.toString() == "BookSearchEntity") {
      return BookSearchEntity.fromJson(json) as T;
    } else if (T.toString() == "BookSortEntity") {
      return BookSortEntity.fromJson(json) as T;
    } else if (T.toString() == "BookSourceEntity") {
      return BookSourceEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchHotwordEntity") {
      return SearchHotwordEntity.fromJson(json) as T;
    } else if (T.toString() == "WeatherEntity") {
      return WeatherEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}