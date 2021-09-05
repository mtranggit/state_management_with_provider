import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/faves.dart';
import 'package:state_management_with_provider/widgets/film_item.dart';

class FavesScreen extends StatelessWidget {
  const FavesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faves = context.watch<FavesModel>();
    var favesCount = faves.length;

    if (favesCount == 0) {
      return Center(
        child: Text(
          'No favourites selected',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          _FavesSize(),
          Divider(
            height: 4,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favesCount,
              itemBuilder: (BuildContext context, int index) {
                var id = faves.getByIndex(index).episodeId;
                return FilmItem(id);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _FavesSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: SizedBox(
        height: 40.0,
        child: Center(child: Consumer<FavesModel>(
          builder: (_, faves, __) {
            var label = faves.length == 1 ? 'favourite' : 'favourites';
            return Text('${faves.length} $label',
                style: Theme.of(context).textTheme.bodyText1);
          },
        )),
      ),
    );
  }
}
