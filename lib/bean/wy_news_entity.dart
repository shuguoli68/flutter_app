class WyNewsEntity {
	List<WyNewsResult> result;
	int code;
	String message;

	WyNewsEntity({this.result, this.code, this.message});

	WyNewsEntity.fromJson(Map<String, dynamic> json) {
		if (json['result'] != null) {
			result = new List<WyNewsResult>();(json['result'] as List).forEach((v) { result.add(new WyNewsResult.fromJson(v)); });
		}
		code = json['code'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] =  this.result.map((v) => v.toJson()).toList();
    }
		data['code'] = this.code;
		data['message'] = this.message;
		return data;
	}
}

class WyNewsResult {
	String path;
	String image;
	String passtime;
	String title;

	WyNewsResult({this.path, this.image, this.passtime, this.title});

	WyNewsResult.fromJson(Map<String, dynamic> json) {
		path = json['path'];
		image = json['image'];
		passtime = json['passtime'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['path'] = this.path;
		data['image'] = this.image;
		data['passtime'] = this.passtime;
		data['title'] = this.title;
		return data;
	}
}
