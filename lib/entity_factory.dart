import 'package:flutter_app/entity/book_catalog_entity.dart';
import 'package:flutter_app/entity/book_category_entity.dart';
import 'package:flutter_app/entity/book_detail_entity.dart';
import 'package:flutter_app/entity/book_rank_entity.dart';
import 'package:flutter_app/entity/book_rank_one_entity.dart';
import 'package:flutter_app/entity/book_sort_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BookCatalogEntity") {
      return BookCatalogEntity.fromJson(json) as T;
    } else if (T.toString() == "BookCategoryEntity") {
      return BookCategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "BookDetailEntity") {
      return BookDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "BookRankEntity") {
      return BookRankEntity.fromJson(json) as T;
    } else if (T.toString() == "BookRankOneEntity") {
      return BookRankOneEntity.fromJson(json) as T;
    } else if (T.toString() == "BookSortEntity") {
      return BookSortEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}