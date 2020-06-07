import 'package:WOW/AboutDialogDemo.dart';
import 'package:WOW/ExpandedDemo.dart';
import 'package:WOW/Introduction.dart';
import 'package:WOW/SafeAreaDemo.dart';
import 'package:WOW/entity/WidgetModel.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WOW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter WOW'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var widgetImages = <String>[
    "images/index.webp",
    "images/widget1.webp",
    "images/widget2.webp",
    "images/widget83.webp",
    ];

  var titles = <String>[
    "Introducing Widget of the Week!",
    "SafeArea",
    "Expanded",
    "AboutDialog"
  ];

  var subtitles = <String>[
    "Flutter",
    "Google developments"
  ];

  List<WidgetModel> widgetModels = List();

  _onPressed(int index) {
    switch (index) {
      case 0:
        _goToIntroduction();
        break;
      case 1:
        _goToSafeArea();
        break;
      case 2:
        _goToExpanded();
        break;
      case 3:
        _goToAboutDialog();
        break;
      default:
    }
  }


  _goToIntroduction() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Introduction();
    }));
  }

  _goToSafeArea() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SafeAreaDemo();
    }));
  }

  _goToExpanded() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ExpandedDemo();
    }));
  }

  _goToAboutDialog() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutDialogDemo();
    }));
  }


  @override
  void initState() {
    super.initState();
    this.widgetModels.add(WidgetModel(widgetImages[0], titles[0], subtitles[0]));
    this.widgetModels.add(WidgetModel(widgetImages[1], titles[1], subtitles[0]));
    this.widgetModels.add(WidgetModel(widgetImages[2], titles[2], subtitles[0]));
    this.widgetModels.add(WidgetModel(widgetImages[3], titles[3], subtitles[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Scrollbar(
          child: ListView.builder(
            itemBuilder: (context, int index) {
              return FlatButton(
                onPressed: () {
                  _onPressed(index);
                },
                padding: EdgeInsets.all(0.0), 
                child: Container(
                  padding: EdgeInsets.only(left: 8.0, top: 10, right: 16.0, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text((1 + index).toString(), style: TextStyle(fontSize: 14, color: Colors.grey),),
                      ),
                      Image.asset(this.widgetModels[index].image, width: 120, fit: BoxFit.fitWidth,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(this.widgetModels[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(this.widgetModels[index].subtitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),),
                          )
                        ],
                      )
                    ],
                  ),
                )
              );  
            },
            itemCount: widgetImages.length,
          )
        ),
      ),
    );
  }
}
