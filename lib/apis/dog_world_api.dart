

import 'package:ambibuzz/constants/url_constants.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/BreedInfo.dart';

Future<List<BreedInfo>?> getBreedInfo(String query) async{
  Dio dio = Dio();
  String url = URLS.breed_search;

  try{
    //call to the api to get info related to the breed
    final response = await dio.get(
        url,
        queryParameters: {
          'q': query,
          'limit': 6
        },
        options: Options(headers: {
           'x-api-key': URLS.api_key
        },
        ),

    );
    if(response.statusCode == 200){
      List<BreedInfo> breedInfo = [];
      for(int i=0; i<response.data!.length; i++){
        breedInfo.add(BreedInfo.fromJson(response.data[i]));
      }
      return breedInfo;
    }
  }
  catch(exception){
   // Fluttertoast.showToast(msg: 'Something went wrong');
  }

  return null;
}

Future<String> getBreedImage(String imageId) async{
  Dio dio = Dio();
  String url = URLS.breed_image+imageId;

  try{
    //call to the api to get info related to the breed image
    final response = await dio.get(
      url,
      options: Options(headers: {
        'x-api-key': URLS.api_key
      },
      ),

    );

    if(response.statusCode == 200){
       return response.data["url"];
    }
  }
  catch(exception){
    Fluttertoast.showToast(msg: 'Something went wrong');
  }

  return "";
}