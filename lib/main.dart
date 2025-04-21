import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      print("helo");
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.rotate,
          alignment: Alignment.center,
          duration: Duration(milliseconds: 1500),
          child: DetailsPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/bird_dart.json'),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => DetailsPage()),
            //     );
            //   },
            //   child: Hero(
            //     tag: 'logoHero',
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(8),
            //       child: Image.network(
            //         'https://beecrowd.com/wp-content/uploads/2024/04/2022-06-23-Flutter.jpg', // تأكد إن الصورة موجودة في assets
            //         width: 100,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double width = 100, height = 100, fontSize = 12;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page")),
      body: Center(
        child: Column(
          children: [
            Text(
              "hhgfhgfhghgfhfhfgh",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )
                .animate(
                  delay:
                      1000.ms, // this delay only happens once at the very start
                  onPlay: (controller) => controller.repeat(), // loop
                )
                .slideX(
                    begin: -1,
                    end: 0,
                    duration: Duration(seconds: 2),
                    delay: 1500.ms),
            Hero(
              tag: 'logoHero',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://css-tricks.com/wp-content/uploads/2022/08/flutter-clouds.jpg',
                  width: 300,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  width = (width == 100 ? 300 : 100);
                  height = (height == 100 ? 300 : 100);
                  color = (color == Colors.blue ? Colors.pink : Colors.blue);
                  fontSize = (fontSize == 12 ? 32 : 12);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                curve: Curves.easeInToLinear,
                width: width,
                height: height,
                decoration: BoxDecoration(color: color),
                child: Text(
                  "Hello",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
