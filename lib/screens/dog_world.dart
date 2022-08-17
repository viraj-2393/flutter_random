
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

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}