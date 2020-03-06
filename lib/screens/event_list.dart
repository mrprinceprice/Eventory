import 'package:Eventory/util/eventlist.dart';
import 'package:flutter/material.dart';
import 'package:Eventory/widgets/event_format.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> with AutomaticKeepAliveClientMixin<EventsScreen >{

 List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),

            Container(
              height: 500.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: eventlist == null?0:eventlist.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = eventlist[index];
                  return EventFormat(
                    icon: cat['icon'],
                    title: cat['name'],
                    scount: cat['scount'].toString(),
                    isHome: true,
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
