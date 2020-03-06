import 'package:flutter/material.dart';
import 'package:Eventory/util/eventlist.dart';
import 'package:Eventory/util/suppliers.dart';
import 'package:Eventory/widgets/home_list.dart';
import 'package:Eventory/widgets/event_format.dart';
import 'package:Eventory/screens/create_event.dart';

class EventlistScreen extends StatefulWidget {
  @override
  _EventlistScreenState createState() => _EventlistScreenState();
}

class _EventlistScreenState extends State<EventlistScreen> {

  String currentCat = "Birthday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Events",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 5.0),
            
            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: eventlist == null?0:eventlist.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = eventlist[index];
                  return EventFormat(
                    icon: cat['icon'],
                    title: cat['name'],
                    scount: cat['scount'].toString(),
                    isHome: false,
                    tap: (){
                      setState((){currentCat = "${cat['name']}";});
                    },
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "$currentCat",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child:
                  Text(
                    "+ Add Event",
                    style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return NewEvent();
                        },
                      ),
                    );
                  },
                ),
              ],
             ),

            Divider(),
            
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: suppliers == null ? 0 :suppliers.length,
              itemBuilder: (BuildContext context, int index) {
                Map supplier = suppliers[index];
                return GridProduct(
                  img: supplier['img'],
                  isFav: false,
                  name: supplier['name'],
                  scategory: supplier['scategory'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}