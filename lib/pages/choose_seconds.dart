import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nidrin_yaz_dostum_app/models/players.dart';
import 'package:nidrin_yaz_dostum_app/pages/search_page.dart';
import 'package:nidrin_yaz_dostum_app/pages/timer.dart';
import 'package:nidrin_yaz_dostum_app/util/app_constant.dart';

class ChooseSeconds extends StatefulWidget {
  @override
  _ChooseSecondsState createState() => _ChooseSecondsState();
}

class _ChooseSecondsState extends State<ChooseSeconds> {
  TextEditingController _searchText = TextEditingController();
  TextEditingController _userOne = TextEditingController();
  TextEditingController _userTwo = TextEditingController();
  TextEditingController _userThree = TextEditingController();
  TextEditingController _userFour = TextEditingController();
  TextEditingController _userFive = TextEditingController();
  TextEditingController _userSix = TextEditingController();
  Player players = Player();
  AudioCache player;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioCache();
  }

  @override
  void dispose() {
    _searchText.dispose();
    _userOne.dispose();
    _userTwo.dispose();
    _userThree.dispose();
    _userFour.dispose();
    _userFive.dispose();
    _userSix.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF282828),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                width: size.width * .8,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yaz500.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buttonImage(
                        imagePath: "assets/images/k1.png",
                        press: () {
                          _createPlayers();
                          players.getPlayer().forEach((element) {
                            print(element);
                          });
                          audio("voice/button.wav");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Timer(60, players.getPlayer()),
                            ),
                          );
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    _buttonImage(
                        imagePath: "assets/images/k2.png",
                        press: () {
                          _createPlayers();
                          audio("voice/button.wav");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Timer(30, players.getPlayer()),
                            ),
                          );
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    _buttonImage(
                        imagePath: "assets/images/k3.png",
                        press: () {
                          _createPlayers();
                          audio("voice/button.wav");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Timer(15, players.getPlayer()),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                width: size.width * .9,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _searchText,
                    cursorColor: AppConstant.textColor,
                    decoration: InputDecoration(
                      hintText: "Kelime Ara",
                      hintStyle: TextStyle(color: AppConstant.textColor),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (_searchText.text != "") {
                            var text = _searchText.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchPage(searchText: text),
                              ),
                            );
                            _searchText.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppConstant.colorPrimary,
                                content: Text(
                                  "Lütfen sözcük giriniz",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.search, color: AppConstant.textColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "OYUNCULARIN İSİMLERİNİ GİRİN",
                      style: TextStyle(
                          color: AppConstant.nidrinColor, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        buildExpandedGameUser("1. İsim", _userOne),
                        SizedBox(
                          width: 5,
                        ),
                        buildExpandedGameUser("2. İsim", _userTwo),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        buildExpandedGameUser("3. İsim", _userThree),
                        SizedBox(
                          width: 5,
                        ),
                        buildExpandedGameUser("4. İsim", _userFour),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        buildExpandedGameUser("5. İsim", _userFive),
                        SizedBox(
                          width: 5,
                        ),
                        buildExpandedGameUser("6. İsim", _userSix),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: SvgPicture.asset(
                  "assets/images/nidrin.svg",
                  color: AppConstant.nidrinColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpandedGameUser(
      String hintText, TextEditingController controller) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            cursorColor: AppConstant.textColor,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: AppConstant.textColor),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  audio(String wav) async {
    if (audioPlayer != null) {
      audioPlayer.dispose();
    }
    audioPlayer = await player.play(wav);
    //audioPlayer.dispose();
  }

  Expanded _buttonImage({String imagePath, Function press}) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }

  void _createPlayers() {
    players.listClear();
    if (_userOne.text != "") players.createUser(_userOne.text);
    if (_userTwo.text != "") players.createUser(_userTwo.text);
    if (_userThree.text != "") players.createUser(_userThree.text);
    if (_userFour.text != "") players.createUser(_userFour.text);
    if (_userFive.text != "") players.createUser(_userFive.text);
    if (_userSix.text != "") players.createUser(_userSix.text);
  }
}
