import 'dart:io' hide HttpResponse;
import 'package:callinteligence/api/ai_analytics_api.dart';
import 'package:callinteligence/data/actions_list.dart';
import 'package:callinteligence/model/transcription.dart';
import 'package:callinteligence/model/http_response.dart';
import 'package:callinteligence/model/user.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;

class RecordPage extends StatefulWidget {
  const RecordPage({super.key, required this.user});
  final User user;

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin {
  late bool isRecording;
  late bool isPlaying;
  late bool showExtendedActions;
  late AudioRecorder audioRecorder;
  late AudioPlayer audioPlayer;
  Transcription? transcription;

  late Duration duration;
  String? audioRecordingPath;
  @override
  void initState() {
    isRecording = false;
    showExtendedActions = false;
    isPlaying = false;

    audioRecorder = AudioRecorder();
    audioPlayer = AudioPlayer();
    duration = Duration.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LightTheme lightTheme = LightTheme();
    Responsive responsive = Responsive(context);
    return isRecording
        ? recordingState(responsive, lightTheme)
        : notRecordingState(responsive, lightTheme);
  }

  Column notRecordingState(Responsive responsive, LightTheme lightTheme) {
    return Column(
      children: [
        recordingInformationWidget(responsive, lightTheme),
        SizedBox(
          height: responsive.hp(2),
        ),
        transcription != null
            ? Container(
                width: responsive.wp(88),
                height: responsive.hp(51),
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(3), vertical: responsive.hp(2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 12)
                  ],
                ),
                child: Column(children: [
                  Text(
                    "Transcripción generada",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsive.dp(1),
                  ),
                  Container(
                    width: responsive.wp(80),
                    height: responsive.hp(40),
                    decoration: BoxDecoration(
                      color: lightTheme.greyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(
                      responsive.wp(4),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        transcription!.transcription.split("\r\n").join("\n-"),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ]),
              )
            : Container(),
      ],
    );
  }

  Container recordingInformationWidget(
      Responsive responsive, LightTheme lightTheme) {
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(25.5),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 12)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            audioRecordingPath == null
                ? 'Haz click en el botón para comenzar a grabar'
                : 'Grabación terminada',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(1.5),
            ),
            textAlign: TextAlign.center,
          ),
          audioRecordingPath != null
              ? Container(
                  height: responsive.hp(8),
                  width: responsive.wp(80),
                  decoration: BoxDecoration(
                    color: lightTheme.greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(responsive.wp(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (!isPlaying) {
                            await startPlaying();
                          } else {
                            stopPlaying();
                          }
                        },
                        icon: Icon(
                          isPlaying ? Ionicons.pause : Ionicons.play,
                          size: responsive.dp(3.5),
                        ),
                      ),
                      Container(
                        width: responsive.wp(45),
                        child: Text(
                          audioRecordingPath?.split("/").last ?? 'Error',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withAlpha(22),
                            borderRadius: BorderRadius.circular(8)),
                        width: responsive.wp(16),
                        height: responsive.hp(4),
                        child: Center(
                          child: Text(
                            duration.toString().substring(0, 7),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                    width: responsive.wp(35),
                    height: responsive.wp(15),
                    content: Icon(
                      Ionicons.mic,
                      color: lightTheme.backgroundColor,
                      size: responsive.wp(8),
                    ),
                    action: () async {
                      await startRecording();
                    },
                    color: lightTheme.mainColor),
                audioRecordingPath != null
                    ? Button(
                        width: responsive.wp(35),
                        height: responsive.wp(15),
                        isEnabled: transcription == null,
                        content: Center(
                          child: Text(
                            "Generar transcripción",
                            style: TextStyle(
                              color: lightTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.dp(1),
                            ),
                          ),
                        ),
                        action: () async {
                          await performTranscription();
                        },
                        color: lightTheme.secondaryColor)
                    : null
              ].nonNulls.toList()),
        ],
      ),
    );
  }

  Container recordingState(Responsive responsive, LightTheme lightTheme) {
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(25.5),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 12)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Grabando...",
            style: TextStyle(
                fontSize: responsive.dp(1.5), fontWeight: FontWeight.bold),
          ),
          Button(
              width: responsive.wp(35),
              height: responsive.wp(15),
              content: Icon(
                Ionicons.stop,
                color: lightTheme.backgroundColor,
                size: responsive.wp(8),
              ),
              action: () async {
                await stopRecording();
              },
              color: lightTheme.hangUpCollor),
        ],
      ),
    );
  }

  Future<void> startRecording() async {
    if (!await audioRecorder.hasPermission()) return;
    final Directory appDocumentDir = await getApplicationDocumentsDirectory();
    final DateTime now = DateTime.now();
    final String dateFormatted = DateFormat('yyyy-MM-dd-HH-mm-ss').format(now);
    final String audioPath =
        p.join(appDocumentDir.path, "record_$dateFormatted.wav");
    await audioRecorder.start(
        const RecordConfig(
          bitRate: 8000,
          numChannels: 1,
        ),
        path: audioPath);
    setState(() {
      audioRecordingPath = null;
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    final String audioPath = await audioRecorder.stop() ?? "invalid";
    if (audioPath == "invalid") {
      await Dialogs.alert(
        context,
        Center(
          child: Text(
            "ERROR",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Center(
          child: Text(
            "Hubo un problema al terminar la grabación",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      );
      return;
    }
    final Duration internalDuration =
        await audioPlayer.setFilePath(audioPath) ?? Duration.zero;
    if (internalDuration.inSeconds == Duration.zero.inSeconds) {
      await Dialogs.alert(
        context,
        Center(
          child: Text(
            "ERROR",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Center(
          child: Text(
            "Hubo un problema al asignar la grabación al reproductor",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      );
      return;
    }
    setState(() {
      audioRecordingPath = audioPath;
      isRecording = false;
      duration = internalDuration;
    });
  }

  Future<void> startPlaying() async {
    if (audioRecordingPath == null) {
      return;
    }
    setState(() {
      isPlaying = true;
    });
    await audioPlayer.play();
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void stopPlaying() {
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> performTranscription() async {
    if (audioRecordingPath == null) {
      return;
    }
    final AIAnalyticsAPI api = GetIt.instance<AIAnalyticsAPI>();
    HttpResponse<Transcription> response =
        await api.performTranscription(audioRecordingPath!);
    if (response.data == null) {
      await Dialogs.alert(
        context,
        Center(
          child: Text(
            "ERROR",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Center(
          child: Text(
            "Hubo un problema al generar la transcripción",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      );
      return;
    }
    if (response.httpError != null) {
      await Dialogs.alert(
        context,
        Center(
          child: Text(
            "ERROR",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Center(
          child: Text(
            "Hubo un problema al generar la transcripción",
            style: TextStyle(
                color: lightTheme.hangUpCollor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      );
    }
    setState(() {
      transcription = response.data!;
    });
  }
}
