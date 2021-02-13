import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidrin_yaz_dostum_app/bloc/event/timer_event.dart';
import 'package:nidrin_yaz_dostum_app/bloc/state/timer_state.dart';
import 'package:nidrin_yaz_dostum_app/bloc/timer_bloc.dart';
import 'package:nidrin_yaz_dostum_app/util/app_constant.dart';
import 'package:nidrin_yaz_dostum_app/util/ticker/ticker.dart';

class Timer extends StatefulWidget {
  final int duration;
  final List<String> players;

  Timer(this.duration, this.players);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  AudioCache player = AudioCache();

  AudioPlayer audioPlayer;
  int rows = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TimerBloc(ticker: Ticker(), duration: widget.duration)
            ..add(TimerStarted(duration: widget.duration)),
      child: BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
        final String secondsStr =
            (state.duration).floor().toString().padLeft(2, '0');
        return Scaffold(
          backgroundColor: AppConstant.colorPrimary,
          // appBar: AppBar(
          //   backgroundColor: AppConstant.colorPrimary,
          //   centerTitle: true,
          // ),
          body: GestureDetector(
            onTap: () {
              setState(() {
                print(rows);
                print(widget.players.length);
                if (rows == widget.players.length - 1) {
                  rows = 0;
                } else {
                  rows += 1;
                }
              });
              audio("voice/button.wav");
              BlocProvider.of<TimerBloc>(context).add(TimerReset());
            },
            child: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 9,
              color: AppConstant.colorPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 45,
                    decoration: BoxDecoration(
                        //  color: AppConstant.colorPrimary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        widget.players.isNotEmpty
                            ? widget.players[rows].toUpperCase()
                            : "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/sayac.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Center(
                        child: buildSeconds(secondsStr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<TimerBloc>(context)
                            .add(TimerPaused()),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("assets/images/pause.png"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  audio(String wav) async {
    if (audioPlayer != null) {
      audioPlayer.dispose();
    }
    audioPlayer = await player.play(wav);
    //audioPlayer.dispose();
  }

  Widget buildSeconds(String secondsStr) {
    if (secondsStr != "00")
      return Text(
        "$secondsStr",
        style: TextStyle(
            fontSize: 140, fontWeight: FontWeight.bold, color: Colors.white),
      );
    else {
      audio("voice/error.wav");
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'CEZA \n',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                  color: Colors.white),
            ),
            TextSpan(
              text: '50',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 80,
              ),
            ),
          ],
        ),
      );
    }
  }
}
