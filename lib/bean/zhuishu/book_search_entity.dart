class BookSearchEntity {
	List<String> keywords;
	bool ok;

	BookSearchEntity({this.keywords, this.ok});

	BookSearchEntity.fromJson(Map<String, dynamic> json) {
		keywords = json['keywords']?.cast<String>();
		ok = json['ok'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['keywords'] = this.keywords;
		data['ok'] = this.ok;
		return data;
	}
}
