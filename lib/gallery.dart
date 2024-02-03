
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}


class Paso extends StatelessWidget {
  const Paso(this.icon, this.text, this.separation, {super.key});
  final IconData icon;
  final String text;
  final double separation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: separation,),
        Icon(icon, size: 40,),
        Text(text, style: const TextStyle(fontSize: 18.0, fontFamily: "Montserrat", color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),

      ],
    );
  }
}

class _GalleryPageState extends State<GalleryPage> {
  String selectedDir = "null";
  pickDir() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.videos,
      Permission.photos,
      Permission.audio,
      Permission.manageExternalStorage,
    ].request();
    debugPrint(statuses[Permission.location].toString());

    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      debugPrint("User cancelled the picker!");
    }
    else {
      setState(() {
        selectedDir = selectedDirectory;
      });
      final prefs = await SharedPreferences.getInstance();
      debugPrint("Selected directory: $selectedDirectory");
      debugPrint("Saving in preferences...");
      await prefs.setString('photoDir', selectedDirectory.toString());
    }
  }
  @override
  void initState() {
    super.initState();
    checkPreferences();
  }
  checkPreferences() async {

    final prefs = await SharedPreferences.getInstance();
    debugPrint("PhotoDir: ${prefs.getString('photoDir')}");
    if(prefs.getString('photoDir') != null){
      setState(() {
        selectedDir = prefs.getString('photoDir')!;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Paso(Icons.looks_one_rounded, 'Acepta los permisos de almacenamiento', 0),
            const Paso(Icons.looks_two_rounded, 'Escoge la carpeta donde tienes almacenadas tus fotos', 24),
            const SizedBox(height: 18,),
            FilledButton(onPressed: pickDir, child: const Text('¡Claro!')),
            Text('Directorio seleccionado: $selectedDir')
          ],
        ),
      ),
    );
  }
}
