import 'package:first_app/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import 'digital_watch_screen.dart';

void main() {
  CacheHelper.init();
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
      home: DigitalWatchScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Hi Hi";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 15), () {
      setState(() {
        title = "bye bye";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Home Page")),
      body: ListView(
        children: [
          Lottie.asset('assets/animations/bird_dart.json'),
          SizedBox(height: 400, child: WelcomeScreen(title: title))
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
                  // width = (width == 100 ? 300 : 100);
                  height = (height == 100 ? 300 : 100);
                  color = (color == Colors.blue ? Colors.pink : Colors.blue);
                  // fontSize = (fontSize == 12 ? 32 : 12);
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

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.title);
  }

  @override
  void didUpdateWidget(covariant WelcomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      print('Title has changed from ${oldWidget.title} to ${widget.title}');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
