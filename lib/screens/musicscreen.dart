import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

import 'package:url_launcher/url_launcher.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  String currentSong = '';

  List<Map<String, String>> songs = [
    {
      'title': 'Ram Ayenge',
      'artist': '',
      'url': 'assets/Ram-Aayenge.wav',
    },
    {
      'title': 'Ram Siya Ram',
      'artist': '',
      'url': 'assets/RamSiyaRam.wav',
    },
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Library'),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(songs[index]['title']!),
                subtitle: Column(
                  children: [
                    Text(songs[index]['artist']!),
                    StreamBuilder<Duration?>(
                      stream: audioPlayer.positionStream,
                      builder: (context, snapshot) {
                        if (currentSong != songs[index]['url']) {
                          return Container();
                        }
                        final position = snapshot.data ?? Duration.zero;
                        final duration = audioPlayer.duration ?? Duration.zero;
                        return duration.inMilliseconds == 0
                            ? Container()
                            : LinearProgressIndicator(
                                value: position.inMilliseconds /
                                    duration.inMilliseconds,
                              );
                      },
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(isPlaying && currentSong == songs[index]['url']
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: () async {
                    if (isPlaying && currentSong == songs[index]['url']) {
                      audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      await audioPlayer.setAsset(songs[index]['url']!);
                      audioPlayer.play();
                      setState(() {
                        isPlaying = true;
                        currentSong = songs[index]['url']!;
                      });
                    }
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: MaterialButton(
              color: Colors.black54,
              child: const Text('Download CV'),
              onPressed: () async {
                const url =
                    'https://drive.google.com/file/d/10yghLL-IGLusVtTLsaHj5mM_epgIZRpH/view?usp=sharing';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
