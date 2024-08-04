//api consts
class Urls{
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String iconCodebaseUrl = 'http://openweathermap.org/img/wn/';
  static const String apiKey = '6866ca41d562a0fee12eaa274fded507';
  static String currentWeatherByName(String cityName){
    return '$baseUrl/weather?q=$cityName&appid=$apiKey';
  }
  static String weatherIcon(String iconCode){
    return '$iconCodebaseUrl$iconCode@2x.png';
  }
}



