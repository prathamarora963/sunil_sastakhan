class WeatherModel {
  List<ForecastHours>? forecastHours;
  TimeZone? timeZone;
  dynamic nextPageToken;

  WeatherModel({this.forecastHours, this.timeZone, this.nextPageToken});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['forecastHours'] != null) {
      forecastHours = <ForecastHours>[];
      json['forecastHours'].forEach((v) {
        forecastHours!.add(new ForecastHours.fromJson(v));
      });
    }
    timeZone = json['timeZone'] != null
        ? new TimeZone.fromJson(json['timeZone'])
        : null;
    nextPageToken = json['nextPageToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastHours != null) {
      data['forecastHours'] =
          this.forecastHours!.map((v) => v.toJson()).toList();
    }
    if (this.timeZone != null) {
      data['timeZone'] = this.timeZone!.toJson();
    }
    data['nextPageToken'] = this.nextPageToken;
    return data;
  }
}

class ForecastHours {
  Interval? interval;
  DisplayDateTime? displayDateTime;
  WeatherCondition? weatherCondition;
  Temperature? temperature;
  Temperature? feelsLikeTemperature;
  Temperature? dewPoint;
  Temperature? heatIndex;
  Temperature? windChill;
  Temperature? wetBulbTemperature;
  Precipitation? precipitation;
  AirPressure? airPressure;
  Wind? wind;
  Visibility? visibility;
  IceThickness? iceThickness;
  bool? isDaytime;
  dynamic relativeHumidity;
  dynamic uvIndex;
  dynamic thunderstormProbability;
  dynamic cloudCover;

  ForecastHours(
      {this.interval,
        this.displayDateTime,
        this.weatherCondition,
        this.temperature,
        this.feelsLikeTemperature,
        this.dewPoint,
        this.heatIndex,
        this.windChill,
        this.wetBulbTemperature,
        this.precipitation,
        this.airPressure,
        this.wind,
        this.visibility,
        this.iceThickness,
        this.isDaytime,
        this.relativeHumidity,
        this.uvIndex,
        this.thunderstormProbability,
        this.cloudCover});

  ForecastHours.fromJson(Map<String, dynamic> json) {
    interval = json['interval'] != null
        ? new Interval.fromJson(json['interval'])
        : null;
    displayDateTime = json['displayDateTime'] != null
        ? new DisplayDateTime.fromJson(json['displayDateTime'])
        : null;
    weatherCondition = json['weatherCondition'] != null
        ? new WeatherCondition.fromJson(json['weatherCondition'])
        : null;
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
    feelsLikeTemperature = json['feelsLikeTemperature'] != null
        ? new Temperature.fromJson(json['feelsLikeTemperature'])
        : null;
    dewPoint = json['dewPoint'] != null
        ? new Temperature.fromJson(json['dewPoint'])
        : null;
    heatIndex = json['heatIndex'] != null
        ? new Temperature.fromJson(json['heatIndex'])
        : null;
    windChill = json['windChill'] != null
        ? new Temperature.fromJson(json['windChill'])
        : null;
    wetBulbTemperature = json['wetBulbTemperature'] != null
        ? new Temperature.fromJson(json['wetBulbTemperature'])
        : null;
    precipitation = json['precipitation'] != null
        ? new Precipitation.fromJson(json['precipitation'])
        : null;
    airPressure = json['airPressure'] != null
        ? new AirPressure.fromJson(json['airPressure'])
        : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'] != null
        ? new Visibility.fromJson(json['visibility'])
        : null;
    iceThickness = json['iceThickness'] != null
        ? new IceThickness.fromJson(json['iceThickness'])
        : null;
    isDaytime = json['isDaytime'];
    relativeHumidity = json['relativeHumidity'];
    uvIndex = json['uvIndex'];
    thunderstormProbability = json['thunderstormProbability'];
    cloudCover = json['cloudCover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interval != null) {
      data['interval'] = this.interval!.toJson();
    }
    if (this.displayDateTime != null) {
      data['displayDateTime'] = this.displayDateTime!.toJson();
    }
    if (this.weatherCondition != null) {
      data['weatherCondition'] = this.weatherCondition!.toJson();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.toJson();
    }
    if (this.feelsLikeTemperature != null) {
      data['feelsLikeTemperature'] = this.feelsLikeTemperature!.toJson();
    }
    if (this.dewPoint != null) {
      data['dewPoint'] = this.dewPoint!.toJson();
    }
    if (this.heatIndex != null) {
      data['heatIndex'] = this.heatIndex!.toJson();
    }
    if (this.windChill != null) {
      data['windChill'] = this.windChill!.toJson();
    }
    if (this.wetBulbTemperature != null) {
      data['wetBulbTemperature'] = this.wetBulbTemperature!.toJson();
    }
    if (this.precipitation != null) {
      data['precipitation'] = this.precipitation!.toJson();
    }
    if (this.airPressure != null) {
      data['airPressure'] = this.airPressure!.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.visibility != null) {
      data['visibility'] = this.visibility!.toJson();
    }
    if (this.iceThickness != null) {
      data['iceThickness'] = this.iceThickness!.toJson();
    }
    data['isDaytime'] = this.isDaytime;
    data['relativeHumidity'] = this.relativeHumidity;
    data['uvIndex'] = this.uvIndex;
    data['thunderstormProbability'] = this.thunderstormProbability;
    data['cloudCover'] = this.cloudCover;
    return data;
  }
}

class Interval {
  dynamic startTime;
  dynamic endTime;

  Interval({this.startTime, this.endTime});

  Interval.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}

class DisplayDateTime {
  dynamic year;
  dynamic month;
  dynamic day;
  dynamic hours;
  dynamic minutes;
  dynamic seconds;
  dynamic nanos;
  dynamic utcOffset;

  DisplayDateTime(
      {this.year,
        this.month,
        this.day,
        this.hours,
        this.minutes,
        this.seconds,
        this.nanos,
        this.utcOffset});

  DisplayDateTime.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    nanos = json['nanos'];
    utcOffset = json['utcOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['nanos'] = this.nanos;
    data['utcOffset'] = this.utcOffset;
    return data;
  }
}

class WeatherCondition {
  dynamic iconBaseUri;
  Description? description;
  dynamic type;

  WeatherCondition({this.iconBaseUri, this.description, this.type});

  WeatherCondition.fromJson(Map<String, dynamic> json) {
    iconBaseUri = json['iconBaseUri'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconBaseUri'] = this.iconBaseUri;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Description {
  dynamic text;
  dynamic languageCode;

  Description({this.text, this.languageCode});

  Description.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageCode = json['languageCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['languageCode'] = this.languageCode;
    return data;
  }
}

class Temperature {
  dynamic unit;
  dynamic degrees;

  Temperature({this.unit, this.degrees});

  Temperature.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    degrees = json['degrees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['degrees'] = this.degrees;
    return data;
  }
}

class Precipitation {
  Probability? probability;
  SnowQpf? snowQpf;
  SnowQpf? qpf;

  Precipitation({this.probability, this.snowQpf, this.qpf});

  Precipitation.fromJson(Map<String, dynamic> json) {
    probability = json['probability'] != null
        ? new Probability.fromJson(json['probability'])
        : null;
    snowQpf =
    json['snowQpf'] != null ? new SnowQpf.fromJson(json['snowQpf']) : null;
    qpf = json['qpf'] != null ? new SnowQpf.fromJson(json['qpf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.probability != null) {
      data['probability'] = this.probability!.toJson();
    }
    if (this.snowQpf != null) {
      data['snowQpf'] = this.snowQpf!.toJson();
    }
    if (this.qpf != null) {
      data['qpf'] = this.qpf!.toJson();
    }
    return data;
  }
}

class Probability {
  dynamic type;
  dynamic percent;

  Probability({this.type, this.percent});

  Probability.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['percent'] = this.percent;
    return data;
  }
}

class SnowQpf {
  dynamic unit;
  dynamic quantity;

  SnowQpf({this.unit, this.quantity});

  SnowQpf.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    return data;
  }
}

class AirPressure {
  dynamic meanSeaLevelMillibars;

  AirPressure({this.meanSeaLevelMillibars});

  AirPressure.fromJson(Map<String, dynamic> json) {
    meanSeaLevelMillibars = json['meanSeaLevelMillibars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meanSeaLevelMillibars'] = this.meanSeaLevelMillibars;
    return data;
  }
}

class Wind {
  Direction? direction;
  Speed? speed;
  Speed? gust;

  Wind({this.direction, this.speed, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    direction = json['direction'] != null
        ? new Direction.fromJson(json['direction'])
        : null;
    speed = json['speed'] != null ? new Speed.fromJson(json['speed']) : null;
    gust = json['gust'] != null ? new Speed.fromJson(json['gust']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.direction != null) {
      data['direction'] = this.direction!.toJson();
    }
    if (this.speed != null) {
      data['speed'] = this.speed!.toJson();
    }
    if (this.gust != null) {
      data['gust'] = this.gust!.toJson();
    }
    return data;
  }
}

class Direction {
  dynamic cardinal;
  dynamic degrees;

  Direction({this.cardinal, this.degrees});

  Direction.fromJson(Map<String, dynamic> json) {
    cardinal = json['cardinal'];
    degrees = json['degrees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardinal'] = this.cardinal;
    data['degrees'] = this.degrees;
    return data;
  }
}

class Speed {
  dynamic unit;
  dynamic value;

  Speed({this.unit, this.value});

  Speed.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}

class Visibility {
  dynamic unit;
  dynamic distance;

  Visibility({this.unit, this.distance});

  Visibility.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['distance'] = this.distance;
    return data;
  }
}

class IceThickness {
  dynamic unit;
  dynamic thickness;

  IceThickness({this.unit, this.thickness});

  IceThickness.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    thickness = json['thickness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['thickness'] = this.thickness;
    return data;
  }
}

class TimeZone {
  dynamic id;
  dynamic version;

  TimeZone({this.id, this.version});

  TimeZone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    return data;
  }
}
