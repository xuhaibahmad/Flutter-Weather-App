// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
      lat: (json['lat'] as num)?.toDouble(),
      lon: (json['lon'] as num)?.toDouble(),
      timezone: json['timezone'] as String,
      timezoneOffset: json['timezoneOffset'] as int,
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      minutely: (json['minutely'] as List)
          ?.map((e) =>
              e == null ? null : Minutely.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hourly: (json['hourly'] as List)
          ?.map((e) =>
              e == null ? null : Hourly.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      daily: (json['daily'] as List)
          ?.map((e) =>
              e == null ? null : Daily.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezoneOffset': instance.timezoneOffset,
      'current': instance.current,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily
    };

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return Current(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temp: (json['temp'] as num)?.toDouble(),
      feelsLike: (json['feelsLike'] as num)?.toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dewPoint'] as num)?.toDouble(),
      uvi: (json['uvi'] as num)?.toDouble(),
      clouds: json['clouds'] as int,
      visibility: json['visibility'] as int,
      windSpeed: (json['windSpeed'] as num)?.toDouble(),
      windDeg: json['windDeg'] as int,
      weather: (json['weather'] as List)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      rain: json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weather': instance.weather,
      'rain': instance.rain
    };

Rain _$RainFromJson(Map<String, dynamic> json) {
  return Rain(the1H: (json['the1H'] as num)?.toDouble());
}

Map<String, dynamic> _$RainToJson(Rain instance) =>
    <String, dynamic>{'the1H': instance.the1H};

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String);
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon
    };

Daily _$DailyFromJson(Map<String, dynamic> json) {
  return Daily(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feelsLike'] == null
          ? null
          : FeelsLike.fromJson(json['feelsLike'] as Map<String, dynamic>),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dewPoint'] as num)?.toDouble(),
      windSpeed: (json['windSpeed'] as num)?.toDouble(),
      windDeg: json['windDeg'] as int,
      weather: (json['weather'] as List)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      clouds: json['clouds'] as int,
      rain: (json['rain'] as num)?.toDouble(),
      uvi: (json['uvi'] as num)?.toDouble());
}

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'rain': instance.rain,
      'uvi': instance.uvi
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) {
  return FeelsLike(
      day: (json['day'] as num)?.toDouble(),
      night: (json['night'] as num)?.toDouble(),
      eve: (json['eve'] as num)?.toDouble(),
      morn: (json['morn'] as num)?.toDouble());
}

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn
    };

Temp _$TempFromJson(Map<String, dynamic> json) {
  return Temp(
      day: (json['day'] as num)?.toDouble(),
      min: (json['min'] as num)?.toDouble(),
      max: (json['max'] as num)?.toDouble(),
      night: (json['night'] as num)?.toDouble(),
      eve: (json['eve'] as num)?.toDouble(),
      morn: (json['morn'] as num)?.toDouble());
}

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return Hourly(
      dt: json['dt'] as int,
      temp: (json['temp'] as num)?.toDouble(),
      feelsLike: (json['feelsLike'] as num)?.toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dewPoint'] as num)?.toDouble(),
      clouds: json['clouds'] as int,
      windSpeed: (json['windSpeed'] as num)?.toDouble(),
      windDeg: json['windDeg'] as int,
      weather: (json['weather'] as List)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      rain: json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'clouds': instance.clouds,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weather': instance.weather,
      'rain': instance.rain
    };

Minutely _$MinutelyFromJson(Map<String, dynamic> json) {
  return Minutely(
      dt: json['dt'] as int,
      precipitation: (json['precipitation'] as num)?.toDouble());
}

Map<String, dynamic> _$MinutelyToJson(Minutely instance) => <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation
    };
