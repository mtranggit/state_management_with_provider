import 'package:flutter/material.dart';
import 'package:state_management_with_provider/models/films.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/widgets/fave_button.dart';

class FilmItem extends StatelessWidget {
  final int id;
  const FilmItem(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var films = context.read<FilmsModel>();
    var film = films.getById(id);
    var filmNameStyle = Theme.of(context).textTheme.bodyText2;
    var filmNumberStyle = TextStyle(
        color: film.iconColor, fontWeight: FontWeight.bold, fontSize: 18.0);
    return ListTile(
      title: Text(film.name, style: filmNameStyle),
      leading: CircleAvatar(
        backgroundColor: film.backgroundColor,
        child: Text(
          film.episodeId.toString(),
          style: filmNumberStyle,
        ),
      ),
      trailing: FaveButton(film: film),
    );
  }
}
