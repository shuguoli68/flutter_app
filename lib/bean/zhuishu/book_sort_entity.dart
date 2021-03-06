class BookSortEntity {
	List<BookSortItem> female;
	List<BookSortItem> press;
	bool ok;
	List<BookSortItem> male;
	List<BookSortItem> picture;

	BookSortEntity({this.female, this.press, this.ok, this.male, this.picture});

	BookSortEntity.fromJson(Map<String, dynamic> json) {
		if (json['female'] != null) {
			female = new List<BookSortItem>();(json['female'] as List).forEach((v) { female.add(new BookSortItem.fromJson(v)); });
		}
		if (json['press'] != null) {
			press = new List<BookSortItem>();(json['press'] as List).forEach((v) { press.add(new BookSortItem.fromJson(v)); });
		}
		ok = json['ok'];
		if (json['male'] != null) {
			male = new List<BookSortItem>();(json['male'] as List).forEach((v) { male.add(new BookSortItem.fromJson(v)); });
		}
		if (json['picture'] != null) {
			picture = new List<BookSortItem>();(json['picture'] as List).forEach((v) { picture.add(new BookSortItem.fromJson(v)); });
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

class BookSortItem {
	List<String> mins;
	String major;

	BookSortItem({this.mins, this.major});

	BookSortItem.fromJson(Map<String, dynamic> json) {
		mins = json['mins']?.cast<String>();
		major = json['major'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mins'] = this.mins;
		data['major'] = this.major;
		return data;
	}
}
