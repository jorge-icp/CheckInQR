
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _employeeNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyIdController = TextEditingController();
  late String _hook;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _employeeNumberController.text = prefs.getString('employeeNumber') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _companyIdController.text = prefs.getString('companyId') ?? '';
      _hook = prefs.getString('webhook') ?? '';
     
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('employeeNumber', _employeeNumberController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('companyId', _companyIdController.text);
    await prefs.setString('webhook', await fetchHook(_companyIdController.text));
   }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Configuración'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _employeeNumberController,
              decoration: const InputDecoration(
                labelText: 'Número de empleado',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: _companyIdController,
              decoration: const InputDecoration(
                labelText: 'ID de empresa',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
        ElevatedButton(
          onPressed: () {
            _saveData();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Datos guardados')),
            );
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
