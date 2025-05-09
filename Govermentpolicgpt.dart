import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GovernmentPoliciesScreen(),
  ));
}

class GovernmentPoliciesScreen extends StatelessWidget {
  const GovernmentPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor:Color(0x9017FF1E),




          leading: IconButton(

            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,


          ),

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
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},


            ),
          ],








      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(

          children: [
            const SizedBox(height: 10),

            // 🔍 Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search policies...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.green[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 📄 List of Policies + Recommended Policies
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  // 🌾 General Policies Section
                  const Text(
                    "Government Policy",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  const FadeInPolicyCard(
                    title: "Crop Insurance Scheme",
                    description:
                    "Insurance coverage and financial support to farmers in case of crop failure due to natural calamities.",
                    lastUpdated: "April 2025",
                    detailedText:
                    "This scheme protects farmers from risks of crop loss due to floods, drought, pests, etc. It covers both Kharif and Rabi crops with minimal premium.",
                  ),



                  const SizedBox(height: 30),

                  // 🎯 Recommended Policies Section
                  const Text(
                    "Policy that matches your profile",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  _buildRecommendedPolicyCard(
                    context,
                    "Organic Farming Subsidy",
                    "Special incentives for farmers adopting organic farming methods.",
                    " lastUpdated: April 2025",
                  ),
                  _buildRecommendedPolicyCard(
                    context,
                    "Drip Irrigation Support",
                    "Government provides 70% subsidy on drip and sprinkler irrigation systems.",
                    " lastUpdated: April 2025",

                  ),
                  _buildRecommendedPolicyCard(
                    context,
                    "Seed Quality Improvement Scheme",
                    "Financial help to farmers for using high-quality certified seeds.",
                    " lastUpdated: April 2025",



                  ),

             ], ),
            ),
          ],
        ),
      ),
    );
  }

  // 🧱 Recommended Policies Card
  Widget _buildRecommendedPolicyCard(BuildContext context,String title, String description, String date,) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext) => PolicyDetailScreen(
                title: title,
                detailedText:description,
              ),
            ),
          );
        },
        child:Container(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 18),),
                SizedBox(height: 4,),

                Text("$description"),

                SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$date",style: TextStyle(color: Colors.grey),),
                    
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext) => PolicyDetailScreen(
                              title: title,
                              detailedText:description,
                            ),
                          ),
                        );
                      },
                      child: Text("Read More",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),),
                    ),


    ],
                )
              ],
            ),
          ),
        ),
        
      ),


    );

  }
}

// 🎯 Widget with Fade Animation
class FadeInPolicyCard extends StatefulWidget {
  final String title;
  final String description;
  final String lastUpdated;
  final String detailedText;

  const FadeInPolicyCard({
    super.key,
    required this.title,
    required this.description,
    required this.lastUpdated,
    required this.detailedText,
  });

  @override
  State<FadeInPolicyCard> createState() => _FadeInPolicyCardState();
}

class _FadeInPolicyCardState extends State<FadeInPolicyCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PolicyDetailScreen(
          title: widget.title,
          detailedText: widget.detailedText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(


          child: InkWell(
            onTap: () => _navigateToDetails(context),
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Updated: ${widget.lastUpdated}",
                          style: const TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () => _navigateToDetails(context),
                          child: const Text(
                            "Read More",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 📰 Detailed Policy Screen
class PolicyDetailScreen extends StatelessWidget {
  final String title;
  final String detailedText;

  const PolicyDetailScreen({
    super.key,
    required this.title,
    required this.detailedText,
  });

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              detailedText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("Apply Now",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 19),),



          ],
        ),
      ),
    );
  }
}
