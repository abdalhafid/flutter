class Exam {
  final String idExam;
  final String patientName;
  final String patientFamily;
  final String exameLabel;
  final String exameStatu;
  final String demndeTimestap;

  Exam({
    required this.idExam,
    required this.patientName,
    required this.patientFamily,
    required this.exameLabel,
    required this.exameStatu,
    required this.demndeTimestap,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    idExam: json['Id_exam'],
    patientName: json['patient_name'],
    patientFamily: json['patient_family'],
    exameLabel: json['exame_label'],
    exameStatu: json['exame_statu'],
    demndeTimestap: json['demnde_timestap'],
  );
}
