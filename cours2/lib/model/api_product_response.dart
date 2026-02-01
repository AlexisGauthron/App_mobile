/// Classes représentant la réponse JSON de l'API
/// Elles sont séparées du modèle Product (UI) pour découpler
/// la couche réseau de la couche interface.

import 'product.dart';

class ApiProductResponse {
  final ApiProduct? response;
  final String? error;

  ApiProductResponse.fromJSON(Map<String, dynamic> json)
      : response = json['response'] != null
            ? ApiProduct.fromJSON(json['response'] as Map<String, dynamic>)
            : null,
        error = json['error'] as String?;
}

class ApiProduct {
  final String barcode;
  final String? name;
  final String? altName;
  final ApiPictures? pictures;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final String? nutriScore;
  final int? novaScore;
  final String? ecoScoreGrade;
  final ApiIngredients? ingredients;
  final Map<String, ApiNutrientLevel>? nutrientLevels;
  final ApiNutritionFacts? nutritionFacts;
  final Map<String, ApiNutriScoreLevel?>? levels;
  final ApiListWrapper? traces;
  final Map<String, String>? additives;
  final ApiListWrapper? allergens;
  final ApiAnalysis? analysis;

  ApiProduct.fromJSON(Map<String, dynamic> json)
      : barcode = json['barcode'] as String,
        name = json['name'] as String?,
        altName = json['altName'] as String?,
        pictures = json['pictures'] != null
            ? ApiPictures.fromJSON(json['pictures'] as Map<String, dynamic>)
            : null,
        quantity = json['quantity'] as String?,
        brands = (json['brands'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        manufacturingCountries =
            (json['manufacturingCountries'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList(),
        nutriScore = json['nutriScore'] as String?,
        novaScore = json['novaScore'] as int?,
        ecoScoreGrade = json['ecoScoreGrade'] as String?,
        ingredients = json['ingredients'] != null
            ? ApiIngredients.fromJSON(
                json['ingredients'] as Map<String, dynamic>)
            : null,
        nutrientLevels = json['nutrientLevels'] != null
            ? (json['nutrientLevels'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                  key,
                  ApiNutrientLevel.fromJSON(value as Map<String, dynamic>),
                ),
              )
            : null,
        nutritionFacts = json['nutritionFacts'] != null
            ? ApiNutritionFacts.fromJSON(
                json['nutritionFacts'] as Map<String, dynamic>)
            : null,
        levels = json['levels'] != null
            ? (json['levels'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                  key,
                  value != null
                      ? ApiNutriScoreLevel.fromJSON(
                          value as Map<String, dynamic>)
                      : null,
                ),
              )
            : null,
        traces = json['traces'] != null
            ? ApiListWrapper.fromJSON(json['traces'] as Map<String, dynamic>)
            : null,
        additives = json['additives'] != null
            ? (json['additives'] as Map<String, dynamic>)
                .map((key, value) => MapEntry(key, value as String))
            : null,
        allergens = json['allergens'] != null
            ? ApiListWrapper.fromJSON(
                json['allergens'] as Map<String, dynamic>)
            : null,
        analysis = json['analysis'] != null
            ? ApiAnalysis.fromJSON(json['analysis'] as Map<String, dynamic>)
            : null;

  /// Convertisseur : classes API → Product (UI)
  Product toProduct() {
    return Product(
      barcode: barcode,
      name: name,
      altName: altName,
      picture: pictures?.front,
      quantity: quantity,
      brands: brands,
      manufacturingCountries: manufacturingCountries,
      nutriScore: _nutriScoreFromString(nutriScore),
      novaScore: _novaScoreFromInt(novaScore),
      greenScore: _greenScoreFromString(ecoScoreGrade),
      nutriScoreLevels: _convertLevels(levels),
      ingredients: ingredients?.list,
      ingredientsWithAllergens: ingredients?.withAllergens,
      ingredientsFromPalmOil: ingredients?.containsPalmOil,
      traces: traces?.list,
      allergens: allergens?.list,
      additives: additives,
      nutrientLevels: _convertNutrientLevels(nutrientLevels),
      nutritionFacts: _convertNutritionFacts(nutritionFacts),
      containsPalmOil: analysis != null
          ? ProductAnalysis.fromString(analysis!.palmOil)
          : null,
      isVegan: analysis != null
          ? ProductAnalysis.fromString(analysis!.vegan)
          : null,
      isVegetarian: analysis != null
          ? ProductAnalysis.fromString(analysis!.vegetarian)
          : null,
    );
  }

  static ProductNutriScore _nutriScoreFromString(String? value) {
    return switch (value?.toUpperCase()) {
      'A' => ProductNutriScore.A,
      'B' => ProductNutriScore.B,
      'C' => ProductNutriScore.C,
      'D' => ProductNutriScore.D,
      'E' => ProductNutriScore.E,
      _ => ProductNutriScore.unknown,
    };
  }

  static ProductNovaScore _novaScoreFromInt(int? value) {
    return switch (value) {
      1 => ProductNovaScore.group1,
      2 => ProductNovaScore.group2,
      3 => ProductNovaScore.group3,
      4 => ProductNovaScore.group4,
      _ => ProductNovaScore.unknown,
    };
  }

  static ProductGreenScore _greenScoreFromString(String? value) {
    return switch (value?.toUpperCase()) {
      'A+' => ProductGreenScore.APlus,
      'A' => ProductGreenScore.A,
      'B' => ProductGreenScore.B,
      'C' => ProductGreenScore.C,
      'D' => ProductGreenScore.D,
      'E' => ProductGreenScore.E,
      'F' => ProductGreenScore.F,
      _ => ProductGreenScore.unknown,
    };
  }

  static NutrientLevels? _convertNutrientLevels(
      Map<String, ApiNutrientLevel>? apiLevels) {
    if (apiLevels == null) return null;
    return NutrientLevels(
      salt: apiLevels['salt']?.level,
      saturatedFat: apiLevels['saturatedFat']?.level,
      sugars: apiLevels['sugars']?.level,
      fat: apiLevels['fat']?.level,
    );
  }

  static NutritionFacts? _convertNutritionFacts(ApiNutritionFacts? api) {
    if (api == null) return null;
    return NutritionFacts(
      servingSize: api.servingSize ?? '',
      calories: _convertNutriment(api.calories),
      fat: _convertNutriment(api.fat),
      saturatedFat: _convertNutriment(api.saturatedFat),
      carbohydrate: _convertNutriment(api.carbohydrate),
      sugar: _convertNutriment(api.sugar),
      fiber: _convertNutriment(api.fiber),
      proteins: _convertNutriment(api.proteins),
      sodium: _convertNutriment(api.sodium),
      salt: _convertNutriment(api.salt),
      energy: _convertNutriment(api.energy),
    );
  }

  static Nutriment? _convertNutriment(ApiNutriment? api) {
    if (api == null) return null;
    return Nutriment(
      unit: api.unit ?? '',
      perServing: api.perServing,
      per100g: api.per100g,
    );
  }

  static ProductNutriScoreLevels? _convertLevels(
      Map<String, ApiNutriScoreLevel?>? apiLevels) {
    if (apiLevels == null) return null;
    return ProductNutriScoreLevels(
      energy: _convertScoreLevel(apiLevels['energy']),
      fiber: _convertScoreLevel(apiLevels['fiber']),
      fruitsVegetablesLegumes:
          _convertScoreLevel(apiLevels['fruitsVegetablesLegumes']),
      proteins: _convertScoreLevel(apiLevels['proteins']),
      salt: _convertScoreLevel(apiLevels['salt']),
      saturatedFat: _convertScoreLevel(apiLevels['saturatedFat']),
      sugars: _convertScoreLevel(apiLevels['sugars']),
    );
  }

  static ProductNutriScoreLevel? _convertScoreLevel(
      ApiNutriScoreLevel? api) {
    if (api == null) return null;
    return ProductNutriScoreLevel(
      points: api.points ?? 0,
      maxPoints: api.maxPoints ?? 0,
      unit: api.unit ?? '',
      value: api.value ?? 0,
      type: switch (api.type) {
        'positive' => ProductNutriScoreLevelType.positive,
        'negative' => ProductNutriScoreLevelType.negative,
        _ => ProductNutriScoreLevelType.unknown,
      },
    );
  }
}

class ApiPictures {
  final String? product;
  final String? front;
  final String? ingredients;
  final String? nutrition;

  ApiPictures.fromJSON(Map<String, dynamic> json)
      : product = json['product'] as String?,
        front = json['front'] as String?,
        ingredients = json['ingredients'] as String?,
        nutrition = json['nutrition'] as String?;
}

class ApiIngredients {
  final bool? containsPalmOil;
  final List<String>? list;
  final String? withAllergens;

  ApiIngredients.fromJSON(Map<String, dynamic> json)
      : containsPalmOil = json['containsPalmOil'] as bool?,
        list = (json['list'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        withAllergens = json['withAllergens'] as String?;
}

class ApiNutrientLevel {
  final String? level;
  final double? per100g;

  ApiNutrientLevel.fromJSON(Map<String, dynamic> json)
      : level = json['level'] as String?,
        per100g = (json['per100g'] as num?)?.toDouble();
}

class ApiNutritionFacts {
  final String? servingSize;
  final ApiNutriment? calories;
  final ApiNutriment? fat;
  final ApiNutriment? saturatedFat;
  final ApiNutriment? carbohydrate;
  final ApiNutriment? sugar;
  final ApiNutriment? fiber;
  final ApiNutriment? proteins;
  final ApiNutriment? sodium;
  final ApiNutriment? salt;
  final ApiNutriment? energy;

  ApiNutritionFacts.fromJSON(Map<String, dynamic> json)
      : servingSize = json['servingSize'] as String?,
        calories = json['calories'] != null
            ? ApiNutriment.fromJSON(json['calories'] as Map<String, dynamic>)
            : null,
        fat = json['fat'] != null
            ? ApiNutriment.fromJSON(json['fat'] as Map<String, dynamic>)
            : null,
        saturatedFat = json['saturatedFat'] != null
            ? ApiNutriment.fromJSON(
                json['saturatedFat'] as Map<String, dynamic>)
            : null,
        carbohydrate = json['carbohydrate'] != null
            ? ApiNutriment.fromJSON(
                json['carbohydrate'] as Map<String, dynamic>)
            : null,
        sugar = json['sugar'] != null
            ? ApiNutriment.fromJSON(json['sugar'] as Map<String, dynamic>)
            : null,
        fiber = json['fiber'] != null
            ? ApiNutriment.fromJSON(json['fiber'] as Map<String, dynamic>)
            : null,
        proteins = json['proteins'] != null
            ? ApiNutriment.fromJSON(json['proteins'] as Map<String, dynamic>)
            : null,
        sodium = json['sodium'] != null
            ? ApiNutriment.fromJSON(json['sodium'] as Map<String, dynamic>)
            : null,
        salt = json['salt'] != null
            ? ApiNutriment.fromJSON(json['salt'] as Map<String, dynamic>)
            : null,
        energy = json['energy'] != null
            ? ApiNutriment.fromJSON(json['energy'] as Map<String, dynamic>)
            : null;
}

class ApiNutriment {
  final String? unit;
  final String? perServing;
  final String? per100g;

  ApiNutriment.fromJSON(Map<String, dynamic> json)
      : unit = json['unit'] as String?,
        perServing = json['perServing'] as String?,
        per100g = json['per100g'] as String?;
}

class ApiNutriScoreLevel {
  final double? points;
  final double? maxPoints;
  final String? unit;
  final double? value;
  final String? type;

  ApiNutriScoreLevel.fromJSON(Map<String, dynamic> json)
      : points = (json['points'] as num?)?.toDouble(),
        maxPoints = (json['maxPoints'] as num?)?.toDouble(),
        unit = json['unit'] as String?,
        value = (json['value'] as num?)?.toDouble(),
        type = json['type'] as String?;
}

class ApiListWrapper {
  final List<String>? list;

  ApiListWrapper.fromJSON(Map<String, dynamic> json)
      : list = (json['list'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList();
}

class ApiAnalysis {
  final String? palmOil;
  final String? vegan;
  final String? vegetarian;

  ApiAnalysis.fromJSON(Map<String, dynamic> json)
      : palmOil = json['palmOil'] as String?,
        vegan = json['vegan'] as String?,
        vegetarian = json['vegetarian'] as String?;
}
