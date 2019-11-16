class WeatherEntity {
	String msg;
	int code;
	WeatherData data;

	WeatherEntity({this.msg, this.code, this.data});

	WeatherEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new WeatherData.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}
}

class WeatherData {
	WeatherDataYesterday yesterday;
	String city;
	String aqi;
	List<WeatherDataForecast> forecast;
	String ganmao;
	String wendu;

	WeatherData({this.yesterday, this.city, this.aqi, this.forecast, this.ganmao, this.wendu});

	WeatherData.fromJson(Map<String, dynamic> json) {
		yesterday = json['yesterday'] != null ? new WeatherDataYesterday.fromJson(json['yesterday']) : null;
		city = json['city'];
		aqi = json['aqi'];
		if (json['forecast'] != null) {
			forecast = new List<WeatherDataForecast>();(json['forecast'] as List).forEach((v) { forecast.add(new WeatherDataForecast.fromJson(v)); });
		}
		ganmao = json['ganmao'];
		wendu = json['wendu'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.yesterday != null) {
      data['yesterday'] = this.yesterday.toJson();
    }
		data['city'] = this.city;
		data['aqi'] = this.aqi;
		if (this.forecast != null) {
      data['forecast'] =  this.forecast.map((v) => v.toJson()).toList();
    }
		data['ganmao'] = this.ganmao;
		data['wendu'] = this.wendu;
		return data;
	}
}

class WeatherDataYesterday {
	String date;
	String high;
	String fx;
	String low;
	String fl;
	String type;

	WeatherDataYesterday({this.date, this.high, this.fx, this.low, this.fl, this.type});

	WeatherDataYesterday.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		high = json['high'];
		fx = json['fx'];
		low = json['low'];
		fl = json['fl'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['high'] = this.high;
		data['fx'] = this.fx;
		data['low'] = this.low;
		data['fl'] = this.fl;
		data['type'] = this.type;
		return data;
	}
}

class WeatherDataForecast {
	String date;
	String high;
	String fengli;
	String low;
	String fengxiang;
	String type;

	WeatherDataForecast({this.date, this.high, this.fengli, this.low, this.fengxiang, this.type});

	WeatherDataForecast.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		high = json['high'];
		fengli = json['fengli'];
		low = json['low'];
		fengxiang = json['fengxiang'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['high'] = this.high;
		data['fengli'] = this.fengli;
		data['low'] = this.low;
		data['fengxiang'] = this.fengxiang;
		data['type'] = this.type;
		return data;
	}

	@override
	String toString() {
		return 'WeatherDataForecast{date: $date, high: $high, fengli: $fengli, low: $low, fengxiang: $fengxiang, type: $type}';
	}

}
