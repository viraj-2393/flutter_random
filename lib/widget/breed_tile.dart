
import 'package:ambibuzz/constants/url_constants.dart';
import 'package:ambibuzz/controller/breed_controller.dart';
import 'package:flutter/material.dart';

class BreedTile extends StatefulWidget{
  BreedController? breedController;
  int index;
  BreedTile({
    required this.breedController,
    required this.index
  });
  @override
  State<BreedTile> createState() => _BreedTileState();
}

class _BreedTileState extends State<BreedTile>{
  String imgLink = "";
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imgLink,
        errorBuilder: (context, exception, stackTrace) {
          return IconButton(
            icon: Icon(Icons.downloading),
            onPressed: () {
              widget.breedController!.getBreedImageData(
                  widget.breedController!.breedInfoList[widget.index]
                      .referenceImageId.toString()
              ).then((value) => setState((){imgLink = value;}));
            },
          );
        },
        width: 60,
      ),
      title: Text(widget.breedController!.breedInfoList[widget.index].name ??
          'Name not found'),
      subtitle: Text(
          widget.breedController!.breedInfoList[widget.index].origin ??
              'Origin not mentioned.'),
    );
  }
}