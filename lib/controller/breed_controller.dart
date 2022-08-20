

import 'package:ambibuzz/apis/dog_world_api.dart';
import 'package:ambibuzz/models/BreedInfo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BreedController extends GetxController{
  RxList<BreedInfo> breedInfoList = <BreedInfo>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getBreedData(String query) async{
    List<BreedInfo>?  breedInfo = await getBreedInfo(query);
    if(breedInfo != null){
      breedInfoList.clear();
       for(int i=0; i<breedInfo.length; i++){
         breedInfoList.add(breedInfo[i]);
       }
    }
  }

  Future<String> getBreedImageData(String imageId) async{
    Fluttertoast.showToast(msg: 'Loading please wait...');
    String imgLink = await getBreedImage(imageId);
    return imgLink;
  }
}