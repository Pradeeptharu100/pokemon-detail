import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonEvent {
  final String query;

  const FetchPokemon(this.query);

  @override
  List<Object> get props => [query];
}

class PokemonSearchChanged extends PokemonEvent {
  final String query;

  const PokemonSearchChanged(this.query);

  @override
  List<Object> get props => [query];
}
