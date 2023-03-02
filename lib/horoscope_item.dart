// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:horoscope_app/horoscope_detail.dart';

import 'package:horoscope_app/models/horoscope_model.dart';

class Horoscopeitem extends StatelessWidget {
  final Horoscope horoscope;
  const Horoscopeitem({
    Key? key,
    required this.horoscope,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStlye = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    HoroscopeDetails(selectedHoroscope: horoscope)));
          },
          leading: Image.asset(
            'images/${horoscope.smallPhoto}',
          ),
          title: Text(
            horoscope.name,
            style: myTextStlye.headlineSmall,
          ),
          subtitle: Text(horoscope.date),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
