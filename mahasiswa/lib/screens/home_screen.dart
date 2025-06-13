import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/mahasiswa.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController npmCtrl = TextEditingController();
  final TextEditingController namaCtrl = TextEditingController();
  final TextEditingController visiCtrl = TextEditingController();

  final dbRef = FirebaseDatabase.instance.ref().child('Mahasiswa');

  void simpanData(BuildContext context) {
    final mahasiswa = Mahasiswa(
      npm: npmCtrl.text,
      nama: namaCtrl.text,
      visi: visiCtrl.text,
    );

    dbRef.push().set(mahasiswa.toJson()).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil disimpan')));
      npmCtrl.clear();
      namaCtrl.clear();
      visiCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Biodata Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: npmCtrl,
            decoration: const InputDecoration(labelText: 'NPM'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: namaCtrl,
            decoration: const InputDecoration(labelText: 'Nama'),
          ),
          TextField(
            controller: visiCtrl,
            decoration: const InputDecoration(labelText: 'Visi (tahun 52)'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () => simpanData(context),
              child: const Text("Simpan")),
        ]),
      ),
    );
  }
}
