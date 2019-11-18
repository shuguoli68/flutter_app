/**
 * 按分类获取书籍列表
 * http://api.zhuishushenqi.com/book/by-categories?gender=male&type=hot&major=玄幻&minor=东方玄幻&start=0&limit=10
 */
class BookCategoryEntity {
	int total;
	List<BookCategoryBook> books;
	bool ok;

	BookCategoryEntity({this.total, this.books, this.ok});

	BookCategoryEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		if (json['books'] != null) {
			books = new List<BookCategoryBook>();(json['books'] as List).forEach((v) { books.add(new BookCategoryBook.fromJson(v)); });
		}
		ok = json['ok'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		if (this.books != null) {
      data['books'] =  this.books.map((v) => v.toJson()).toList();
    }
		data['ok'] = this.ok;
		return data;
	}
}

class BookCategoryBook {
	String author;
	String superscript;
	bool allowMonthly;
	int latelyFollower;
	String title;
	String lastChapter;
	String shortIntro;
	List<String> tags;
	String cover;
	int sizetype;
	String site;
	String majorCate;
	String minorCate;
	double retentionRatio;
	String sId;
	int banned;
	String contentType;

	BookCategoryBook({this.author, this.superscript, this.allowMonthly, this.latelyFollower, this.title, this.lastChapter, this.shortIntro, this.tags, this.cover, this.sizetype, this.site, this.majorCate, this.minorCate, this.retentionRatio, this.sId, this.banned, this.contentType});

	BookCategoryBook.fromJson(Map<String, dynamic> json) {
		author = json['author'];
		superscript = json['superscript'];
		allowMonthly = json['allowMonthly'];
		latelyFollower = json['latelyFollower'];
		title = json['title'];
		lastChapter = json['lastChapter'];
		shortIntro = json['shortIntro'];
		tags = json['tags']?.cast<String>();
		cover = json['cover'];
		sizetype = json['sizetype'];
		site = json['site'];
		majorCate = json['majorCate'];
		minorCate = json['minorCate'];
		retentionRatio = json['retentionRatio'];
		sId = json['_id'];
		banned = json['banned'];
		contentType = json['contentType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['author'] = this.author;
		data['superscript'] = this.superscript;
		data['allowMonthly'] = this.allowMonthly;
		data['latelyFollower'] = this.latelyFollower;
		data['title'] = this.title;
		data['lastChapter'] = this.lastChapter;
		data['shortIntro'] = this.shortIntro;
		data['tags'] = this.tags;
		data['cover'] = this.cover;
		data['sizetype'] = this.sizetype;
		data['site'] = this.site;
		data['majorCate'] = this.majorCate;
		data['minorCate'] = this.minorCate;
		data['retentionRatio'] = this.retentionRatio;
		data['_id'] = this.sId;
		data['banned'] = this.banned;
		data['contentType'] = this.contentType;
		return data;
	}
}
