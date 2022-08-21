

import 'package:ambibuzz/models/CountryModel.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/url_constants.dart';

Future<CountryModel?> getCountryInfo(String countryName) async{
  Dio dio = Dio();
  String url = URLS.country_details+countryName+"?fullText=true";
  try{
    //call to the api to get info related to the country
    final response = await dio.get(
      url,
      );
    if(response.statusCode == 200){
      CountryModel countryModel = CountryModel.fromJson(response.data.first);
      return countryModel;
    }
  }
  catch(exception,stack){
    Fluttertoast.showToast(msg: 'Something went wrong');
  }

  return null;
}


Future<String?> getExchangeRate(String currency) async{
  Dio dio = Dio();
  String url = URLS.exchange_rate+"?symbols=${currency}&base=USD";
  try{
    //call to the api to get info related to the country currency exchange rate
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'apiKey': URLS.currency_api_key
        }
      )
    );
    if(response.statusCode == 200){
      return response.data['rates'][currency].toString();
    }
  }
  catch(exception,stack){
    Fluttertoast.showToast(msg: 'Something went wrong');
  }

  return null;
}

Future<Map<String,dynamic>?> getWeather(String latitude,String longitude) async{
  Dio dio = Dio();
  String url = URLS.weather;
  try{
    //call to the api to get info related to the country weather
    final response = await dio.get(
        url,
        queryParameters: {
          'key': URLS.weather_api_key,
          'q': latitude+","+longitude
        },
    );
    if(response.statusCode == 200){
      return {
        "description" : response.data['current']['condition']['text'],
        "temperature" : response.data['current']['temp_c'],
        "windSpeed" : response.data['current']['wind_kph'],
        "humidity" : response.data['current']['humidity'],
        "cloud" : response.data['current']['cloud']
      };
    }
  }
  catch(exception,stack){
    Fluttertoast.showToast(msg: 'Something went wrong');
  }

  return null;
}