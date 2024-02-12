class Weather {
  String by;
  bool validKey;
  Result results;
  double executionTime;
  bool fromCache;

  Weather(
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  );
}

class Result {
  int temp;
  String date;
  String time;
  String conditionCode;
  String description;
  String currently;
  String cid;
  String city;
  String imgId;
  double humidity;
  double rain;
  double cloudiness;
  String windSpeedy;
  String sunrise;
  String sunset;
  String conditionSlug;
  String cityName;
  String timezone;
  List<Forecast> forecast = [];

  Result(
      this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.rain,
      this.cloudiness,
      this.windSpeedy,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName,
      this.timezone,
      this.forecast);
}

class Forecast {
  String date;
  String weekday;
  int max;
  int min;
  int rainProbability;
  String windSpeedy;
  String description;
  String condition;
  double rain;
  double cloudiness;

  Forecast(
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.rainProbability,
    this.windSpeedy,
    this.description,
    this.condition,
    this.rain,
    this.cloudiness,
  );
}
