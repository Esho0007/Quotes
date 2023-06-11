import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/pages/login_page.dart';
import 'package:quote_app/pages/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Quotes',style: GoogleFonts.abel(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 2
        ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/inspire.png',color: Colors.white,),
              const Spacer(),
              RichText(
                text: TextSpan(
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                    children: [
                      const TextSpan(text: 'Get \n'),
                      TextSpan(
                        text: 'Motivated',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      ),
                    ],),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),),);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                      color: Colors.blue[400]),
                  child: Center(child: Text('Let Go...',style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),),),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
