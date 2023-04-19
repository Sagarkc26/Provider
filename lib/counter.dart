import 'package:buttomnavigationbar/parts/favourite_screen.dart';
import 'package:buttomnavigationbar/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterprovider =
        Provider.of<CounterProvider>(context, listen: false);
    print("objects");

    return Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Center(
                  child: Text(
                    value.count.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              },
            ),
            Consumer<CounterProvider>(
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
            Consumer<CounterProvider>(
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const FavouriteScreen();
                  }));
                },
                child: const Text("Goto"))
          ],
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
                heroTag: "f1",
                onPressed: () {
                  counterprovider.removeCounter();
                },
                label: const Icon(Icons.remove)),
            const SizedBox(
              width: 4,
            ),
            FloatingActionButton.extended(
                heroTag: "f2",
                onPressed: () {
                  counterprovider.resetCounter();
                },
                label: const Icon(Icons.refresh)),
            const SizedBox(
              width: 4,
            ),
            FloatingActionButton.extended(
                heroTag: "f3",
                onPressed: () {
                  counterprovider.addCounter();
                },
                label: const Icon(Icons.add)),
          ],
        ));
  }
}
