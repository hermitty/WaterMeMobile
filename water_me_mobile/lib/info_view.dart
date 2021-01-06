import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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

final List<DataItem> data = [

  DataItem("9:30", 20),
  DataItem("9:45", 18),
  DataItem("10:00", 17),
  DataItem("10:15", 15),
  DataItem("10:30", 99),
  DataItem("10:45", 96),
  DataItem("11:00", 92),
  DataItem("11:15", 90),
  DataItem("11:45", 87),
];
String dropdownValue = 'Now';
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: SideMenu(), 
    body: Column(
      children: [
        SizedBox(height: 50,),        
        Container(
          height:100,
          width: 375,
          child: Card(
            
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('sensor_1', style: TextStyle(fontSize:33)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text('50,0871278, 14,4176935'),
                    ],
                  ),
                ],
              )))),

        Container(
          height: 500,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Center(child: Text("Humidity"))),
                      DropdownButton(
                        onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
                        
                         items: <String>['Now', 'Today', 'Day', 'Week', 'Month', 'Year']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
                       value: dropdownValue,)
                    ],
                  ),
                  Expanded(
                    child: ChartView(data: data)),
                ],
              ),
            ))),
      ],
    )
    );
  }
}

class ChartView extends StatelessWidget {
  final List<DataItem> data;

  const ChartView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<charts.Series<DataItem, String>> series = 
    [
      charts.Series(id:"Humidity", data: data, 
      domainFn: (DataItem series, _) => series.date,
      measureFn: (DataItem series, _) => series.humidity
      )

    ];

    return Container(
      child: charts.BarChart(series),
    );
  }
}

class DataItem{
  final String date;
  final int humidity;
  DataItem(this.date, this.humidity); 
}