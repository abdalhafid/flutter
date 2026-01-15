import 'package:flutter/material.dart';
import 'package:radio_dem/data_provider/data_provider.dart';
import 'package:radio_dem/models/patient_file.dart';
import 'package:radio_dem/models/user.dart';
import 'package:radio_dem/views/exams_view.dart';

class PatientFilesView extends StatefulWidget {
  final String patientName;
  final User manipUser;

  PatientFilesView({required this.patientName, required this.manipUser});

  @override
  _PatientFilesViewState createState() => _PatientFilesViewState();
}

class _PatientFilesViewState extends State<PatientFilesView> {
  final _dataProvider = DataProvider();
  late Future<List<PatientFile>> _filesFuture;

  @override
  void initState() {
    super.initState();
    _filesFuture = _dataProvider.getPatientFiles(widget.patientName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Files')),
      body: FutureBuilder<List<PatientFile>>(
        future: _filesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));

          final files = snapshot.data ?? [];
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (_, index) {
                    final f = files[index];
                    return ListTile(
                      title: Text(f.fileName),
                      subtitle: Text('${f.fileType} • ${f.fileSize} bytes'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamsView(manipUser: widget.manipUser),
                  ),
                ),
                child: Text('Back to Exams'),
              ),
            ],
          );
        },
      ),
    );
  }
}
