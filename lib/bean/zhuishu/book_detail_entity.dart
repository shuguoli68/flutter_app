/**
 * 书籍详情
 * http://api.zhuishushenqi.com/book/542a5838a5ae10f815039a7f
 */
class BookDetailEntity {
	bool isForbidForFreeApp;
	String copyright;
	String superscript;
	BookDetailRating rating;
	bool allowMonthly;
	int contentLevel;
	dynamic discount;
	String lastChapter;
	bool isSerial;
	String cover;
	String copyrightDesc;
	int totalFollower;
	String minorCate;
	bool limit;
	int postCount;
	bool bLe;
	int starRatingCount;
	bool donate;
	String contentType;
	bool allowBeanVoucher;
	int wordCount;
	String author;
	List<String> tags;
	int sizetype;
	String minorCateV2;
	int serializeWordCount;
	String majorCate;
	String creater;
	String longIntro;
	String sId;
	bool isAllowNetSearch;
	String updated;
	bool hasCp;
	List<String> gender;
	bool hasCopyright;
	String authorDesc;
	int chaptersCount;
	List<Null> anchors;
	bool advertRead;
	String originalAuthor;
	bool isFineBook;
	String title;
	String majorCateV2;
	int safelevel;
	List<BookDetailStarrating> starRatings;
	String cat;
	String retentionRatio;
	bool allowVoucher;
	int currency;
	int banned;
	bool isMakeMoneyLimit;
	int followerCount;
	int buytype;
	int latelyFollower;
	int latelyFollowerBase;
	bool allowFree;
	int minRetentionRatio;
	bool bGg;
	String copyrightInfo;

	BookDetailEntity({this.isForbidForFreeApp, this.copyright, this.superscript, this.rating, this.allowMonthly, this.contentLevel, this.discount, this.lastChapter, this.isSerial, this.cover, this.copyrightDesc, this.totalFollower, this.minorCate, this.limit, this.postCount, this.bLe, this.starRatingCount, this.donate, this.contentType, this.allowBeanVoucher, this.wordCount, this.author, this.tags, this.sizetype, this.minorCateV2, this.serializeWordCount, this.majorCate, this.creater, this.longIntro, this.sId, this.isAllowNetSearch, this.updated, this.hasCp, this.gender, this.hasCopyright, this.authorDesc, this.chaptersCount, this.anchors, this.advertRead, this.originalAuthor, this.isFineBook, this.title, this.majorCateV2, this.safelevel, this.starRatings, this.cat, this.retentionRatio, this.allowVoucher, this.currency, this.banned, this.isMakeMoneyLimit, this.followerCount, this.buytype, this.latelyFollower, this.latelyFollowerBase, this.allowFree, this.minRetentionRatio, this.bGg, this.copyrightInfo});

	BookDetailEntity.fromJson(Map<String, dynamic> json) {
		isForbidForFreeApp = json['isForbidForFreeApp'];
		copyright = json['copyright'];
		superscript = json['superscript'];
		rating = json['rating'] != null ? new BookDetailRating.fromJson(json['rating']) : null;
		allowMonthly = json['allowMonthly'];
		contentLevel = json['contentLevel'];
		discount = json['discount'];
		lastChapter = json['lastChapter'];
		isSerial = json['isSerial'];
		cover = json['cover'];
		copyrightDesc = json['copyrightDesc'];
		totalFollower = json['totalFollower'];
		minorCate = json['minorCate'];
		limit = json['limit'];
		postCount = json['postCount'];
		bLe = json['_le'];
		starRatingCount = json['starRatingCount'];
		donate = json['donate'];
		contentType = json['contentType'];
		allowBeanVoucher = json['allowBeanVoucher'];
		wordCount = json['wordCount'];
		author = json['author'];
		tags = json['tags']?.cast<String>();
		sizetype = json['sizetype'];
		minorCateV2 = json['minorCateV2'];
		serializeWordCount = json['serializeWordCount'];
		majorCate = json['majorCate'];
		creater = json['creater'];
		longIntro = json['longIntro'];
		sId = json['_id'];
		isAllowNetSearch = json['isAllowNetSearch'];
		updated = json['updated'];
		hasCp = json['hasCp'];
		gender = json['gender']?.cast<String>();
		hasCopyright = json['hasCopyright'];
		authorDesc = json['authorDesc'];
		chaptersCount = json['chaptersCount'];
		if (json['anchors'] != null) {
			anchors = new List<Null>();
		}
		advertRead = json['advertRead'];
		originalAuthor = json['originalAuthor'];
		isFineBook = json['isFineBook'];
		title = json['title'];
		majorCateV2 = json['majorCateV2'];
		safelevel = json['safelevel'];
		if (json['starRatings'] != null) {
			starRatings = new List<BookDetailStarrating>();(json['starRatings'] as List).forEach((v) { starRatings.add(new BookDetailStarrating.fromJson(v)); });
		}
		cat = json['cat'];
		retentionRatio = json['retentionRatio'];
		allowVoucher = json['allowVoucher'];
		currency = json['currency'];
		banned = json['banned'];
		isMakeMoneyLimit = json['isMakeMoneyLimit'];
		followerCount = json['followerCount'];
		buytype = json['buytype'];
		latelyFollower = json['latelyFollower'];
		latelyFollowerBase = json['latelyFollowerBase'];
		allowFree = json['allowFree'];
		minRetentionRatio = json['minRetentionRatio'];
		bGg = json['_gg'];
		copyrightInfo = json['copyrightInfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isForbidForFreeApp'] = this.isForbidForFreeApp;
		data['copyright'] = this.copyright;
		data['superscript'] = this.superscript;
		if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
		data['allowMonthly'] = this.allowMonthly;
		data['contentLevel'] = this.contentLevel;
		data['discount'] = this.discount;
		data['lastChapter'] = this.lastChapter;
		data['isSerial'] = this.isSerial;
		data['cover'] = this.cover;
		data['copyrightDesc'] = this.copyrightDesc;
		data['totalFollower'] = this.totalFollower;
		data['minorCate'] = this.minorCate;
		data['limit'] = this.limit;
		data['postCount'] = this.postCount;
		data['_le'] = this.bLe;
		data['starRatingCount'] = this.starRatingCount;
		data['donate'] = this.donate;
		data['contentType'] = this.contentType;
		data['allowBeanVoucher'] = this.allowBeanVoucher;
		data['wordCount'] = this.wordCount;
		data['author'] = this.author;
		data['tags'] = this.tags;
		data['sizetype'] = this.sizetype;
		data['minorCateV2'] = this.minorCateV2;
		data['serializeWordCount'] = this.serializeWordCount;
		data['majorCate'] = this.majorCate;
		data['creater'] = this.creater;
		data['longIntro'] = this.longIntro;
		data['_id'] = this.sId;
		data['isAllowNetSearch'] = this.isAllowNetSearch;
		data['updated'] = this.updated;
		data['hasCp'] = this.hasCp;
		data['gender'] = this.gender;
		data['hasCopyright'] = this.hasCopyright;
		data['authorDesc'] = this.authorDesc;
		data['chaptersCount'] = this.chaptersCount;
		if (this.anchors != null) {
      data['anchors'] =  [];
    }
		data['advertRead'] = this.advertRead;
		data['originalAuthor'] = this.originalAuthor;
		data['isFineBook'] = this.isFineBook;
		data['title'] = this.title;
		data['majorCateV2'] = this.majorCateV2;
		data['safelevel'] = this.safelevel;
		if (this.starRatings != null) {
      data['starRatings'] =  this.starRatings.map((v) => v.toJson()).toList();
    }
		data['cat'] = this.cat;
		data['retentionRatio'] = this.retentionRatio;
		data['allowVoucher'] = this.allowVoucher;
		data['currency'] = this.currency;
		data['banned'] = this.banned;
		data['isMakeMoneyLimit'] = this.isMakeMoneyLimit;
		data['followerCount'] = this.followerCount;
		data['buytype'] = this.buytype;
		data['latelyFollower'] = this.latelyFollower;
		data['latelyFollowerBase'] = this.latelyFollowerBase;
		data['allowFree'] = this.allowFree;
		data['minRetentionRatio'] = this.minRetentionRatio;
		data['_gg'] = this.bGg;
		data['copyrightInfo'] = this.copyrightInfo;
		return data;
	}
}

class BookDetailRating {
	double score;
	int count;
	bool isEffect;
	String tip;

	BookDetailRating({this.score, this.count, this.isEffect, this.tip});

	BookDetailRating.fromJson(Map<String, dynamic> json) {
		score = json['score'];
		count = json['count'];
		isEffect = json['isEffect'];
		tip = json['tip'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['score'] = this.score;
		data['count'] = this.count;
		data['isEffect'] = this.isEffect;
		data['tip'] = this.tip;
		return data;
	}
}

class BookDetailStarrating {
	int star;
	int count;

	BookDetailStarrating({this.star, this.count});

	BookDetailStarrating.fromJson(Map<String, dynamic> json) {
		star = json['star'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['star'] = this.star;
		data['count'] = this.count;
		return data;
	}
}
