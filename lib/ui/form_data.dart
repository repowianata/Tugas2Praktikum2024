import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon kembali di kiri
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info), // Ikon info di kanan
            onPressed: () {
              // Tambahkan aksi untuk ikon info jika diperlukan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Ubah border radius untuk sudut lebih halus
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Sedikit lebih gelap
                spreadRadius: 2,
                blurRadius: 8, // Blur lebih lembut
                offset: const Offset(0, 4), // Bayangan lebih jauh
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _textboxNama(),
                const SizedBox(height: 15),
                _textboxNIM(),
                const SizedBox(height: 15),
                _textboxTahun(),
                const SizedBox(height: 25),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _textboxNama() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Nama",
        hintText: "Masukkan nama Anda",
        prefixIcon: const Icon(Icons.person), // Ubah icon jadi prefixIcon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      controller: _namaController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
    );
  }

  _textboxNIM() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "NIM",
        hintText: "Masukkan NIM Anda",
        prefixIcon: const Icon(Icons.badge), // Ubah jadi prefixIcon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      controller: _nimController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIM tidak boleh kosong';
        }
        return null;
      },
    );
  }

  _textboxTahun() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        hintText: "Masukkan tahun lahir Anda",
        prefixIcon: const Icon(Icons.calendar_today), // Ubah jadi prefixIcon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      controller: _tahunController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tahun lahir tidak boleh kosong';
        } else if (int.tryParse(value) == null) {
          return 'Masukkan tahun lahir yang valid';
        }
        return null;
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton.icon(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
          ));
        }
      },
      icon: const Icon(Icons.save), // Tambahkan ikon pada tombol simpan
      label: const Text(
        'Simpan',
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Ubah jadi lebih halus
        ),
      ),
    );
  }
}
