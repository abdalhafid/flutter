import '../models/user.dart';
import '../models/exam.dart';
import '../models/file.dart';
import 'json_service.dart';

class MimicApi {
  static Future<User?> login(String username, String password) async {
    final usersJson = await JsonService.loadJson('assets/json/users.json');
    final users = usersJson.map((e) => User.fromJson(e)).toList();
    return users.firstWhere(
      (u) =>
          u.username == username && u.password == password && u.role == "manip",
    );
  }

  static Future<List<Exam>> getExams() async {
    final examsJson = await JsonService.loadJson('assets/json/exams.json');
    return examsJson.map((e) => Exam.fromJson(e)).toList();
  }

  static Future<List<PatientFile>> getPatientFiles(String patientName) async {
    final filesJson = await JsonService.loadJson('assets/json/files.json');
    return filesJson.map((e) => PatientFile.fromJson(e)).toList();
  }

  static Future<bool> submitFile(String examId, String filePath) async {
    // mimic file submission delay
    await Future.delayed(Duration(seconds: 1));
    return true; // always success for now
  }
}
