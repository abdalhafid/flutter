import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radio_dem/models/user.dart';
import 'package:radio_dem/models/exam.dart';
import 'package:radio_dem/models/patient_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DataProvider {
  static const String baseUrl = "http://127.0.0.1:8000";

  // -------------------- USERS --------------------
  Future<User?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final usersJson = jsonDecode(response.body)['users'] as List;
      final users = usersJson.map((e) => User.fromJson(e)).toList();

      for (var u in users) {
        if (u.username == username &&
            u.password == password &&
            u.role == "manip") {
          return u;
        }
      }
      return null;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  // -------------------- EXAMS --------------------
  Future<List<Exam>> getExams() async {
    final url = Uri.parse('$baseUrl/exams');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final examsJson = jsonDecode(response.body)['exams'] as List;
      return examsJson.map((e) => Exam.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch exams');
    }
  }

  // -------------------- PATIENT FILES --------------------
  Future<List<PatientFile>> getPatientFiles(String patientName) async {
    final url = Uri.parse('$baseUrl/files/$patientName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final filesJson = jsonDecode(response.body)['files'] as List;
      return filesJson.map((e) => PatientFile.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch patient files');
    }
  }

  // -------------------- FILE SUBMISSION --------------------
  Future<bool> submitFile(String examId, String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/files'));
    request.fields['examId'] = examId;

    if (kIsWeb) {
      // Read bytes instead of File
      final result = await FilePicker.platform.pickFiles();
      if (result == null) return false;
      final bytes = result.files.first.bytes;
      final filename = result.files.first.name;

      if (bytes == null) return false;
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: filename),
      );
    } else {
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    print('Server response: ${response.statusCode} ${response.body}');
    return response.statusCode == 200;
  }

  // -------------------- FILE PICKER --------------------
  Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'dcm'],
    );
    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    }
    return null;
  }
}
