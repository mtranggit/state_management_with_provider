import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/faves.dart';
import 'package:state_management_with_provider/models/films.dart';

class FaveButton extends StatelessWidget {
  final Film film;

  const FaveButton({required this.film, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faves = context.watch<FavesModel>();
    return TextButton(
      onPressed: faves.films.contains(film)
          ? () => faves.remove(film)
          : () => faves.add(film),
      // style: TextButton.styleFrom(
      // ),
      child: faves.films.contains(film)
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
    );
  }
}
