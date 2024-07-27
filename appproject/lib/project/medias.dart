import 'package:appproject/project/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';
import 'Registration.dart';
import 'forgot_password.dart';
import 'home_page.dart';
import 'login.dart';
import 'media_Details.dart';
import 'model/media_list.dart';
void main() {
  runApp(MaterialApp(
    home: Medias(),
    debugShowCheckedModeBanner: false,
  ));
}
class Medias extends StatefulWidget {
  const Medias({super.key});
  @override
  State<Medias> createState() => _MediasState();
}

class _MediasState extends State<Medias> {
  Color primaryColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading:
        IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>bottom_nav()));
        }, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Text("Media",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: medias.length,
        itemBuilder: (context, index) {
          final media = medias[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MediaDetails(media: media),
                ),
              );
            },
            child:
            Container(
              child:Padding(padding:EdgeInsets.all(8.0),
                child:Card(
                //  color: Colors.white24,
                    shadowColor: Colors.red,
                    elevation: 4.6,
                    child: Row(
                      children: [
                        Image.asset(media.image,width: 100,height: 100,),
                        Column(
                          children: [
                            Text(media.name,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(width: 20,),
                                Text("Duration  ${media.duration}"),
                              ],),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Icon(Icons.note_add_sharp),
                                SizedBox(width: 20,),
                                Text("14 lessons 6 modules"),

                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                )
              ),
            )
          );
        },
      ),
    );
  }
}
