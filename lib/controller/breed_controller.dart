

import 'package:ambibuzz/apis/dog_world_api.dart';
import 'package:ambibuzz/models/BreedInfo.dart';
import 'package:get/get.dart';

class BreedController extends GetxController{
  RxList<BreedInfo> breedInfoList = <BreedInfo>[].obs;

  void getBreedData(String query) async{
    List<BreedInfo>?  breedInfo = await getBreedInfo(query);
    if(breedInfo != null){
      breedInfoList.clear();
       for(int i=0; i<breedInfo.length; i++){
         breedInfoList.add(breedInfo[i]);
       }
    }
  }
}