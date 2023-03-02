import 'package:flutter/material.dart';
import 'package:horoscope_app/data/strings.dart';
import 'package:horoscope_app/horoscope_item.dart';
import 'package:horoscope_app/models/horoscope_model.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> allHoroscopes;
  HoroscopeList() {
    allHoroscopes = getDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Horoscope List'),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return Horoscopeitem(horoscope: allHoroscopes[index]);
            }),
            itemCount: allHoroscopes.length,
          ),
        ));
  }

  List<Horoscope> getDataSource() {
    List<Horoscope> tAllHoroscopes = [];
    for (int i = 0; i < 12; i++) {
      Horoscope addHoroscope = Horoscope(
        Strings.BURC_ADLARI[i],
        Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i],
        '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png',
        '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png',
      );
      tAllHoroscopes.add(addHoroscope);
    }
    return tAllHoroscopes;
  }
}
