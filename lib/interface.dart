import 'package:agora_test/video_call.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class Shuff extends StatefulWidget {
  const Shuff({super.key});

  @override
  State<Shuff> createState() => _ShuffState();
}

class _ShuffState extends State<Shuff> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;
  @override
  void initState() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _channelController,
            decoration: InputDecoration(
                errorText: _validateError ? "Enter Channel name" : null,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
                hintText: "Hint text"),
          ),
          RadioListTile(
            title: const Text("broadcaster"),
            onChanged: (ClientRole? value) {
              setState(() {
                _role = value;
              });
            },
            value: ClientRole.Broadcaster,
            groupValue: _role,
          ),
          RadioListTile(
            title: const Text("Audience"),
            onChanged: (ClientRole? value) {
              setState(() {
                _role = value;
              });
            },
            value: ClientRole.Audience,
            groupValue: _role,
          ),
          ElevatedButton(
            onPressed: onJoin,
            child: const Text("join"),
          )
        ]),
      )),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoCall(
              channelName: _channelController.text,
              role: _role,
            ),
          ));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
  }
}
