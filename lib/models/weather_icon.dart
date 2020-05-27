class WeatherIcon {
  static String getForWeather(String icon) {
    switch (icon) {
      case "01d":
        return "assets/045-sun.svg";
      case "01n":
        return "assets/080-moon.svg";
      case "02d":
        return "assets/066-sunny.svg";
      case "02n":
        return "assets/065-cloudy-night-1.svg";
      case "03d":
        return "assets/096-cloud-2.svg";
      case "03n":
        return "assets/092-cloud-6.svg";
      case "04d":
      case "04n":
        return "assets/097-cloud-1.svg";
      case "09d":
      case "09n":
        return "assets/063-rain-3.svg";
      case "10d":
        return "assets/083-rain.svg";
      case "10n":
        return "assets/082-rain-1.svg";
      case "11d":
      case "11n":
        return "assets/090-storm-1.svg";
      case "13d":
      case "13n":
        return "assets/055-snowy.svg";
      case "50d":
      case "50n":
        return "assets/075-haze.svg";
      default:
        return "";
    }
  }

  static String getDefault() => "assets/045-sun.svg";
}
