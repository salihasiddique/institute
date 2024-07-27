
import 'package:curve_clipper/curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch_clipper/flutter_switch_clipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';

import 'Registration.dart';
import 'forgot_password.dart';
import 'languages.dart';
import 'login.dart';
import 'medias.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primaryColor = Colors.red;
  final List<Service> services = [
    Service(title: "Career Counseling", icon: Icons.school),
    Service(title: "Interview Training", icon: Icons.person),
    Service(title: "Visa Documentation", icon: Icons.description),
    Service(title: "Accommodation", icon: Icons.home),
    Service(title: "Language Training", icon: Icons.language),
    Service(title: "Pre-Departure Briefing", icon: Icons.info),
    Service(title: "Placement Support", icon: Icons.work),
    Service(title: "Bank Loan Assistance", icon: Icons.attach_money),
    Service(title: "Course Selection", icon:Icons.book),
    Service(title: "Scholarship Assistance", icon: Icons.emoji_events),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1574717025058-2f8737d2e2b7?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomClipperWidget(
                    mode: ClipperMode.wavy,
                    heightFromOrigin: 160,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Smart Learning Hub",
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.white30,
                          child: ListTile(
                            leading: Icon(
                              Icons.video_collection_outlined,
                              size: 60,
                              color: Colors.white60,
                            ),
                            contentPadding: EdgeInsets.all(16.0),
                            title: GradientText(
                              text: "Media",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black,
                                  Colors.redAccent,
                                  Colors.red
                                ],
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Medias()));
                              },
                              child: Text(
                                "More details",
                                style: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.white30,
                          child: ListTile(
                            leading: Icon(Icons.language,
                                size: 60, color: Colors.white60),
                            contentPadding: EdgeInsets.all(16.0),
                            title: GradientText(
                              text: "Language",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black,
                                  Colors.redAccent,
                                  Colors.red
                                ],
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Languages()));
                              },
                              child: Text(
                                "More details",
                                style: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Services",
                          style: TextStyle(color: Colors.white54, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ServiceList(service: services[index]);
                      },
                      childCount: services.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class Service {
  final String title;
  final IconData icon;

  Service({required this.title, required this.icon});
}

class ServiceList extends StatelessWidget {
  final Service service;

  ServiceList({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54
      ),
    child:
      Card(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(service.icon,size: 30,color: Colors.white,),
          SizedBox(height: 10),
          SwitchCipper(
            enableWhenAnimating: false,
              child: Text(service.title,
                style:GoogleFonts.aBeeZee(textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                    height: 2
                ) ),),
              background: Text(service.title,
                style:GoogleFonts.aBeeZee(textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    height: 2
                ) ),),
            curve: Curves.slowMiddle,
            reverseCurve: Curves.linear,
          ),
        ],
      ),
    )
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle style;

  const GradientText({
    Key? key,
    required this.text,
    required this.style,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
