import 'package:buttomnavigationbar/provider/favourateitem_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
          centerTitle: true,
        ),
        body: Consumer<FavourateItemProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text("Item " + (index + 1).toString()),
                        trailing: value.selectedItem.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border_outlined),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
