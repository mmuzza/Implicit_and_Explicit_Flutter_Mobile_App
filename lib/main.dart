import 'package:flutter/material.dart';
import 'Animation1.dart';
import 'Animation2.dart';
import 'Animation3.dart';
import 'Animation4.dart';
import 'Animation5.dart';
import 'Animation6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> animations = ["Zooming IceCube", "Rolling Ball", "Bouncing Ball", "Zooming Globe", "Rocket Taking Off", "Spiderman"];
  String selectedAnimation = "";
  bool isListExpanded = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text('Animation App'),
        actions: [
          // Back button
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                isListExpanded = true;
                selectedAnimation = "";
              });
            },
          ),
        ],
      ),


      body: Row(


        children: [



          // Left-side widget
          Expanded(
            flex: selectedAnimation.isEmpty ? 4 : 1,
            child: ListView.builder(
              itemCount: animations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(animations[index]),
                  onTap: () {
                    setState(() {
                      selectedAnimation = animations[index];
                      isListExpanded = false;
                    });
                  },
                  selected: selectedAnimation == animations[index], // save the animation that was clicked on
                );
              },
            ),
          ),


          // Right side
          Expanded(
            flex: isListExpanded ? 0 : 3,
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: selectedAnimation.isNotEmpty
                    ? _buildDetailsWidgetForAnimation(selectedAnimation)
                    : Container(),
              ),
            ),
          ),


        ],
      ),
    );
  }


  Widget _buildDetailsWidgetForAnimation(String animationName) {
    Animation1 animation1 = Animation1(animationName);
    Animation2 animation2 = Animation2(animationName);
    Animation3 animation3 = Animation3(animationName);
    Animation4 animation4 = Animation4(animationName);
    Animation5 animation5 = Animation5(animationName);
    Animation6 animation6 = Animation6(animationName);

    Widget result;


    if (animationName == 'Zooming IceCube') {
      result = animation1;
    } else if (animationName == 'Rolling Ball') {
      result = animation2;
    } else if (animationName == 'Bouncing Ball') {
      result = animation3;
    } else if (animationName == 'Zooming Globe') {
      result = animation4;
    } else if (animationName == 'Rocket Taking Off') {
      result = animation5;
    } else {
      result = animation6;
    }

    return result;
  }

}

