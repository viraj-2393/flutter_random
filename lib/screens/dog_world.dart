
import 'package:ambibuzz/controller/breed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogWorld extends StatefulWidget{

  @override
  State<DogWorld> createState() => _DogWorldState();
}

class _DogWorldState extends State<DogWorld>{
  BreedController? breedController;

  @override
  initState(){
    super.initState();
    breedController = BreedController();
  }
  @override
  Widget build(BuildContext context){
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text('Search Dog Breed'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter dog breed...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                onChanged: (value){
                  if(value.length > 3){
                    breedController!.getBreedData(value);
                  }
                },
              ),
              ...List.generate(breedController!.breedInfoList.length, (index){
                return ListTile(
                  leading: Image.network(
                    breedController!.breedInfoList[index].referenceImageId ?? '',
                    errorBuilder: (context, exception, stackTrace){
                      return Image.asset(
                        "assets/images/not_found.png",
                        width: 90,
                      );
                    },
                  ),
                  title: Text(breedController!.breedInfoList[index].name ?? 'Name not found') ,
                  subtitle: Text(breedController!.breedInfoList[index].origin ?? 'Origin not mentioned.'),
                );
              })
            ],
          ),
        ),
      ),
    ));
  }
}