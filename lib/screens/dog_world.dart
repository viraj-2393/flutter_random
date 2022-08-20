
import 'package:ambibuzz/controller/breed_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/breed_tile.dart';

class DogWorld extends StatefulWidget{

  @override
  State<DogWorld> createState() => _DogWorldState();
}

class _DogWorldState extends State<DogWorld>{
  BreedController? breedController;
  bool isLoading = false;

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
                    setState((){
                      isLoading = true;
                    });
                    breedController!.getBreedData(value).then((e)=> setState((){isLoading = false;}));
                  }
                },
              ),
               isLoading ?
                   const SizedBox(
                     height: 200,
                     width: 200,
                     child: Center(
                       child: CupertinoActivityIndicator(),
                     ),
                   ) :
                   !breedController!.breedInfoList.isEmpty ?
                       Column(
                         children: [
                           ...List.generate(breedController!.breedInfoList.length, (index) {
                             return BreedTile(
                                 index: index,
                                 breedController: breedController
                             );
                          })
                         ],
                       ) : Container(
                             height: 100,
                             child: Center(
                               child: Text('No match found...'),
                             ),
                           )

            ],
          ),
        ),
      ),
    ));
  }
}