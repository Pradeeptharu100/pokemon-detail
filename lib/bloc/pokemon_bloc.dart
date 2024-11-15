import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_events.dart';
import 'package:pokemon_app/bloc/pokemon_state.dart';
import 'package:pokemon_app/models/respositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;

  PokemonBloc({required this.repository}) : super(PokemonInitial()) {
    on<FetchPokemon>(_onFetchPokemon);

    on<PokemonSearchChanged>(_onPokemonSearchChanged);
  }

  StreamSubscription? _searchSubscription;

  Future<void> _onFetchPokemon(
      FetchPokemon event, Emitter<PokemonState> emit) async {
    try {
      emit(PokemonLoading());
      final pokemon = await repository.fetchPokemon(event.query);
      emit(PokemonLoaded(pokemon));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

  Future<void> _onPokemonSearchChanged(
      PokemonSearchChanged event, Emitter<PokemonState> emit) async {
    _searchSubscription?.cancel();

    _searchSubscription =
        Stream.periodic(const Duration(milliseconds: 500)).take(1).listen((_) {
      add(FetchPokemon(event.query));
    });
  }

  String formatStatName(String name) {
    switch (name) {
      case 'special-attack':
        return 'Sp. Attack';
      case 'special-defense':
        return 'Sp. Defense';
      default:
        return name
            .split('-')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
    }
  }

  Color getStatColor(int value, double maxValue) {
    final percentage = value / maxValue;
    if (percentage >= 0.7) return Colors.green;
    if (percentage >= 0.4) return Colors.blue;
    return Colors.red;
  }

  Widget buildTypeChip(String type) {
    final typeColors = {
      'normal': Colors.grey,
      'fire': Colors.red,
      'water': Colors.blue,
      'grass': Colors.green,
      'electric': Colors.yellow,
      'ice': Colors.cyan,
      'fighting': Colors.orange,
      'poison': Colors.purple,
      'ground': Colors.brown,
      'flying': Colors.indigo,
      'psychic': Colors.pink,
      'bug': Colors.lightGreen,
      'rock': Colors.brown,
      'ghost': Colors.deepPurple,
      'dark': Colors.grey[800],
      'dragon': Colors.indigo,
      'steel': Colors.blueGrey,
      'fairy': Colors.pinkAccent,
    };

    final baseColor = typeColors[type.toLowerCase()] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: baseColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        type[0].toUpperCase() + type.substring(1),
        style: TextStyle(
          color: baseColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _searchSubscription?.cancel();
    return super.close();
  }
}
