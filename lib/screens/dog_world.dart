
import 'package:flutter/material.dart';

class DogWorld extends StatefulWidget{

  @override
  State<DogWorld> createState() => _DogWorldState();
}

class _DogWorldState extends State<DogWorld>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Dog Breed'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}