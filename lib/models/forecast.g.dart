// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    cod: json['cod'] as String,
    message: (json['message'] as num)?.toDouble(),
    cnt: json['cnt'] as int,
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ListElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    id: json['id'] as int,
    name: json['name'] as String,
    coord: json['coord'] == null
        ? null
        : Coord.fromJson(json['coord'] as Map<String, dynamic>),
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) {
  return Coord(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

ListElement _$ListElementFromJson(Map<String, dynamic> json) {
  return ListElement(
    dt: json['dt'] as int,
    main: json['main'] == null
        ? null
        : MainClass.fromJson(json['main'] as Map<String, dynamic>),
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clouds: json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    wind: json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    sys: json['sys'] == null
        ? null
        : Sys.fromJson(json['sys'] as Map<String, dynamic>),
    dtTxt: json['dtTxt'] as String,
    rain: json['rain'] == null
        ? null
        : Rain.fromJson(json['rain'] as Map<String, dynamic>),
    snow: json['snow'] == null
        ? null
        : Rain.fromJson(json['snow'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListElementToJson(ListElement instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'sys': instance.sys,
      'dtTxt': instance.dtTxt,
      'rain': instance.rain,
      'snow': instance.snow,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    all: json['all'] as int,
  );
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

MainClass _$MainClassFromJson(Map<String, dynamic> json) {
  return MainClass(
    temp: (json['temp'] as num)?.toDouble(),
    tempMin: (json['tempMin'] as num)?.toDouble(),
    tempMax: (json['tempMax'] as num)?.toDouble(),
    pressure: (json['pressure'] as num)?.toDouble(),
    seaLevel: (json['seaLevel'] as num)?.toDouble(),
    grndLevel: (json['grndLevel'] as num)?.toDouble(),
    humidity: json['humidity'] as int,
    tempKf: (json['tempKf'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MainClassToJson(MainClass instance) => <String, dynamic>{
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'seaLevel': instance.seaLevel,
      'grndLevel': instance.grndLevel,
      'humidity': instance.humidity,
      'tempKf': instance.tempKf,
    };

Rain _$RainFromJson(Map<String, dynamic> json) {
  return Rain(
    the3H: (json['the3H'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{
      'the3H': instance.the3H,
    };

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    pod: _$enumDecodeNullable(_$PodEnumMap, json['pod']),
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'pod': _$PodEnumMap[instance.pod],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PodEnumMap = {
  Pod.d: 'd',
  Pod.n: 'n',
};

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'] as int,
    main: json['main'] as String,
    description: json['description'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    speed: (json['speed'] as num)?.toDouble(),
    deg: (json['deg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
