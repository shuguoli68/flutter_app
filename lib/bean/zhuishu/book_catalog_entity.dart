/**
 * 书本目录
 * http://api.zhuishushenqi.com/mix-atoc/542a5838a5ae10f815039a7f
 */
class BookCatalogEntity {
	BookCatalogMixtoc mixToc;
	bool ok;

	BookCatalogEntity({this.mixToc, this.ok});

	BookCatalogEntity.fromJson(Map<String, dynamic> json) {
		mixToc = json['mixToc'] != null ? new BookCatalogMixtoc.fromJson(json['mixToc']) : null;
		ok = json['ok'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.mixToc != null) {
      data['mixToc'] = this.mixToc.toJson();
    }
		data['ok'] = this.ok;
		return data;
	}
}

class BookCatalogMixtoc {
	List<BookCatalogMixtocChapter> chapters;
	int chaptersCount1;
	String book;
	String chaptersUpdated;
	String sId;
	String updated;

	BookCatalogMixtoc({this.chapters, this.chaptersCount1, this.book, this.chaptersUpdated, this.sId, this.updated});

	BookCatalogMixtoc.fromJson(Map<String, dynamic> json) {
		if (json['chapters'] != null) {
			chapters = new List<BookCatalogMixtocChapter>();(json['chapters'] as List).forEach((v) { chapters.add(new BookCatalogMixtocChapter.fromJson(v)); });
		}
		chaptersCount1 = json['chaptersCount1'];
		book = json['book'];
		chaptersUpdated = json['chaptersUpdated'];
		sId = json['_id'];
		updated = json['updated'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.chapters != null) {
      data['chapters'] =  this.chapters.map((v) => v.toJson()).toList();
    }
		data['chaptersCount1'] = this.chaptersCount1;
		data['book'] = this.book;
		data['chaptersUpdated'] = this.chaptersUpdated;
		data['_id'] = this.sId;
		data['updated'] = this.updated;
		return data;
	}
}

class BookCatalogMixtocChapter {
	bool unreadble;
	String link;
	String title;

	BookCatalogMixtocChapter({this.unreadble, this.link, this.title});

	BookCatalogMixtocChapter.fromJson(Map<String, dynamic> json) {
		unreadble = json['unreadble'];
		link = json['link'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['unreadble'] = this.unreadble;
		data['link'] = this.link;
		data['title'] = this.title;
		return data;
	}
}
