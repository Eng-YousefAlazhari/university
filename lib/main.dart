
import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  int activeIndex = 0 ; 

  void click(int index) {
    setState(() {
      activeIndex = index ; 
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> myBody = [
      Home(), 
      myBodyContiner(color: Colors.green,) , 
      myBodyContiner(color: Colors.blue,) , 
      myBodyContiner(color: Colors.black,) , 
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('WISHLIST' ,style: TextStyle(
            fontWeight:FontWeight.w400,
            fontSize: 30,
          ),),
        ),
         body: Center(child: myBody[activeIndex]),

         bottomNavigationBar: Container(
          padding: EdgeInsets.all(12),
          color: Colors.transparent , 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 227, 227) , 
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  
                  MyIconButton(icon: Icons.home, index: 0, active: activeIndex, onclick: (){
                    click(0) ; 
                  } ),
                  MyIconButton(icon: Icons.search, index: 1, active: activeIndex, onclick: (){
                    click(1);
                  } ),
                  MyIconButton(icon: Icons.favorite, index: 2, active: activeIndex, onclick: ()=> click(2) ),
                  MyIconButton(icon: Icons.person, index: 3, active: activeIndex, onclick:()=>  click(3) ),
                ],
              ),
            ) ,
          ),

         ),
         
      ),
    );
  }
}


class MyIconButton extends StatelessWidget {
  final IconData icon ; 
  final int index ; 
  final int active ; 
  final Function() onclick ; 
  const MyIconButton({super.key , required this.icon , 
  required this.index , required this.active , 
  required this.onclick,});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onclick, icon: Icon(icon , color: index == active ? const Color.fromARGB(255, 176, 39, 39) : Colors.grey,),) ;
  }
}


class myBodyContiner extends StatelessWidget {
  final Color color ; 
  const myBodyContiner({super.key , required this.color,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: 200,
      child: Text('Flutter '),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 150,
                       height: 200,
                        decoration:BoxDecoration(
                      color: Colors.cyan, 
                      borderRadius: BorderRadius.circular(20) ,
                      image: DecorationImage(image:AssetImage('assets/images/img.jpg') , fit: BoxFit.cover),
                    ) ,), 
                    Positioned( top: 0 , right: 0, child:  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, color: Colors.red,)),),
                  ],
                ), 
              ],
            )
          ],)
        ],
      ),
    );
  }
}