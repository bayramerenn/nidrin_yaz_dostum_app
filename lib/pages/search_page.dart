import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidrin_yaz_dostum_app/bloc/dictionary_bloc.dart';
import 'package:nidrin_yaz_dostum_app/bloc/event/dictionary_event.dart';
import 'package:nidrin_yaz_dostum_app/bloc/state/dictionary_state.dart';
import 'package:nidrin_yaz_dostum_app/util/app_constant.dart';

class SearchPage extends StatelessWidget {
  final String searchText;
  SearchPage({this.searchText});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DictionaryBloc(word: this.searchText)..add(DictionaryFetched()),
      child: Scaffold(
          backgroundColor: AppConstant.colorPrimary,
          appBar: AppBar(
            backgroundColor: AppConstant.colorPrimary,
            centerTitle: true,
            title: Text("Sözcük Arama"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BlocBuilder<DictionaryBloc, DictionaryState>(
                builder: (context, state) {
                  if (state is DictionaryInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is DictionarySuccess) {
                    print(state.list.length);

                    return ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        var result = state.list[index].meaningList;
                        List<Widget> listWidget = [];
                        for (int i = 0; i < result.length; i++) {
                          print(i);

                          listWidget.add(Container(
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      result[i].propertyList.tam_adi == ""
                                          ? 'isim;'
                                          : result[i].propertyList.tam_adi +
                                              ';',
                                      style: TextStyle(
                                        fontSize: AppConstant
                                            .fontSizeIdiomCardContent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '${result[i].anlam}',
                                      style: TextStyle(
                                        fontSize:
                                            AppConstant.fontSizeIdiomCardTitle,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    result[i].sampleList.ornek != ""
                                        ? Text(
                                            '${result[i].sampleList.ornek}',
                                            style: TextStyle(
                                              fontSize: AppConstant
                                                  .fontSizeIdiomCardContent,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    result[i].sampleList.yazar.tam_adi != ''
                                        ? Text(
                                            'Yazar :${result[i].sampleList.yazar.tam_adi}',
                                            style: TextStyle(
                                              fontSize: AppConstant
                                                  .fontSizeIdiomCardContent,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        }

                        return Column(
                          children: listWidget,
                        );

                        return SizedBox(
                          height: 0,
                        );
                      },
                    );
                  } else if (state is DictionaryFailure) {
                    return Container(
                      width: double.infinity,
                      height: 70,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${state.error}',
                            style: TextStyle(
                              fontSize: AppConstant.fontSizeIdiomCardTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 0,
                  );
                },
              ),
            ),
          )),
    );
  }
}
