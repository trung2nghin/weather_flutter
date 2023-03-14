import 'package:flutter/foundation.dart';

@immutable
class Forecasts {
  const Forecasts({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location location;
  final Current current;
  final Forecast forecast;

  factory Forecasts.fromJson(Map<String, dynamic> json) => Forecasts(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() =>
      {'location': location.toJson(), 'current': current.toJson(), 'forecast': forecast.toJson()};

  Forecasts clone() => Forecasts(location: location.clone(), current: current.clone(), forecast: forecast.clone());

  Forecasts copyWith({Location? location, Current? current, Forecast? forecast}) => Forecasts(
        location: location ?? this.location,
        current: current ?? this.current,
        forecast: forecast ?? this.forecast,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Forecasts && location == other.location && current == other.current && forecast == other.forecast;

  @override
  int get hashCode => location.hashCode ^ current.hashCode ^ forecast.hashCode;
}

@immutable
class Location {
  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      name: json['name'].toString(),
      region: json['region'].toString(),
      country: json['country'].toString(),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      tzId: json['tz_id'].toString(),
      localtimeEpoch: json['localtime_epoch'] as int,
      localtime: json['localtime'].toString());

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime
      };

  Location clone() => Location(
      name: name,
      region: region,
      country: country,
      lat: lat,
      lon: lon,
      tzId: tzId,
      localtimeEpoch: localtimeEpoch,
      localtime: localtime);

  Location copyWith(
          {String? name,
          String? region,
          String? country,
          double? lat,
          double? lon,
          String? tzId,
          int? localtimeEpoch,
          String? localtime}) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tzId: tzId ?? this.tzId,
        localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
        localtime: localtime ?? this.localtime,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          name == other.name &&
          region == other.region &&
          country == other.country &&
          lat == other.lat &&
          lon == other.lon &&
          tzId == other.tzId &&
          localtimeEpoch == other.localtimeEpoch &&
          localtime == other.localtime;

  @override
  int get hashCode =>
      name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      tzId.hashCode ^
      localtimeEpoch.hashCode ^
      localtime.hashCode;
}

@immutable
class Current {
  const Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      lastUpdated: json['last_updated'].toString(),
      tempC: json['temp_c'] as double,
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'] as int,
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: json['wind_kph'] as double,
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'].toString(),
      pressureMb: json['pressure_mb'] as double,
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: json['precip_mm'] as double,
      precipIn: json['precip_in'] as double,
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslikeC: json['feelslike_c'] as double,
      feelslikeF: (json['feelslike_f'] as num).toDouble(),
      visKm: (json['vis_km'] as num).toDouble(),
      visMiles: json['vis_miles'] as double,
      uv: json['uv'] as double,
      gustMph: (json['gust_mph'] as num).toDouble(),
      gustKph: (json['gust_kph'] as num).toDouble());

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph
      };

  Current clone() => Current(
      lastUpdatedEpoch: lastUpdatedEpoch,
      lastUpdated: lastUpdated,
      tempC: tempC,
      tempF: tempF,
      isDay: isDay,
      condition: condition.clone(),
      windMph: windMph,
      windKph: windKph,
      windDegree: windDegree,
      windDir: windDir,
      pressureMb: pressureMb,
      pressureIn: pressureIn,
      precipMm: precipMm,
      precipIn: precipIn,
      humidity: humidity,
      cloud: cloud,
      feelslikeC: feelslikeC,
      feelslikeF: feelslikeF,
      visKm: visKm,
      visMiles: visMiles,
      uv: uv,
      gustMph: gustMph,
      gustKph: gustKph);

  Current copyWith(
          {int? lastUpdatedEpoch,
          String? lastUpdated,
          double? tempC,
          double? tempF,
          int? isDay,
          Condition? condition,
          double? windMph,
          double? windKph,
          int? windDegree,
          String? windDir,
          double? pressureMb,
          double? pressureIn,
          double? precipMm,
          double? precipIn,
          int? humidity,
          int? cloud,
          double? feelslikeC,
          double? feelslikeF,
          double? visKm,
          double? visMiles,
          double? uv,
          double? gustMph,
          double? gustKph}) =>
      Current(
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipMm: precipMm ?? this.precipMm,
        precipIn: precipIn ?? this.precipIn,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelslikeC: feelslikeC ?? this.feelslikeC,
        feelslikeF: feelslikeF ?? this.feelslikeF,
        visKm: visKm ?? this.visKm,
        visMiles: visMiles ?? this.visMiles,
        uv: uv ?? this.uv,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Current &&
          lastUpdatedEpoch == other.lastUpdatedEpoch &&
          lastUpdated == other.lastUpdated &&
          tempC == other.tempC &&
          tempF == other.tempF &&
          isDay == other.isDay &&
          condition == other.condition &&
          windMph == other.windMph &&
          windKph == other.windKph &&
          windDegree == other.windDegree &&
          windDir == other.windDir &&
          pressureMb == other.pressureMb &&
          pressureIn == other.pressureIn &&
          precipMm == other.precipMm &&
          precipIn == other.precipIn &&
          humidity == other.humidity &&
          cloud == other.cloud &&
          feelslikeC == other.feelslikeC &&
          feelslikeF == other.feelslikeF &&
          visKm == other.visKm &&
          visMiles == other.visMiles &&
          uv == other.uv &&
          gustMph == other.gustMph &&
          gustKph == other.gustKph;

  @override
  int get hashCode =>
      lastUpdatedEpoch.hashCode ^
      lastUpdated.hashCode ^
      tempC.hashCode ^
      tempF.hashCode ^
      isDay.hashCode ^
      condition.hashCode ^
      windMph.hashCode ^
      windKph.hashCode ^
      windDegree.hashCode ^
      windDir.hashCode ^
      pressureMb.hashCode ^
      pressureIn.hashCode ^
      precipMm.hashCode ^
      precipIn.hashCode ^
      humidity.hashCode ^
      cloud.hashCode ^
      feelslikeC.hashCode ^
      feelslikeF.hashCode ^
      visKm.hashCode ^
      visMiles.hashCode ^
      uv.hashCode ^
      gustMph.hashCode ^
      gustKph.hashCode;
}

@immutable
class Condition {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      Condition(text: json['text'].toString(), icon: json['icon'].toString(), code: json['code'] as int);

  Map<String, dynamic> toJson() => {'text': text, 'icon': icon, 'code': code};

  Condition clone() => Condition(text: text, icon: icon, code: code);

  Condition copyWith({String? text, String? icon, int? code}) => Condition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Condition && text == other.text && icon == other.icon && code == other.code;

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}

@immutable
class Forecast {
  const Forecast({
    required this.forecastday,
  });

  final List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
      forecastday:
          (json['forecastday'] as List? ?? []).map((e) => Forecastday.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {'forecastday': forecastday.map((e) => e.toJson()).toList()};

  Forecast clone() => Forecast(forecastday: forecastday.map((e) => e.clone()).toList());

  Forecast copyWith({List<Forecastday>? forecastday}) => Forecast(
        forecastday: forecastday ?? this.forecastday,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || other is Forecast && forecastday == other.forecastday;

  @override
  int get hashCode => forecastday.hashCode;
}

@immutable
class Forecastday {
  const Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
      date: json['date'].toString(),
      dateEpoch: json['date_epoch'] as int,
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
      astro: Astro.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List? ?? []).map((e) => Hour.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day.toJson(),
        'astro': astro.toJson(),
        'hour': hour.map((e) => e.toJson()).toList()
      };

  Forecastday clone() => Forecastday(
      date: date,
      dateEpoch: dateEpoch,
      day: day.clone(),
      astro: astro.clone(),
      hour: hour.map((e) => e.clone()).toList());

  Forecastday copyWith({String? date, int? dateEpoch, Day? day, Astro? astro, List<Hour>? hour}) => Forecastday(
        date: date ?? this.date,
        dateEpoch: dateEpoch ?? this.dateEpoch,
        day: day ?? this.day,
        astro: astro ?? this.astro,
        hour: hour ?? this.hour,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Forecastday &&
          date == other.date &&
          dateEpoch == other.dateEpoch &&
          day == other.day &&
          astro == other.astro &&
          hour == other.hour;

  @override
  int get hashCode => date.hashCode ^ dateEpoch.hashCode ^ day.hashCode ^ astro.hashCode ^ hour.hashCode;
}

@immutable
class Day {
  const Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
      maxtempC: (json['maxtemp_c'] as num).toDouble(),
      maxtempF: (json['maxtemp_f'] as num).toDouble(),
      mintempC: (json['mintemp_c'] as num).toDouble(),
      mintempF: (json['mintemp_f'] as num).toDouble(),
      avgtempC: (json['avgtemp_c'] as num).toDouble(),
      avgtempF: json['avgtemp_f'] as double,
      maxwindMph: (json['maxwind_mph'] as num).toDouble(),
      maxwindKph: (json['maxwind_kph'] as num).toDouble(),
      totalprecipMm: json['totalprecip_mm'] as double,
      totalprecipIn: json['totalprecip_in'] as double,
      totalsnowCm: json['totalsnow_cm'] as double,
      avgvisKm: json['avgvis_km'] as double,
      avgvisMiles: json['avgvis_miles'] as double,
      avghumidity: json['avghumidity'] as double,
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
      dailyWillItSnow: json['daily_will_it_snow'] as int,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int,
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      uv: json['uv'] as double);

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition.toJson(),
        'uv': uv
      };

  Day clone() => Day(
      maxtempC: maxtempC,
      maxtempF: maxtempF,
      mintempC: mintempC,
      mintempF: mintempF,
      avgtempC: avgtempC,
      avgtempF: avgtempF,
      maxwindMph: maxwindMph,
      maxwindKph: maxwindKph,
      totalprecipMm: totalprecipMm,
      totalprecipIn: totalprecipIn,
      totalsnowCm: totalsnowCm,
      avgvisKm: avgvisKm,
      avgvisMiles: avgvisMiles,
      avghumidity: avghumidity,
      dailyWillItRain: dailyWillItRain,
      dailyChanceOfRain: dailyChanceOfRain,
      dailyWillItSnow: dailyWillItSnow,
      dailyChanceOfSnow: dailyChanceOfSnow,
      condition: condition.clone(),
      uv: uv);

  Day copyWith(
          {double? maxtempC,
          double? maxtempF,
          double? mintempC,
          double? mintempF,
          double? avgtempC,
          double? avgtempF,
          double? maxwindMph,
          double? maxwindKph,
          double? totalprecipMm,
          double? totalprecipIn,
          double? totalsnowCm,
          double? avgvisKm,
          double? avgvisMiles,
          double? avghumidity,
          int? dailyWillItRain,
          int? dailyChanceOfRain,
          int? dailyWillItSnow,
          int? dailyChanceOfSnow,
          Condition? condition,
          double? uv}) =>
      Day(
        maxtempC: maxtempC ?? this.maxtempC,
        maxtempF: maxtempF ?? this.maxtempF,
        mintempC: mintempC ?? this.mintempC,
        mintempF: mintempF ?? this.mintempF,
        avgtempC: avgtempC ?? this.avgtempC,
        avgtempF: avgtempF ?? this.avgtempF,
        maxwindMph: maxwindMph ?? this.maxwindMph,
        maxwindKph: maxwindKph ?? this.maxwindKph,
        totalprecipMm: totalprecipMm ?? this.totalprecipMm,
        totalprecipIn: totalprecipIn ?? this.totalprecipIn,
        totalsnowCm: totalsnowCm ?? this.totalsnowCm,
        avgvisKm: avgvisKm ?? this.avgvisKm,
        avgvisMiles: avgvisMiles ?? this.avgvisMiles,
        avghumidity: avghumidity ?? this.avghumidity,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
        dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
        condition: condition ?? this.condition,
        uv: uv ?? this.uv,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Day &&
          maxtempC == other.maxtempC &&
          maxtempF == other.maxtempF &&
          mintempC == other.mintempC &&
          mintempF == other.mintempF &&
          avgtempC == other.avgtempC &&
          avgtempF == other.avgtempF &&
          maxwindMph == other.maxwindMph &&
          maxwindKph == other.maxwindKph &&
          totalprecipMm == other.totalprecipMm &&
          totalprecipIn == other.totalprecipIn &&
          totalsnowCm == other.totalsnowCm &&
          avgvisKm == other.avgvisKm &&
          avgvisMiles == other.avgvisMiles &&
          avghumidity == other.avghumidity &&
          dailyWillItRain == other.dailyWillItRain &&
          dailyChanceOfRain == other.dailyChanceOfRain &&
          dailyWillItSnow == other.dailyWillItSnow &&
          dailyChanceOfSnow == other.dailyChanceOfSnow &&
          condition == other.condition &&
          uv == other.uv;

  @override
  int get hashCode =>
      maxtempC.hashCode ^
      maxtempF.hashCode ^
      mintempC.hashCode ^
      mintempF.hashCode ^
      avgtempC.hashCode ^
      avgtempF.hashCode ^
      maxwindMph.hashCode ^
      maxwindKph.hashCode ^
      totalprecipMm.hashCode ^
      totalprecipIn.hashCode ^
      totalsnowCm.hashCode ^
      avgvisKm.hashCode ^
      avgvisMiles.hashCode ^
      avghumidity.hashCode ^
      dailyWillItRain.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyWillItSnow.hashCode ^
      dailyChanceOfSnow.hashCode ^
      condition.hashCode ^
      uv.hashCode;
}

@immutable
class Astro {
  const Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final String moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
      sunrise: json['sunrise'].toString(),
      sunset: json['sunset'].toString(),
      moonrise: json['moonrise'].toString(),
      moonset: json['moonset'].toString(),
      moonPhase: json['moon_phase'].toString(),
      moonIllumination: json['moon_illumination'].toString(),
      isMoonUp: json['is_moon_up'] as int,
      isSunUp: json['is_sun_up'] as int);

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
        'is_moon_up': isMoonUp,
        'is_sun_up': isSunUp
      };

  Astro clone() => Astro(
      sunrise: sunrise,
      sunset: sunset,
      moonrise: moonrise,
      moonset: moonset,
      moonPhase: moonPhase,
      moonIllumination: moonIllumination,
      isMoonUp: isMoonUp,
      isSunUp: isSunUp);

  Astro copyWith(
          {String? sunrise,
          String? sunset,
          String? moonrise,
          String? moonset,
          String? moonPhase,
          String? moonIllumination,
          int? isMoonUp,
          int? isSunUp}) =>
      Astro(
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        moonrise: moonrise ?? this.moonrise,
        moonset: moonset ?? this.moonset,
        moonPhase: moonPhase ?? this.moonPhase,
        moonIllumination: moonIllumination ?? this.moonIllumination,
        isMoonUp: isMoonUp ?? this.isMoonUp,
        isSunUp: isSunUp ?? this.isSunUp,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Astro &&
          sunrise == other.sunrise &&
          sunset == other.sunset &&
          moonrise == other.moonrise &&
          moonset == other.moonset &&
          moonPhase == other.moonPhase &&
          moonIllumination == other.moonIllumination &&
          isMoonUp == other.isMoonUp &&
          isSunUp == other.isSunUp;

  @override
  int get hashCode =>
      sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      moonPhase.hashCode ^
      moonIllumination.hashCode ^
      isMoonUp.hashCode ^
      isSunUp.hashCode;
}

@immutable
class Hour {
  const Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
      timeEpoch: json['time_epoch'] as int,
      time: json['time'].toString(),
      tempC: json['temp_c'] as double,
      tempF: json['temp_f'] as double,
      isDay: json['is_day'] as int,
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'].toString(),
      pressureMb: json['pressure_mb'] as double,
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: json['precip_mm'] as double,
      precipIn: json['precip_in'] as double,
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslikeC: json['feelslike_c'] as double,
      feelslikeF: json['feelslike_f'] as double,
      windchillC: json['windchill_c'] as double,
      windchillF: json['windchill_f'] as double,
      heatindexC: json['heatindex_c'] as double,
      heatindexF: json['heatindex_f'] as double,
      dewpointC: (json['dewpoint_c'] as num).toDouble(),
      dewpointF: (json['dewpoint_f'] as num).toDouble(),
      willItRain: json['will_it_rain'] as int,
      chanceOfRain: json['chance_of_rain'] as int,
      willItSnow: json['will_it_snow'] as int,
      chanceOfSnow: json['chance_of_snow'] as int,
      visKm: json['vis_km'] as double,
      visMiles: json['vis_miles'] as double,
      gustMph: (json['gust_mph'] as num).toDouble(),
      gustKph: (json['gust_kph'] as num).toDouble(),
      uv: json['uv'] as double);

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'uv': uv
      };

  Hour clone() => Hour(
      timeEpoch: timeEpoch,
      time: time,
      tempC: tempC,
      tempF: tempF,
      isDay: isDay,
      condition: condition.clone(),
      windMph: windMph,
      windKph: windKph,
      windDegree: windDegree,
      windDir: windDir,
      pressureMb: pressureMb,
      pressureIn: pressureIn,
      precipMm: precipMm,
      precipIn: precipIn,
      humidity: humidity,
      cloud: cloud,
      feelslikeC: feelslikeC,
      feelslikeF: feelslikeF,
      windchillC: windchillC,
      windchillF: windchillF,
      heatindexC: heatindexC,
      heatindexF: heatindexF,
      dewpointC: dewpointC,
      dewpointF: dewpointF,
      willItRain: willItRain,
      chanceOfRain: chanceOfRain,
      willItSnow: willItSnow,
      chanceOfSnow: chanceOfSnow,
      visKm: visKm,
      visMiles: visMiles,
      gustMph: gustMph,
      gustKph: gustKph,
      uv: uv);

  Hour copyWith(
          {int? timeEpoch,
          String? time,
          double? tempC,
          double? tempF,
          int? isDay,
          Condition? condition,
          double? windMph,
          double? windKph,
          int? windDegree,
          String? windDir,
          double? pressureMb,
          double? pressureIn,
          double? precipMm,
          double? precipIn,
          int? humidity,
          int? cloud,
          double? feelslikeC,
          double? feelslikeF,
          double? windchillC,
          double? windchillF,
          double? heatindexC,
          double? heatindexF,
          double? dewpointC,
          double? dewpointF,
          int? willItRain,
          int? chanceOfRain,
          int? willItSnow,
          int? chanceOfSnow,
          double? visKm,
          double? visMiles,
          double? gustMph,
          double? gustKph,
          double? uv}) =>
      Hour(
        timeEpoch: timeEpoch ?? this.timeEpoch,
        time: time ?? this.time,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipMm: precipMm ?? this.precipMm,
        precipIn: precipIn ?? this.precipIn,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelslikeC: feelslikeC ?? this.feelslikeC,
        feelslikeF: feelslikeF ?? this.feelslikeF,
        windchillC: windchillC ?? this.windchillC,
        windchillF: windchillF ?? this.windchillF,
        heatindexC: heatindexC ?? this.heatindexC,
        heatindexF: heatindexF ?? this.heatindexF,
        dewpointC: dewpointC ?? this.dewpointC,
        dewpointF: dewpointF ?? this.dewpointF,
        willItRain: willItRain ?? this.willItRain,
        chanceOfRain: chanceOfRain ?? this.chanceOfRain,
        willItSnow: willItSnow ?? this.willItSnow,
        chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
        visKm: visKm ?? this.visKm,
        visMiles: visMiles ?? this.visMiles,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
        uv: uv ?? this.uv,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hour &&
          timeEpoch == other.timeEpoch &&
          time == other.time &&
          tempC == other.tempC &&
          tempF == other.tempF &&
          isDay == other.isDay &&
          condition == other.condition &&
          windMph == other.windMph &&
          windKph == other.windKph &&
          windDegree == other.windDegree &&
          windDir == other.windDir &&
          pressureMb == other.pressureMb &&
          pressureIn == other.pressureIn &&
          precipMm == other.precipMm &&
          precipIn == other.precipIn &&
          humidity == other.humidity &&
          cloud == other.cloud &&
          feelslikeC == other.feelslikeC &&
          feelslikeF == other.feelslikeF &&
          windchillC == other.windchillC &&
          windchillF == other.windchillF &&
          heatindexC == other.heatindexC &&
          heatindexF == other.heatindexF &&
          dewpointC == other.dewpointC &&
          dewpointF == other.dewpointF &&
          willItRain == other.willItRain &&
          chanceOfRain == other.chanceOfRain &&
          willItSnow == other.willItSnow &&
          chanceOfSnow == other.chanceOfSnow &&
          visKm == other.visKm &&
          visMiles == other.visMiles &&
          gustMph == other.gustMph &&
          gustKph == other.gustKph &&
          uv == other.uv;

  @override
  int get hashCode =>
      timeEpoch.hashCode ^
      time.hashCode ^
      tempC.hashCode ^
      tempF.hashCode ^
      isDay.hashCode ^
      condition.hashCode ^
      windMph.hashCode ^
      windKph.hashCode ^
      windDegree.hashCode ^
      windDir.hashCode ^
      pressureMb.hashCode ^
      pressureIn.hashCode ^
      precipMm.hashCode ^
      precipIn.hashCode ^
      humidity.hashCode ^
      cloud.hashCode ^
      feelslikeC.hashCode ^
      feelslikeF.hashCode ^
      windchillC.hashCode ^
      windchillF.hashCode ^
      heatindexC.hashCode ^
      heatindexF.hashCode ^
      dewpointC.hashCode ^
      dewpointF.hashCode ^
      willItRain.hashCode ^
      chanceOfRain.hashCode ^
      willItSnow.hashCode ^
      chanceOfSnow.hashCode ^
      visKm.hashCode ^
      visMiles.hashCode ^
      gustMph.hashCode ^
      gustKph.hashCode ^
      uv.hashCode;
}
