import 'package:flutter/material.dart';
import 'package:myfirst/Page6.dart';
void main(){
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Farmprofile()
  ) );
}

class Farmprofile extends StatefulWidget {
  const Farmprofile({super.key});

  @override
  State<Farmprofile> createState() => _FarmprofileState();
}

class _FarmprofileState extends State<Farmprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 38,),
        // IconButton(
        //   icon: const Icon(Icons.arrow_back), // Back button icon
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyApp2()),
        //     );
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_rounded),
            onPressed: (){

            },
            color: Colors.black,


          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: (){},

          ),
          Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // <-- Open the drawer
                  },


                );
              }
          ),
        ],
      ),
      body: Container(

      padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundImage:AssetImage("assets/images/farmer_facei.png"),
                ),
                Column(
                  children: [
                    Text("username",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),),
                    Text("username@gmail.com",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    SizedBox(height: 4,),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                        backgroundColor: Color(0x9017FF1E),
                      ),
                        onPressed: (){}, child: Text("Edit Profile",style: TextStyle(color: Colors.black),),

                      ),


                  ]

                )
              ],
            ),
              SizedBox(height: 23,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(

                  children: [
                    SizedBox(width: 45,),
                    Icon(Icons.favorite_outline),
                    SizedBox(width: 12,),
                    Text("Favourites",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 119,),
                    Icon(Icons.arrow_right_outlined,size: 20,)

                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),

            InkWell(
              onTap: (){},
              child: Container(
                child: Row(

                  children: [
                    SizedBox(width: 45,),
                    Icon(Icons.download,),
                    SizedBox(width: 12,),
                    Text("Downloads",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 115,),
                    Icon(Icons.arrow_right_outlined,size: 20,)

                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.black
              ),

            ),
            SizedBox(height: 12,),


            Container(
              child: Row(
                children: [
                  SizedBox(width:49,),
                  Icon(Icons.language),
                  SizedBox(width: 12,),
                  Text("Language" ,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                  SizedBox(width: 118,),
                  Icon(Icons.arrow_right_outlined,size: 20,)

                ],
              )
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49,),
                    Icon(Icons.location_on),
                    SizedBox(width: 12,),
                    Text("Location",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 124,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49,),
                    Icon(Icons.history),
                    SizedBox(width: 12,),
                    Text("History",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 132,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                    
                  ],
                ),
                
              ),
            ),
            SizedBox(height:12),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49,),
                    Icon(Icons.payment),
                    SizedBox(width: 12,),
                    Text("Payments",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 118,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(height:12),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49),
                    Icon(Icons.help_outline),
                    SizedBox(width: 12,),
                    Text("Help",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 147,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49,),
                    Icon(Icons.settings),
                    SizedBox(width: 12,),
                    Text("Settings",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 129,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 49),
                    Icon(Icons.share),
                    SizedBox(width: 12,),
                    Text("Share",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 142,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                  ],
                ),
              ),
            )
            ,SizedBox(height: 12,),
            InkWell(
              onTap: (){},
              child: Container(
                child: Row(

                  children: [
                    SizedBox(width: 49,),
                    Icon(Icons.logout),
                    SizedBox(width: 12,),
                    Text("Logout",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
                    SizedBox(width: 136,),
                    Icon(Icons.arrow_right_outlined,size: 20,)
                    
                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );

  }
}
