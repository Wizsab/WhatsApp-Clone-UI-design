import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:whatsapp_clone/pages/call_screen.dart';
import 'package:whatsapp_clone/pages/camera_screen.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/status_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class WhatsAppHome extends StatefulWidget {

  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});


  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin{

      TabController _tabController;
      bool showFab = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }
  void _setTopping() {
        setState((){
          Fluttertoast.showToast(
              msg: "Open Contact List",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      }
      void _etTopping() {
        setState((){
          Fluttertoast.showToast(
              msg: "Open Search",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      }

      String dropdownValue;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.camera_alt)),
          new Tab(text: "CHATS"),
          new Tab(text: "STATUS"),
          new Tab(text: "CALLS"),
          ],
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search),
          onPressed: (){_etTopping();},),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
         new Container(

          child: new DropdownButton<String>(
             icon: Icon(Icons.more_vert, color: Colors.white,),
             style: TextStyle(
                 color: Colors.black
             ),

             underline: Container(
               height: 0,
               color: Colors.deepPurpleAccent,
             ),
             onChanged: (String newValue) {
               setState(() {
               });
             },
             items: <String>['New Group', 'New broadcast', 'WhatsApp Web', 'Starred messsages','Settings']
                 .map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             })
                 .toList(),
           ),
         )
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(Icons.message,
                          color: Colors.white,),
          onPressed: () {_setTopping();},
      )
          : null,
    );
  }
}
