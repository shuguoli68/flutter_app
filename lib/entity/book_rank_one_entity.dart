/**
 * 单个排行榜的所有书籍
 * http://api.zhuishushenqi.com/ranking/54d43437d47d13ff21cad58b
 */
class BookRankOneEntity {
	BookRankOneRanking ranking;
	bool ok;

	BookRankOneEntity({this.ranking, this.ok});

	BookRankOneEntity.fromJson(Map<String, dynamic> json) {
		ranking = json['ranking'] != null ? new BookRankOneRanking.fromJson(json['ranking']) : null;
		ok = json['ok'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.ranking != null) {
      data['ranking'] = this.ranking.toJson();
    }
		data['ok'] = this.ok;
		return data;
	}
}

class BookRankOneRanking {
	bool xNew;
	String gender;
	String biTag;
	String totalRank;
	String created;
	String icon;
	String monthRank;
	String shortTitle;
	bool isSub;
	String title;
	int priority;
	String cover;
	int total;
	List<BookRankOneRankingBook> books;
	int iV;
	String sId;
	String tag;
	String id;
	String updated;
	bool collapse;

	BookRankOneRanking({this.xNew, this.gender, this.biTag, this.totalRank, this.created, this.icon, this.monthRank, this.shortTitle, this.isSub, this.title, this.priority, this.cover, this.total, this.books, this.iV, this.sId, this.tag, this.id, this.updated, this.collapse});

	BookRankOneRanking.fromJson(Map<String, dynamic> json) {
		xNew = json['new'];
		gender = json['gender'];
		biTag = json['biTag'];
		totalRank = json['totalRank'];
		created = json['created'];
		icon = json['icon'];
		monthRank = json['monthRank'];
		shortTitle = json['shortTitle'];
		isSub = json['isSub'];
		title = json['title'];
		priority = json['priority'];
		cover = json['cover'];
		total = json['total'];
		if (json['books'] != null) {
			books = new List<BookRankOneRankingBook>();(json['books'] as List).forEach((v) { books.add(new BookRankOneRankingBook.fromJson(v)); });
		}
		iV = json['__v'];
		sId = json['_id'];
		tag = json['tag'];
		id = json['id'];
		updated = json['updated'];
		collapse = json['collapse'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['new'] = this.xNew;
		data['gender'] = this.gender;
		data['biTag'] = this.biTag;
		data['totalRank'] = this.totalRank;
		data['created'] = this.created;
		data['icon'] = this.icon;
		data['monthRank'] = this.monthRank;
		data['shortTitle'] = this.shortTitle;
		data['isSub'] = this.isSub;
		data['title'] = this.title;
		data['priority'] = this.priority;
		data['cover'] = this.cover;
		data['total'] = this.total;
		if (this.books != null) {
      data['books'] =  this.books.map((v) => v.toJson()).toList();
    }
		data['__v'] = this.iV;
		data['_id'] = this.sId;
		data['tag'] = this.tag;
		data['id'] = this.id;
		data['updated'] = this.updated;
		data['collapse'] = this.collapse;
		return data;
	}
}

class BookRankOneRankingBook {
	String cover;
	String site;
	String majorCate;
	String author;
	String minorCate;
	bool allowMonthly;
	String retentionRatio;
	int latelyFollower;
	String sId;
	int banned;
	String title;
	String shortIntro;

	BookRankOneRankingBook({this.cover, this.site, this.majorCate, this.author, this.minorCate, this.allowMonthly, this.retentionRatio, this.latelyFollower, this.sId, this.banned, this.title, this.shortIntro});

	BookRankOneRankingBook.fromJson(Map<String, dynamic> json) {
		cover = json['cover'];
		site = json['site'];
		majorCate = json['majorCate'];
		author = json['author'];
		minorCate = json['minorCate'];
		allowMonthly = json['allowMonthly'];
		retentionRatio = json['retentionRatio'];
		latelyFollower = json['latelyFollower'];
		sId = json['_id'];
		banned = json['banned'];
		title = json['title'];
		shortIntro = json['shortIntro'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cover'] = this.cover;
		data['site'] = this.site;
		data['majorCate'] = this.majorCate;
		data['author'] = this.author;
		data['minorCate'] = this.minorCate;
		data['allowMonthly'] = this.allowMonthly;
		data['retentionRatio'] = this.retentionRatio;
		data['latelyFollower'] = this.latelyFollower;
		data['_id'] = this.sId;
		data['banned'] = this.banned;
		data['title'] = this.title;
		data['shortIntro'] = this.shortIntro;
		return data;
	}
}
