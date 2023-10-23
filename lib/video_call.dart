import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';

class VideoCall extends StatefulWidget {
  final String? channelName;
  final ClientRole? role;
  const VideoCall({Key? key, this.channelName, this.role}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("saqlain"),
      ),
    );
  }
}
