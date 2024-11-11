import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imagePath;

  // Datos estáticos para el perfil
  String occupation = "Student at Celaya Tec";
  String email = "l19031439@celaya.tecnm.mx";
  String phone = "461 382 9052";
  String git = "https://github.com/lfernandanavar";

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final ImageSource? selectedSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Seleccionar imagen", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            TextButton(
              child: Text("Cámara"),
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
            ),
            TextButton(
              child: Text("Galería"),
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );

    if (selectedSource != null) {
      final pickedFile = await picker.pickImage(source: selectedSource);
      setState(() {
        imagePath = pickedFile?.path;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'No se pudo abrir el correo';
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'No se pudo abrir el teléfono';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Perfil", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Esto permite desplazamiento si es necesario
        child: Column(
          children: [
            // Imagen de perfil ocupando la mitad de la pantalla
            GestureDetector(
              onTap: _selectImage,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5, // Imagen a media pantalla
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imagePath != null
                        ? FileImage(File(imagePath!))
                        : AssetImage('assets/foto.png') as ImageProvider,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Ocupación estilizada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                occupation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: 1.2, // Espaciado de letras
                ),
              ),
            ),
            SizedBox(height: 30),

            // Botón de Follow
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () => _launchURL(git),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "FOLLOW",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Fila de iconos de contacto sin texto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContactIcon(Icons.email, _launchEmail),
                SizedBox(width: 40),
                _buildContactIcon(Icons.phone, _launchPhone),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear los iconos de contacto con efectos al presionar
  Widget _buildContactIcon(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}
