import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Eventory/util/suppliers.dart';
import 'package:Eventory/widgets/favorite_list.dart';

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {

  final TextEditingController _eventControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Add Event",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: ()=>Navigator.pop(context),
          ),
        ],
      ),

      body:
      Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,130),
        child:
        ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            
            Text(
              " My Suppliers",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 20.0),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: suppliers == null ? 0 :suppliers.length,
              itemBuilder: (BuildContext context, int index) {

                Map supplier = suppliers[index];

                return CartItem(
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

bottomSheet:
        Card(
        elevation: 4.0,
        child: Container(

          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey[200],),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200],),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Event Name",
                      prefixIcon: Icon(
                        FontAwesomeIcons.calendarPlus,
                        color: Theme.of(context).accentColor,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 1,
                    controller: _eventControl,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(10,5,5,5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(5,5,10,5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Save".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: ()=>Navigator.pop(context),
                    ),
                  ),

                ],
              ),
            ],
          ),
          
          height: 130,

        ),
      ),
    );
  }
}