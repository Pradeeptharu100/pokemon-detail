import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pokemon_app/models/respositories/pokemon_repository.dart';

void main() {
  group('PokemonRepository', () {
    late PokemonRepository repository;
    late Dio dio;
    late DioAdapter dioAdapter;

    setUp(() {
      dio = Dio(); // Initialize Dio
      dioAdapter = DioAdapter(dio: dio); // Pass Dio instance to DioAdapter
      repository = PokemonRepository(); // Use Dio in repository
    });

    test('should fetch Bulbasaur details successfully', () async {
      // Mock response data for Bulbasaur
      const mockBulbasaurResponse = {
        "id": 1,
        "name": "bulbasaur",
        "base_experience": 64,
        "height": 7,
        "weight": 69,
        "abilities": [
          {
            "ability": {
              "name": "overgrow",
              "url": "https://pokeapi.co/api/v2/ability/65/"
            },
            "is_hidden": false,
            "slot": 1
          },
          {
            "ability": {
              "name": "chlorophyll",
              "url": "https://pokeapi.co/api/v2/ability/34/"
            },
            "is_hidden": true,
            "slot": 3
          }
        ],
        "sprites": {
          "front_default":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
        }
      };

      // Set up DioAdapter mock response
      dioAdapter.onGet(
        'https://pokeapi.co/api/v2/pokemon/bulbasaur',
        (request) => request.reply(200, mockBulbasaurResponse),
      );

      // Execute the API call
      final pokemon = await repository.fetchPokemon('bulbasaur');

      // Assertions
      expect(pokemon.id, equals(1));
      expect(pokemon.name, equals("bulbasaur"));
      expect(pokemon.baseExperience, equals(64));
      expect(pokemon.height, equals(7));
      expect(pokemon.weight, equals(69));
      expect(pokemon.abilities.length, equals(2));
      expect(pokemon.abilities[0].ability.name, equals("overgrow"));
      expect(pokemon.abilities[1].ability.name, equals("chlorophyll"));
      expect(
          pokemon.sprites.frontDefault,
          equals(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"));
    });
  });
}
