import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem_finder_mobile/view/list_view/grid_view.dart';
import 'package:gem_finder_mobile/view/list_view/list_view.dart';
import 'package:gem_finder_mobile/view/side_menu/side_menu.dart';
import 'package:gem_finder_mobile/view/sign_up/sign_up_view.dart';
import 'package:gem_finder_mobile/view/store_details_view.dart';
import 'package:gem_finder_mobile/view/user/user_details_view.dart';
import 'package:gem_finder_mobile/view/widgets/gallery_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this will keep track of the current page index

bool smart = false;
  double temperature;
  String lastSeen;
  Color smartColor = Colors.blueGrey;
   Color smartColor2 = Colors.white;
   List<String> filteredStones = ['sensor_1','sensor_2','sensor_3','sensor_4','sensor_5','sensor_6','sensor_7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: SideMenu(), 
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                    SizedBox(height: 70.0),

          Ink(
            decoration: ShapeDecoration(
              color: smartColor,
              shape: CircleBorder(),
            ),
            child: IconButton(
              iconSize: 80,
              icon: Icon(Icons.lightbulb_outline),
              color: 
              smartColor2,
              onPressed: () {
                setState(() {
                  if (!smart) {
                    smartColor = Colors.lightGreen;
                  } else {
                    smartColor = Colors.blueGrey;
                  }
                  smart = !smart;
                });
              },
            )
            ),
SizedBox(
                        height: 10.0,
                      ),
            Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(30.0),
            itemCount: filteredStones.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14,0,0,0),
                        child: Row(
                          children: [
                            Expanded(
                                                          child: Text(
                                filteredStones[index],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:18.0),
                              child: Ink(
                                decoration: ShapeDecoration(
              color: Colors.blue,
              shape: CircleBorder(),
            ),
                                child: IconButton(icon: Icon(FontAwesomeIcons.tint), onPressed: null, iconSize: 35, color: Colors.pink)),
                            ),

                            Ink(
                              decoration: ShapeDecoration(
              color: index == 1 ? Colors.orangeAccent : index == 2 ? Colors.yellowAccent : index == 4 ? Colors.lightGreen : Colors.lightGreen,
              shape: CircleBorder(),
            ),
                              child: IconButton(icon: Icon(Icons.info), onPressed: _notific, iconSize: 35)),
                                                        
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                  
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      ],
                                      
                                    ),
                                  )
                                  );
                                }
                              

    FlutterLocalNotificationsPlugin pl = new FlutterLocalNotificationsPlugin();
    var settA;
    var settIos;
    var sett;


    
        Future<void> _notific() async {

          var aSpec = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription',
          importance: Importance.max,
          priority: Priority.high
          );
          var iosSpec = IOSNotificationDetails();
          var channel = NotificationDetails(android: aSpec, iOS: iosSpec);
    await pl.show(0, 'sensor_2 here!', "I need glass of water", channel); 
      }
    
   
}


