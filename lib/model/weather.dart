class Weather {
  String? by;
  bool? validKey;
  Results? results;
  double? executionTime;
  bool? fromCache;

  Weather(
      {this.by,
      this.validKey,
      this.results,
      this.executionTime,
      this.fromCache});

  Weather.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = by;
    data['valid_key'] = validKey;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    data['execution_time'] = executionTime;
    data['from_cache'] = fromCache;
    return data;
  }
}

class Results {
  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  String? windSpeedy;
  String? sunrise;
  String? sunset;
  String? conditionSlug;
  String? cityName;
  List<Forecast>? forecast;
  double? latitude;
  double? longitude;

  Results(
      {this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.windSpeedy,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName,
      this.forecast,
      this.latitude,
      this.longitude});

  Results.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    date = json['date'];
    time = json['time'];
    conditionCode = json['condition_code'];
    description = json['description'];
    currently = json['currently'];
    cid = json['cid'];
    city = json['city'];
    imgId = json['img_id'];
    humidity = json['humidity'];
    windSpeedy = json['wind_speedy'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    conditionSlug = json['condition_slug'];
    cityName = json['city_name'];
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(Forecast.fromJson(v));
      });
    }
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['temp'] = temp;
    data['date'] = date;
    data['time'] = time;
    data['condition_code'] = conditionCode;
    data['description'] = description;
    data['currently'] = currently;
    data['cid'] = cid;
    data['city'] = city;
    data['img_id'] = imgId;
    data['humidity'] = humidity;
    data['wind_speedy'] = windSpeedy;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['condition_slug'] = conditionSlug;
    data['city_name'] = cityName;
    if (forecast != null) {
      data['forecast'] = forecast!.map((v) => v.toJson()).toList();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Forecast {
  String? date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String? condition;

  Forecast(
      {this.date,
      this.weekday,
      this.max,
      this.min,
      this.description,
      this.condition});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weekday = json['weekday'];
    max = json['max'];
    min = json['min'];
    description = json['description'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['weekday'] = weekday;
    data['max'] = max;
    data['min'] = min;
    data['description'] = description;
    data['condition'] = condition;
    return data;
  }
}
