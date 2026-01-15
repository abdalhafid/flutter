import 'package:flutter/material.dart';
import 'package:radio_dem/data_provider/data_provider.dart';
import 'package:radio_dem/models/exam.dart';
import 'package:radio_dem/models/user.dart';
import 'package:radio_dem/views/patient_files_view.dart';

class ExamSubmissionView extends StatefulWidget {
  final Exam exam;
  final User manipUser;
  ExamSubmissionView({required this.exam, required this.manipUser});

  @override
  _ExamSubmissionViewState createState() => _ExamSubmissionViewState();
}

class _ExamSubmissionViewState extends State<ExamSubmissionView> {
  final _dataProvider = DataProvider();
  String? _filePath = "no file selected";
  bool _loading = false;

  void _pickFile() async {
    final path = await _dataProvider.pickFile();
    if (path != null) setState(() => _filePath = path);
  }

  void _submit() async {
    if (_filePath == null) return;

    setState(() => _loading = true);
    final success = await _dataProvider.submitFile(
      widget.exam.idExam,
      _filePath!,
    );
    setState(() => _loading = false);
    setState(() => _filePath = "$success");

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PatientFilesView(
            patientName: widget.exam.patientName,
            manipUser: widget.manipUser,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to submit file')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Exam')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Patient: ${widget.exam.patientName} ${widget.exam.patientFamily}',
            ),
            Text('Exam: ${widget.exam.exameLabel}'),
            Text("$_filePath"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text(_filePath == null ? 'Pick File' : 'Change File'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
