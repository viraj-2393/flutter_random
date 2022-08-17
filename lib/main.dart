import 'package:ambibuzz/screens/dog_world.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _buildFeatureTile(Color color,String iconName, String buttonName){
    return ListTile(
      tileColor: color,
      textColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      leading: Image.asset(
        iconName,
        errorBuilder: (context, exception, stackTrace) {
          return Image.asset(
            "assets/images/not_found.png",
            width: 90,
          );
        },
      ),
      title: Text(buttonName),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: _buildFeatureTile(Colors.pink, 'assets/images/dog_icon.png', "The Dogs World!"),
              onTap: (){
                Get.to(() => DogWorld());
              },
            ),
            const SizedBox(height: 10,),
            InkWell(
              child: _buildFeatureTile(Colors.redAccent, 'assets/images/countries.png', "Countries of the World"),
              onTap: (){},
            ),
            const SizedBox(height: 10,),
            InkWell(
              child: _buildFeatureTile(Colors.greenAccent, 'assets/images/globe.png', "Our Globe"),
              onTap: (){},
            ),
            const SizedBox(height: 10,),
            InkWell(
              child: _buildFeatureTile(Colors.cyan, 'assets/images/task.png', "Task Organiser"),
              onTap: (){},
            )

          ],
        ),
      )
    );
  }
}
