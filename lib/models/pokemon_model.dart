class PokemonStat {
  final Stat stat;
  final int baseStat;
  final int effort;

  PokemonStat({
    required this.stat,
    required this.baseStat,
    required this.effort,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      stat: Stat.fromJson(json['stat']),
      baseStat: json['base_stat'],
      effort: json['effort'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stat': stat.toJson(),
      'base_stat': baseStat,
      'effort': effort,
    };
  }
}

class Stat {
  final String name;
  final String url;

  Stat({required this.name, required this.url});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class PokemonType {
  final Type type;
  final int slot;

  PokemonType({
    required this.type,
    required this.slot,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      type: Type.fromJson(json['type']),
      slot: json['slot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'slot': slot,
    };
  }
}

class Type {
  final String name;
  final String url;

  Type({required this.name, required this.url});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final List<PokemonAbility> abilities;
  final List<PokemonType> types;
  final PokemonSprites sprites;
  final List<PokemonStat> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
    required this.sprites,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      weight: json['weight'],
      abilities: (json['abilities'] as List)
          .map((abilityJson) => PokemonAbility.fromJson(abilityJson))
          .toList(),
      types: (json['types'] as List)
          .map((typeJson) => PokemonType.fromJson(typeJson))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites']),
      stats: (json['stats'] as List)
          .map((statJson) => PokemonStat.fromJson(statJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'base_experience': baseExperience,
      'height': height,
      'weight': weight,
      'abilities': abilities.map((ability) => ability.toJson()).toList(),
      'types': types.map((type) => type.toJson()).toList(),
      'sprites': sprites.toJson(),
      'stats': stats.map((stat) => stat.toJson()).toList(),
    };
  }
}

class PokemonAbility {
  final Ability ability;
  final bool isHidden;
  final int slot;

  PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      ability: Ability.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ability': ability.toJson(),
      'is_hidden': isHidden,
      'slot': slot,
    };
  }
}

class Ability {
  final String name;
  final String url;

  Ability({required this.name, required this.url});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class PokemonSprites {
  final String frontDefault;

  PokemonSprites({required this.frontDefault});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      frontDefault: json['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'front_default': frontDefault,
    };
  }
}
