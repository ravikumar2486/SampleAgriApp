import 'package:flutter/material.dart';


void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData( // Light Theme
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.green[50],
        ),
        darkTheme: ThemeData( // Dark Theme
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.grey[900],
        ),
        themeMode: ThemeMode.system, // 🔥 Automatically switch based on system setting
        home: GovermentPoli(),
      ));
}
class GovermentPoli extends StatefulWidget {
  const GovermentPoli({super.key});

  @override
  State<GovermentPoli> createState() => _GovermentPoliState();
}

class _GovermentPoliState extends State<GovermentPoli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        leading: IconButton(

              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
              color: Colors.black,


            ),

              actions: [
              IconButton(
                icon: const Icon(Icons.chat_sharp),
                onPressed: (){

                },
                color: Colors.black,


              ),
              IconButton(
                icon: const Icon(Icons.ring_volume_outlined),
                onPressed: (){},

              ),
              IconButton(
                icon: const Icon(Icons.navigate_before_outlined),
                onPressed: () {},


              ),
          ],





        ),


      body:
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Goverment Policy',style:TextStyle(fontWeight: FontWeight.w600,fontSize:22),),
            InkWell(
              onTap: (){

              },
              child: Card(
                elevation: 6,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 80,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black,width: 2),
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.lightGreenAccent,
                     // color: Colors.lightGreenAccent,
                   ),
                  child: Column(
                    children: [
                      // Text("Fertilizer Subsidy",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      Text("Subsidy on fertilizers to maintain soil health and promote balanced use.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),),
                       Text( "last updated:March 2025",style: TextStyle(color: Colors.grey),),
                    ],
                  ),

                ),
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightGreenAccent,

              ),

            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightGreenAccent,

              ),

            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black,width: 2),
                color: Colors.lightGreenAccent,

              ),
            ),
            Container(
              height:80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightGreenAccent,
                    
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black,width: 2),
                color: Colors.lightGreenAccent,

              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightGreenAccent,

              ),
            )
          ],
        ),
      )




    );
  }
}
