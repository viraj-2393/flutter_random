

import 'package:ambibuzz/apis/world_countries_api.dart';
import 'package:ambibuzz/models/CountryModel.dart';
import 'package:get/get.dart';

class CountryController extends GetxController{
  RxString name = "".obs;
  RxString officialName = "".obs;
  RxString capital = "".obs;
  RxString currency = "".obs;
  RxBool independent = true.obs;
  RxBool unMember = true.obs;
  RxString region = "".obs;
  RxDouble area = 0.0.obs;
  RxInt population = 0.obs;
  RxString flag = "".obs;
  RxDouble rate_against_usd = 0.0.obs;
  RxString latitude = "".obs;
  RxString longitude = "".obs;
  RxString description = "".obs;
  RxString temperature = "".obs;
  RxString windSpeed = "".obs;
  RxString humidity = "".obs;
  RxString cloud = "".obs;

  Future<void> getCountryData(String countryName) async{
    CountryModel? countryModel = await getCountryInfo(countryName);
    if(countryModel != null){
      name = countryModel.name!.common.toString().obs;
      officialName = countryModel.name!.official.toString().obs;
      capital = countryModel.capital!.first.toString().obs;
      currency = countryModel.currencies.keys.elementAt(0).toString().obs;
      independent = countryModel != null ? countryModel.independent == true ? true.obs:false.obs : false.obs;
      unMember = countryModel != null ? countryModel.unMember == true ? true.obs:false.obs : false.obs;
      region = countryModel.region.toString().obs;
      area = double.parse(countryModel.area.toString()).obs;
      population = int.parse(countryModel.population.toString()).obs;
      flag = countryModel.flags!.png.toString().obs;
      latitude = countryModel.latlng![0].toString().obs;
      longitude = countryModel.latlng![1].toString().obs;
      rate_against_usd = await getExchangeData(currency.toString());
      await getWeatherData(latitude.toString(), longitude.toString());
    }
  }

  Future<RxDouble> getExchangeData(String currency) async{
     String? currency_value = await getExchangeRate(currency);
     return double.parse(currency_value.toString()).obs;
  }

  Future<void> getWeatherData(String latitude,String longitude) async{
    Map<String,dynamic>? weather_data = await getWeather(latitude,longitude);
    description = weather_data!["description"].toString().obs;
    temperature = weather_data["temperature"].toString().obs;
    windSpeed = weather_data["windSpeed"].toString().obs;
    humidity = weather_data["humidity"].toString().obs;
    cloud = weather_data["cloud"].toString().obs;

  }
}