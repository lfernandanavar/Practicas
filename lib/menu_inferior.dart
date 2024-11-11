import 'package:flutter/material.dart';
import 'package:practicas/perfil.dart'; // Asegúrate de importar el archivo de perfil

class MenuInferior extends StatefulWidget {
  @override
  _MenuInferiorState createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
  Center(child: Text("Pantalla de Inicio")),  // Esta es la pantalla de inicio
  ProfilePage(),  // Asegúrate de que esta referencia sea a la pantalla de perfil
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.redAccent,  // Color de los íconos seleccionados
        unselectedItemColor: Colors.grey,    // Color de los íconos no seleccionados
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
