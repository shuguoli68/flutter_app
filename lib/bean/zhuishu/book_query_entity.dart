class BookQueryEntity {
	int total;
	List<BookQueryBook> books;
	bool ok;

	BookQueryEntity({this.total, this.books, this.ok});

	BookQueryEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		if (json['books'] != null) {
			books = new List<BookQueryBook>();(json['books'] as List).forEach((v) { books.add(new BookQueryBook.fromJson(v)); });
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

class BookQueryBook {
	bool hasCp;
	String aliases;
	int wordCount;
	String author;
	String superscript;
	bool allowMonthly;
	int latelyFollower;
	String title;
	String lastChapter;
	String shortIntro;
	String cover;
	int sizetype;
	BookQueryBooksHighlight highlight;
	String site;
	String cat;
	double retentionRatio;
	String sId;
	int banned;
	String contentType;

	BookQueryBook({this.hasCp, this.aliases, this.wordCount, this.author, this.superscript, this.allowMonthly, this.latelyFollower, this.title, this.lastChapter, this.shortIntro, this.cover, this.sizetype, this.highlight, this.site, this.cat, this.retentionRatio, this.sId, this.banned, this.contentType});

	BookQueryBook.fromJson(Map<String, dynamic> json) {
		hasCp = json['hasCp'];
		aliases = json['aliases'];
		wordCount = json['wordCount'];
		author = json['author'];
		superscript = json['superscript'];
		allowMonthly = json['allowMonthly'];
		latelyFollower = json['latelyFollower'];
		title = json['title'];
		lastChapter = json['lastChapter'];
		shortIntro = json['shortIntro'];
		cover = json['cover'];
		sizetype = json['sizetype'];
		highlight = json['highlight'] != null ? new BookQueryBooksHighlight.fromJson(json['highlight']) : null;
		site = json['site'];
		cat = json['cat'];
		retentionRatio = json['retentionRatio'];
		sId = json['_id'];
		banned = json['banned'];
		contentType = json['contentType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hasCp'] = this.hasCp;
		data['aliases'] = this.aliases;
		data['wordCount'] = this.wordCount;
		data['author'] = this.author;
		data['superscript'] = this.superscript;
		data['allowMonthly'] = this.allowMonthly;
		data['latelyFollower'] = this.latelyFollower;
		data['title'] = this.title;
		data['lastChapter'] = this.lastChapter;
		data['shortIntro'] = this.shortIntro;
		data['cover'] = this.cover;
		data['sizetype'] = this.sizetype;
		if (this.highlight != null) {
      data['highlight'] = this.highlight.toJson();
    }
		data['site'] = this.site;
		data['cat'] = this.cat;
		data['retentionRatio'] = this.retentionRatio;
		data['_id'] = this.sId;
		data['banned'] = this.banned;
		data['contentType'] = this.contentType;
		return data;
	}
}

class BookQueryBooksHighlight {
	List<String> title;

	BookQueryBooksHighlight({this.title});

	BookQueryBooksHighlight.fromJson(Map<String, dynamic> json) {
		title = json['title']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		return data;
	}
}
