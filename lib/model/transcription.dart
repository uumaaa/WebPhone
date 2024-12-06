class Transcription {
  int transcriptionId;
  String transcription;
  String audioName;
  int audioId;
  double duration;
  String renamedAs;

  Transcription(
      {required this.transcriptionId,
      required this.transcription,
      required this.audioName,
      required this.audioId,
      required this.duration,
      required this.renamedAs});

  @override
  String toString() {
    return transcription;
  }

  static Transcription fromJson(Map<String, dynamic> json) {
    return Transcription(
      transcriptionId: json['valid']['transcription']['transcription_id'],
      transcription: json['valid']['transcription']['transcription'],
      audioName: json['valid']['transcription']['audio_name'],
      audioId: json['valid']['transcription']['audio_id'],
      duration: json['valid']['transcription']['duration'],
      renamedAs: json['valid']['transcription']['renamed_as'],
    );
  }

  Map<String, dynamic> toJson() => {
        'transcription_id': transcriptionId,
        'transcription': transcription,
        'audio_name': audioName,
        'audio_id': audioId,
        'duration': duration,
        'renamed_as': renamedAs,
      };
}
