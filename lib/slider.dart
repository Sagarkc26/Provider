import 'package:buttomnavigationbar/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    final sliderprovider = Provider.of<SliderProvider>(context, listen: false);
    print("object");
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.currentvalue,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.height,
                    color: Colors.red.withOpacity(value.currentvalue),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(value.currentvalue),
                  )
                ],
              );
            },
          )
        ],
      )),
    );
  }
}
