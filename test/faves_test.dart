import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_with_provider/models/faves.dart';
import 'package:state_management_with_provider/models/films.dart';

void main() {
  group('FavesModel', () {
    test('favouriting increases the number of favourites', () {
      final films = FilmsModel();
      final faves = FavesModel(films, null);
      final initialCount = faves.length;
      faves.addListener(() {
        expect(faves.length, greaterThan(initialCount));
      });
      faves.add(films.getByPosition(3));
    });

    test('unfavouriting one favourite reduces count to zero', () {
      final films = FilmsModel();
      final faves = FavesModel(films, null);
      final film = films.getById(5);
      faves.add(film);
      faves.addListener(() {
        expect(faves.length, equals(0));
      });
      faves.remove(film);
    });
  });
}
