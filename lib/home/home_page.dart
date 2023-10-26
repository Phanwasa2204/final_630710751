import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.json));
  List<String> cities = ['Bangkok', 'Chiang Mai', 'Nong Khai'];
  String selectedCity = 'Bangkok';
  String temperatureUnit = '°C';
  String windSpeedUnit = 'km/h';
  String imageUrl = '';

  Map<String, Map<String, dynamic>> weatherData = {
  };

  void fetchWeatherData(String city) async {
    try {
      // Simulate API response (replace with actual API call in your code)
      Map<String, dynamic> data = {
        "Nong Khai": city,
        "temperature": 30.5,
        "humidity": 65,
        "windSpeed": 12,
        "uvIndex": 7,
        "imageUrl": "https://example.com/nongkhai.jpg"
      };

      setState(() {
        weatherData[city] = data;
        imageUrl = data['imageUrl'];
      });
    } catch (e) {
      setState(() {
        imageUrl = ''; // Clear image if there's an error
      });
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching weather data. Please try again.'),
        ),
      );
    }
  }

  void changeCity(String city) {
    setState(() {
      selectedCity = city;
      fetchWeatherData(city);
    });
  }

  void toggleTemperatureUnit() {
    setState(() {
      if (temperatureUnit == '°C') {
        temperatureUnit = '°F';
        windSpeedUnit = 'mph';
      } else {
        temperatureUnit = '°C';
        windSpeedUnit = 'km/h';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch initial weather data for the default city
    fetchWeatherData(selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          PopupMenuButton<String>(
            onSelected: changeCity,
            itemBuilder: (BuildContext context) {
              return cities.map((String city) {
                return PopupMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList();
            },
          ),
          SizedBox(width: 10), // Add some spacing

          // Buttons for each city
          ElevatedButton(
            onPressed: () {
              changeCity('Bangkok');
              fetchWeatherData('Bangkok');
            },
            child: Text('Bangkok'),
          ),
          SizedBox(width: 10),

          ElevatedButton(
            onPressed: () {
              changeCity('Chiang Mai');
              fetchWeatherData('Chiang Mai');
            },
            child: Text('Chiang Mai'),
          ),
          SizedBox(width: 10),

          ElevatedButton(
            onPressed: () {
              changeCity('Nong Khai');
              fetchWeatherData('Nong Khai');
            },
            child: Text('Nong Khai'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weather for $selectedCity:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
              ),
              Text(
                'Temperature: ${weatherData[selectedCity]?['temperature'] ?? ''} $temperatureUnit',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Humidity: ${weatherData[selectedCity]?['humidity'] ?? ''}%',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                'Wind Speed: ${weatherData[selectedCity]?['windSpeed'] ?? ''} $windSpeedUnit',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'UV Index: ${weatherData[selectedCity]?['uvIndex'] ?? ''}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleTemperatureUnit,
        tooltip: 'Toggle Temperature Unit',
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}