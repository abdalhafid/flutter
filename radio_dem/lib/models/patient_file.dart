class PatientFile {
  final String fileUrl;
  final String fileName;
  final int fileSize;
  final String fileType;

  PatientFile({
    required this.fileUrl,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
  });

  factory PatientFile.fromJson(Map<String, dynamic> json) => PatientFile(
    fileUrl: json['fileurl'],
    fileName: json['filename'],
    fileSize: json['filesize'],
    fileType: json['filetype'],
  );
}
