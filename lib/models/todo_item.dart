class City {
  final String city;
  final String country;
  final Map<String, dynamic> weatherData;

  City({
    required this.city,
    required this.country,
    required this.weatherData,
  });
  factory City.bangkok() {
    return City(
      city: "Bangkok",
      country: "Thailand",
      weatherData: {
        "lastUpdated": "2023-10-26 11:15",
        "tempC": 31,
        "tempF": 87.8,
        "feelsLikeC": 37,
        "feelsLikeF": 98.5,
        "windKph": 9,
        "windMph": 5.6,
        "humidity": 66,
        "uv": 7,
        "condition": {
          "text": "Partly cloudy",
          "icon": "https://cdn.weatherapi.com/weather/128x128/day/116.png",
          "code": 1003,
        },
      },
    );
  }

  factory City.chiangMai() {
    return City(
      city: "Chiang Mai",
      country: "Thailand",
      weatherData: {
        "lastUpdated": "2023-10-26 11:30",
        "tempC": 31,
        "tempF": 87.8,
        "feelsLikeC": 36.4,
        "feelsLikeF": 97.4,
        "windKph": 3.6,
        "windMph": 2.2,
        "humidity": 66,
        "uv": 6,
        "condition": {
          "text": "Partly cloudy",
          "icon": "https://cdn.weatherapi.com/weather/128x128/day/116.png",
          "code": 1003,
        },
      },
    );
  }
  factory City.nongkhai() {
    return City(
      city: "Nong Khai",
      country: "Thailand",
      weatherData: {
        "lastUpdated": "2023-10-26 10:45",
        "tempC": 31,
        "tempF": 87.8,
        "feelsLikeC": 37.9,
        "feelsLikeF": 100.2,
        "windKph": 6.8,
        "windMph": 4.3,
        "humidity": 75,
        "uv": 6,
        "condition": {
          "text": "Partly cloudy",
          "icon": "https://cdn.weatherapi.com/weather/128x128/day/116.png",
          "code": 1003
        }
      },
    );
  }
}