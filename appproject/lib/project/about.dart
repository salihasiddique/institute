import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AboutUs(),
    debugShowCheckedModeBanner: false,
  ));
}

class AboutUs extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1488998527040-85054a85150e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      "About Us",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ListTile(
                            title: Text(
                              "A Classical Education for the Future",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "IMAT global is committed to providing students with comprehensive support and guidance as they embark on their journey to study abroad. With a dedicated team of experienced counselors and education experts, we aim to make the process seamless and rewarding for each student, recognizing that studying abroad is a transformative experience.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.only(top: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact Us",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "34/740 A, Amana Plaza, Metro Pillar NO:387, \nEdappally Toll, Ernakulam,\n Kerala 682024",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      SizedBox(width: 8),
                                      Text("+91 9539388444"),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.mail),
                                      SizedBox(width: 8),
                                      Text("imatenquiry@gmail.com"),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Send us a message",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Form(
                                          key: _formKey,
                                          child:Container(
                                            width: 300,
                                            height: 400,
                                            margin: EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "Name",
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "Email id",
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "Subject",
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "Message",
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!.validate()) {
                                                        // Handle form submission
                                                      }
                                                    },
                                                    child: Text("Send"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),


                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
