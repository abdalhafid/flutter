import 'package:flutter/material.dart';
import 'package:radio_dem/data_provider/data_provider.dart';
import 'package:radio_dem/models/exam.dart';
import 'package:radio_dem/models/user.dart';
import 'package:radio_dem/views/exam_submission_view.dart';

class ExamsView extends StatefulWidget {
  final User manipUser;
  ExamsView({required this.manipUser});

  @override
  _ExamsViewState createState() => _ExamsViewState();
}

class _ExamsViewState extends State<ExamsView> {
  final _dataProvider = DataProvider();
  late Future<List<Exam>> _examsFuture;

  @override
  void initState() {
    super.initState();
    _examsFuture = _dataProvider.getExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Exams')),
      body: FutureBuilder<List<Exam>>(
        future: _examsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));

          final exams = snapshot.data ?? [];
          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (_, index) {
              final exam = exams[index];
              return ListTile(
                title: Text('${exam.patientName} ${exam.patientFamily}'),
                subtitle: Text('${exam.exameLabel} • ${exam.demndeTimestap}'),
                trailing: Text(exam.exameStatu),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamSubmissionView(
                      exam: exam,
                      manipUser: widget.manipUser,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
