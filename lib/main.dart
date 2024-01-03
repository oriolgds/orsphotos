import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// All pages
import 'homePage.dart' as home_page;
import 'gallery.dart' as galery_page;
import 'cloud.dart' as cloud_page;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ors Photos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: const MyHomePage(title: 'Ors Photos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  void changeSelectedIndex(value){
    setState(() {
      selectedIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: [
        home_page.HomePage(changeIndex: changeSelectedIndex,),
        const galery_page.GalleryPage(),
        const cloud_page.CloudPage()
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.orange.shade50,
        onDestinationSelected: (int index) {
          changeSelectedIndex(index);
        },
        indicatorColor: Colors.greenAccent,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.photo_library),
            icon: Icon(Icons.photo_library_outlined),
            label: 'Galeria',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.cloud),
            icon: Icon(Icons.cloud_outlined),
            label: 'En la nube',
          ),
        ],
      ),
    );
  }
}

class HDrawer extends StatelessWidget {
  const HDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text('Ors Photos')
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            onTap: (){
              Navigator.of(context).pop();
            },
            title: const Text('Acerca de'),
          )
        ],
      ),
    );
  }
}

