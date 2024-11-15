import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon_model.dart';

class PokemonRepository {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> fetchPokemon(String identifier) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pokemon/$identifier'),
      );
      if (response.statusCode == 200) {
        return Pokemon.fromJson(json.decode(response.body));
      } else if (response.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      } else {
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      throw Exception('Error fetching pokemon: $e');
    }
  }
}
