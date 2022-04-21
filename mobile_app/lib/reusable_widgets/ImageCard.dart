import 'package:flutter/material.dart';
import 'data.dart';
class ImageCard extends StatelessWidget {
  final Data data;
  const ImageCard({Key? key, required this.data})
      : assert(data!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // child: Image.network(
      //   'https://placeimg.com/640/480/any',
      //   fit: BoxFit.fill,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}


