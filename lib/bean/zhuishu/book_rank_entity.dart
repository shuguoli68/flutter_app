/**
 * 所有排行榜
 * http://api.zhuishushenqi.com/ranking/gender
 */
class BookRankEntity {
	List<BookRankItem> epub;
	List<BookRankItem> female;
	bool ok;
	List<BookRankItem> male;
	List<BookRankItem> picture;

	BookRankEntity({this.epub, this.female, this.ok, this.male, this.picture});

	BookRankEntity.fromJson(Map<String, dynamic> json) {
		if (json['epub'] != null) {
			epub = new List<BookRankItem>();(json['epub'] as List).forEach((v) { epub.add(new BookRankItem.fromJson(v)); });
		}
		if (json['female'] != null) {
			female = new List<BookRankItem>();(json['female'] as List).forEach((v) { female.add(new BookRankItem.fromJson(v)); });
		}
		ok = json['ok'];
		if (json['male'] != null) {
			male = new List<BookRankItem>();(json['male'] as List).forEach((v) { male.add(new BookRankItem.fromJson(v)); });
		}
		if (json['picture'] != null) {
			picture = new List<BookRankItem>();(json['picture'] as List).forEach((v) { picture.add(new BookRankItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.epub != null) {
      data['epub'] =  this.epub.map((v) => v.toJson()).toList();
    }
		if (this.female != null) {
      data['female'] =  this.female.map((v) => v.toJson()).toList();
    }
		data['ok'] = this.ok;
		if (this.male != null) {
      data['male'] =  this.male.map((v) => v.toJson()).toList();
    }
		if (this.picture != null) {
      data['picture'] =  this.picture.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

//class BookRankEpub {
//	String cover;
//	String sId;
//	String shortTitle;
//	String title;
//	bool collapse;
//
//	BookRankEpub({this.cover, this.sId, this.shortTitle, this.title, this.collapse});
//
//	BookRankEpub.fromJson(Map<String, dynamic> json) {
//		cover = json['cover'];
//		sId = json['_id'];
//		shortTitle = json['shortTitle'];
//		title = json['title'];
//		collapse = json['collapse'];
//	}
//
//	Map<String, dynamic> toJson() {
//		final Map<String, dynamic> data = new Map<String, dynamic>();
//		data['cover'] = this.cover;
//		data['_id'] = this.sId;
//		data['shortTitle'] = this.shortTitle;
//		data['title'] = this.title;
//		data['collapse'] = this.collapse;
//		return data;
//	}
//}

class BookRankItem {
	String cover;
	String totalRank;
	String monthRank;
	String sId;
	String shortTitle;
	String title;
	bool collapse;

	BookRankItem({this.cover, this.totalRank, this.monthRank, this.sId, this.shortTitle, this.title, this.collapse});

	BookRankItem.fromJson(Map<String, dynamic> json) {
		cover = json['cover'];
		totalRank = json['totalRank'];
		monthRank = json['monthRank'];
		sId = json['_id'];
		shortTitle = json['shortTitle'];
		title = json['title'];
		collapse = json['collapse'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cover'] = this.cover;
		data['totalRank'] = this.totalRank;
		data['monthRank'] = this.monthRank;
		data['_id'] = this.sId;
		data['shortTitle'] = this.shortTitle;
		data['title'] = this.title;
		data['collapse'] = this.collapse;
		return data;
	}
}

//class BookRankMale {
//	String cover;
//	String totalRank;
//	String monthRank;
//	String sId;
//	String shortTitle;
//	String title;
//	bool collapse;
//
//	BookRankMale({this.cover, this.totalRank, this.monthRank, this.sId, this.shortTitle, this.title, this.collapse});
//
//	BookRankMale.fromJson(Map<String, dynamic> json) {
//		cover = json['cover'];
//		totalRank = json['totalRank'];
//		monthRank = json['monthRank'];
//		sId = json['_id'];
//		shortTitle = json['shortTitle'];
//		title = json['title'];
//		collapse = json['collapse'];
//	}
//
//	Map<String, dynamic> toJson() {
//		final Map<String, dynamic> data = new Map<String, dynamic>();
//		data['cover'] = this.cover;
//		data['totalRank'] = this.totalRank;
//		data['monthRank'] = this.monthRank;
//		data['_id'] = this.sId;
//		data['shortTitle'] = this.shortTitle;
//		data['title'] = this.title;
//		data['collapse'] = this.collapse;
//		return data;
//	}
//}
//
//class BookRankPicture {
//	String cover;
//	String sId;
//	String shortTitle;
//	String title;
//	bool collapse;
//
//	BookRankPicture({this.cover, this.sId, this.shortTitle, this.title, this.collapse});
//
//	BookRankPicture.fromJson(Map<String, dynamic> json) {
//		cover = json['cover'];
//		sId = json['_id'];
//		shortTitle = json['shortTitle'];
//		title = json['title'];
//		collapse = json['collapse'];
//	}
//
//	Map<String, dynamic> toJson() {
//		final Map<String, dynamic> data = new Map<String, dynamic>();
//		data['cover'] = this.cover;
//		data['_id'] = this.sId;
//		data['shortTitle'] = this.shortTitle;
//		data['title'] = this.title;
//		data['collapse'] = this.collapse;
//		return data;
//	}
//}
