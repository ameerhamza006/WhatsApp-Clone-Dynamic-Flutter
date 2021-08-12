import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presention/pages/calls_page.dart';
import 'package:flutter_whatsapp_clone/presention/pages/camera_page.dart';
import 'package:flutter_whatsapp_clone/presention/pages/chat_page.dart';
import 'package:flutter_whatsapp_clone/presention/pages/status_page.dart';
import 'package:flutter_whatsapp_clone/presention/widgets/theme/custom_tab_bar.dart';
import 'package:flutter_whatsapp_clone/presention/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 bool _isSearch = false;

 int _currentPageIndex=1;
 PageController _pageViewController= PageController(initialPage: 1);
 List<Widget> _pages = [CameraPage(),ChatPage(),StatusPage(),CallsPage()];

 _buildSearch(){
   return Container(
     height: 45,
     margin: EdgeInsets.only(top: 40),
     decoration: BoxDecoration(
       color: Colors.white,
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(.3),
           spreadRadius: 1,
           offset: Offset(0.0,0.50),
         ),
       ]
     ),
     child: TextField(
       decoration: InputDecoration(
         hintText: "Search...",
         prefixIcon: InkWell(
           onTap: () {
             setState(() {
               _isSearch = false;
             });

           },
           child: Icon(Icons.arrow_back),
         ),
       ),
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0? AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: _isSearch == false? primaryColor: Colors.transparent,
        title: _isSearch == false?Text("WhatsApp Clone"): Container(height: 0.0, width: 0.0,),
        flexibleSpace: _isSearch == false? Container(height: 0.0, width: 0.0,): _buildSearch(),
        actions: <Widget>[
          InkWell(
              onTap: (){
                setState(() {
                  _isSearch = true;
                });
              },
              child: Icon(Icons.search)),
          SizedBox( width: 5, ),
          Icon(Icons.more_vert)
        ],
      ): null,
      body: Column(
        children: <Widget>[
          _isSearch == false? _currentPageIndex != 0? CustomTabBar(index : _currentPageIndex):
          Container(width: 0.0, height: 0.0,): Container(width: 0.0, height: 0.0,),
          Expanded(
              child: PageView.builder(
                itemCount: _pages.length,
                controller: _pageViewController,
                onPageChanged: (index){
                  setState(() {
                    _currentPageIndex=index;
                  });
                },
                itemBuilder: (_,index){
                  return _pages[index];
                },
              ),
          ),
        ],
      ),
    );
  }
}
