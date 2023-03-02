import 'package:flutter/foundation.dart';

@immutable
class Weathers {
  const Weathers({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory Weathers.fromJson(Map<String, dynamic> json) => Weathers(
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List? ?? []).map((e) => Weather.fromJson(e as Map<String, dynamic>)).toList(),
      base: json['base'].toString(),
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'].toString(),
      cod: json['cod'] as int);

  Map<String, dynamic> toJson() => {
        'coord': coord.toJson(),
        'weather': weather.map((e) => e.toJson()).toList(),
        'base': base,
        'main': main.toJson(),
        'visibility': visibility,
        'wind': wind.toJson(),
        'clouds': clouds.toJson(),
        'dt': dt,
        'sys': sys.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod
      };

  Weathers clone() => Weathers(
      coord: coord.clone(),
      weather: weather.map((e) => e.clone()).toList(),
      base: base,
      main: main.clone(),
      visibility: visibility,
      wind: wind.clone(),
      clouds: clouds.clone(),
      dt: dt,
      sys: sys.clone(),
      timezone: timezone,
      id: id,
      name: name,
      cod: cod);

  Weathers copyWith(
          {Coord? coord,
          List<Weather>? weather,
          String? base,
          Main? main,
          int? visibility,
          Wind? wind,
          Clouds? clouds,
          int? dt,
          Sys? sys,
          int? timezone,
          int? id,
          String? name,
          int? cod}) =>
      Weathers(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        timezone: timezone ?? this.timezone,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weathers &&
          coord == other.coord &&
          weather == other.weather &&
          base == other.base &&
          main == other.main &&
          visibility == other.visibility &&
          wind == other.wind &&
          clouds == other.clouds &&
          dt == other.dt &&
          sys == other.sys &&
          timezone == other.timezone &&
          id == other.id &&
          name == other.name &&
          cod == other.cod;

  @override
  int get hashCode =>
      coord.hashCode ^
      weather.hashCode ^
      base.hashCode ^
      main.hashCode ^
      visibility.hashCode ^
      wind.hashCode ^
      clouds.hashCode ^
      dt.hashCode ^
      sys.hashCode ^
      timezone.hashCode ^
      id.hashCode ^
      name.hashCode ^
      cod.hashCode;
}

@immutable
class Coord {
  const Coord({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) =>
      Coord(lon: (json['lon'] as num).toDouble(), lat: (json['lat'] as num).toDouble());

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};

  Coord clone() => Coord(lon: lon, lat: lat);

  Coord copyWith({double? lon, double? lat}) => Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || other is Coord && lon == other.lon && lat == other.lat;

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}

@immutable
class Weather {
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int,
      main: json['main'].toString(),
      description: json['description'].toString(),
      icon: json['icon'].toString());

  Map<String, dynamic> toJson() => {'id': id, 'main': main, 'description': description, 'icon': icon};

  Weather clone() => Weather(id: id, main: main, description: description, icon: icon);

  Weather copyWith({int? id, String? main, String? description, String? icon}) => Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          id == other.id &&
          main == other.main &&
          description == other.description &&
          icon == other.icon;

  @override
  int get hashCode => id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
}

@immutable
class Main {
  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      seaLevel: json['sea_level'] as int,
      grndLevel: json['grnd_level'] as int);

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
        'sea_level': seaLevel,
        'grnd_level': grndLevel
      };

  Main clone() => Main(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
      seaLevel: seaLevel,
      grndLevel: grndLevel);

  Main copyWith(
          {double? temp,
          double? feelsLike,
          double? tempMin,
          double? tempMax,
          int? pressure,
          int? humidity,
          int? seaLevel,
          int? grndLevel}) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        seaLevel: seaLevel ?? this.seaLevel,
        grndLevel: grndLevel ?? this.grndLevel,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Main &&
          temp == other.temp &&
          feelsLike == other.feelsLike &&
          tempMin == other.tempMin &&
          tempMax == other.tempMax &&
          pressure == other.pressure &&
          humidity == other.humidity &&
          seaLevel == other.seaLevel &&
          grndLevel == other.grndLevel;

  @override
  int get hashCode =>
      temp.hashCode ^
      feelsLike.hashCode ^
      tempMin.hashCode ^
      tempMax.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      seaLevel.hashCode ^
      grndLevel.hashCode;
}

@immutable
class Wind {
  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  factory Wind.fromJson(Map<String, dynamic> json) =>
      Wind(speed: (json['speed'] as num).toDouble(), deg: json['deg'] as int, gust: (json['gust'] as num).toDouble());

  Map<String, dynamic> toJson() => {'speed': speed, 'deg': deg, 'gust': gust};

  Wind clone() => Wind(speed: speed, deg: deg, gust: gust);

  Wind copyWith({double? speed, int? deg, double? gust}) => Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Wind && speed == other.speed && deg == other.deg && gust == other.gust;

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode ^ gust.hashCode;
}

@immutable
class Clouds {
  const Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(all: json['all'] as int);

  Map<String, dynamic> toJson() => {'all': all};

  Clouds clone() => Clouds(all: all);

  Clouds copyWith({int? all}) => Clouds(
        all: all ?? this.all,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || other is Clouds && all == other.all;

  @override
  int get hashCode => all.hashCode;
}

@immutable
class Sys {
  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
      type: json['type'] as int,
      id: json['id'] as int,
      country: json['country'].toString(),
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int);

  Map<String, dynamic> toJson() => {'type': type, 'id': id, 'country': country, 'sunrise': sunrise, 'sunset': sunset};

  Sys clone() => Sys(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);

  Sys copyWith({int? type, int? id, String? country, int? sunrise, int? sunset}) => Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sys &&
          type == other.type &&
          id == other.id &&
          country == other.country &&
          sunrise == other.sunrise &&
          sunset == other.sunset;

  @override
  int get hashCode => type.hashCode ^ id.hashCode ^ country.hashCode ^ sunrise.hashCode ^ sunset.hashCode;
}
