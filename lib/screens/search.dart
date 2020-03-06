import 'package:Eventory/screens/supplier_info.dart';
import 'package:flutter/material.dart';
import 'package:Eventory/util/const.dart';
import 'package:Eventory/util/suppliers.dart';
import 'package:Eventory/widgets/smooth_star_rating.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AutomaticKeepAliveClientMixin<SearchScreen>{
  
  final TextEditingController _searchControl = new TextEditingController();

  String _selectedDate = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),

          Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "What supplier do you need?",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),

          Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(

                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                          "   Needed on:  " + _selectedDate,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )
                      ),
                      onTap: (){
                        _selectDate(context);
                      },
                    ),
                    
                    Expanded(
                      child:
                      IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                    ),
                  ],
                ),      
            ),
          ),

        SizedBox(height: 5.0),

        Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Search Results",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: suppliers == null ? 0 :suppliers.length,
            itemBuilder: (BuildContext context, int index) {
              Map supplier = suppliers[index];
              return ListTile(
                title: Text(
                  "${supplier['name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    "${supplier['img']}",
                  ),
                ),
                trailing: Text(supplier['srate']), //must change

                subtitle:
                Row(
                  children: <Widget>[
                    
                Text(
                  "${supplier['scategory']}",
                  style: TextStyle(
                    fontSize: 12.0,
              ),
              maxLines: 2,
            ),

            SizedBox(width: 6.0),

                    SmoothStarRating(
                      starCount: 5, //must change
                      color: Constants.ratingBG,
                      allowHalfRating: true,
                      rating: 5.0, //must change
                      size: 12.0, //must change
                    ),
                    SizedBox(width: 6.0),
                    
                    Text(
                      "5.0", //must change
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                  ],
                ),
                onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return SupplierInfo();
            },
          ),
        );
      },
              );
            },
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}