class Exam {
  final String idExam;
  final String patientName;
  final String patientFamily;
  final String examLabel;
  final String examStatus;
  final String demandeTimestamp;

  Exam({
    required this.idExam,
    required this.patientName,
    required this.patientFamily,
    required this.examLabel,
    required this.examStatus,
    required this.demandeTimestamp,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      idExam: json['Id_exam'],
      patientName: json['patient_name'],
      patientFamily: json['patient_family'],
      examLabel: json['exame_label'],
      examStatus: json['exame_statu'],
      demandeTimestamp: json['demnde_timestap'],
    );
  }
}
