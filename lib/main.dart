
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _homepageState();
}

class _homepageState extends State<Homepage> {
  var scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: drawerData ,
      body:
      MediaQuery.of(context).size.width > 800?
      Column(
        children: [
          customAppBar(context),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                drawerData
                ,
                Expanded(
                    flex: 5,
                    child:
                Container(
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child:bodyData
                )
                )
              ],
            ),
          ),

        ],
      ):

          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.white ,
            child: Column(
              children: [customAppBar(context),
              Expanded(child: bodyData)],
            ),
          )
    );
  }

Widget get drawerData =>  Container(
    height: double.maxFinite,
    width: 250,
    decoration:  BoxDecoration(
        color: Colors.grey.shade50,
        boxShadow: [BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 5,
            color: Colors.grey,
            spreadRadius: 3
        )]

    ),
    child:const Padding(
  padding: EdgeInsets.all(6.0),
  child: SingleChildScrollView(
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),ListTile(
          leading: Icon(Icons.online_prediction_rounded),
          title: Text('Order'),
        ),ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification'),
        ),ListTile(
          leading: Icon(Icons.person),
          title: Text('Users'),
        ),ListTile(
          leading: Icon(Icons.category),
          title: Text('Categories'),
        ),ListTile(
          leading: Icon(Icons.production_quantity_limits),
          title: Text('Products'),
        ),
      ],
    ),
  ),
    )
);

  Widget get bodyData =>  SingleChildScrollView(
    child: Column(
      children: [
        ... List.generate(10, (index) =>   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey.shade100,
            child: const ListTile(
              leading: CircleAvatar(
                radius: 25,
              ),
              title: Text('Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing'),
              subtitle: Text('Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ))

      ],
    ),
  );

  Widget  customAppBar(context)=> Container(
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey.shade50,
        boxShadow: [BoxShadow(
            offset: Offset(0, 0),
            blurRadius:5,
            color: Colors.grey,
            spreadRadius: 3
        )]
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          if(MediaQuery.of(context).size.width < 800)
            IconButton(onPressed: (){
              scafoldKey.currentState?.openDrawer();
            }, icon: Icon(Icons.menu)),
          const Expanded(
            child: Text("Admin Panel",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),)
        ],
      ),
    ),
  );
}
