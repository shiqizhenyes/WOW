import 'package:WOW/AboutDialogDemo.dart';
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

  _onPressed(int index) {
    switch (index) {
      case 3:
        _goToAboutDialog();
        break;
      default:
    }
  }

  _goToAboutDialog() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutDialogDemo();
    }));
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
                      Image.asset(this.widgetImages[index], width: 120, fit: BoxFit.fitWidth,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(this.titles[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(this.subtitles[0], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),),
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
