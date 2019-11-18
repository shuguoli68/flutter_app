/**
 * 带子分类的分类
 * http://api.zhuishushenqi.com/cats/lv2/statistics
 */
class BookSortEntity {
	List<BookSortFemale> female;
	List<BookSortPres> press;
	bool ok;
	List<BookSortMale> male;
	List<BookSortPicture> picture;

	BookSortEntity({this.female, this.press, this.ok, this.male, this.picture});

	BookSortEntity.fromJson(Map<String, dynamic> json) {
		if (json['female'] != null) {
			female = new List<BookSortFemale>();(json['female'] as List).forEach((v) { female.add(new BookSortFemale.fromJson(v)); });
		}
		if (json['press'] != null) {
			press = new List<BookSortPres>();(json['press'] as List).forEach((v) { press.add(new BookSortPres.fromJson(v)); });
		}
		ok = json['ok'];
		if (json['male'] != null) {
			male = new List<BookSortMale>();(json['male'] as List).forEach((v) { male.add(new BookSortMale.fromJson(v)); });
		}
		if (json['picture'] != null) {
			picture = new List<BookSortPicture>();(json['picture'] as List).forEach((v) { picture.add(new BookSortPicture.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.female != null) {
      data['female'] =  this.female.map((v) => v.toJson()).toList();
    }
		if (this.press != null) {
      data['press'] =  this.press.map((v) => v.toJson()).toList();
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

class BookSortFemale {
	int bookCount;
	int monthlyCount;
	String name;
	String icon;
	List<String> bookCover;

	BookSortFemale({this.bookCount, this.monthlyCount, this.name, this.icon, this.bookCover});

	BookSortFemale.fromJson(Map<String, dynamic> json) {
		bookCount = json['bookCount'];
		monthlyCount = json['monthlyCount'];
		name = json['name'];
		icon = json['icon'];
		bookCover = json['bookCover']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bookCount'] = this.bookCount;
		data['monthlyCount'] = this.monthlyCount;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['bookCover'] = this.bookCover;
		return data;
	}
}

class BookSortPres {
	int bookCount;
	int monthlyCount;
	String name;
	String icon;
	List<String> bookCover;

	BookSortPres({this.bookCount, this.monthlyCount, this.name, this.icon, this.bookCover});

	BookSortPres.fromJson(Map<String, dynamic> json) {
		bookCount = json['bookCount'];
		monthlyCount = json['monthlyCount'];
		name = json['name'];
		icon = json['icon'];
		bookCover = json['bookCover']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bookCount'] = this.bookCount;
		data['monthlyCount'] = this.monthlyCount;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['bookCover'] = this.bookCover;
		return data;
	}
}

class BookSortMale {
	int bookCount;
	int monthlyCount;
	String name;
	String icon;
	List<String> bookCover;

	BookSortMale({this.bookCount, this.monthlyCount, this.name, this.icon, this.bookCover});

	BookSortMale.fromJson(Map<String, dynamic> json) {
		bookCount = json['bookCount'];
		monthlyCount = json['monthlyCount'];
		name = json['name'];
		icon = json['icon'];
		bookCover = json['bookCover']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bookCount'] = this.bookCount;
		data['monthlyCount'] = this.monthlyCount;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['bookCover'] = this.bookCover;
		return data;
	}
}

class BookSortPicture {
	int bookCount;
	int monthlyCount;
	String name;
	String icon;
	List<String> bookCover;

	BookSortPicture({this.bookCount, this.monthlyCount, this.name, this.icon, this.bookCover});

	BookSortPicture.fromJson(Map<String, dynamic> json) {
		bookCount = json['bookCount'];
		monthlyCount = json['monthlyCount'];
		name = json['name'];
		icon = json['icon'];
		bookCover = json['bookCover']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bookCount'] = this.bookCount;
		data['monthlyCount'] = this.monthlyCount;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['bookCover'] = this.bookCover;
		return data;
	}
}
