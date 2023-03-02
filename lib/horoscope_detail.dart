// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/horoscope_model.dart';

class HoroscopeDetails extends StatefulWidget {
  final Horoscope selectedHoroscope;
  const HoroscopeDetails({
    Key? key,
    required this.selectedHoroscope,
  }) : super(key: key);

  @override
  State<HoroscopeDetails> createState() => _HoroscopeDetailsState();
}

class _HoroscopeDetailsState extends State<HoroscopeDetails> {
  Color appBarColor = Colors.teal;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    createAppBarColour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: appBarColor,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.selectedHoroscope.name),
            background: Image.asset(
              'images/${widget.selectedHoroscope.bigPhoto}',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(4),
            child: SingleChildScrollView(
              child: Card(
                  elevation: 2,
                  child: Text(
                    widget.selectedHoroscope.detailHead,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  )),
            ),
          ),
        )
      ],
    ));
  }

  void createAppBarColour() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.selectedHoroscope.bigPhoto}'));
    appBarColor = _generator.dominantColor!.color;
    setState(() {});
    print(appBarColor);
  }
}
