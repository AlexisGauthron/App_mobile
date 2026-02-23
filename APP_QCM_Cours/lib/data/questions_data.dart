import '../models/question.dart';

final List<Category> allCategories = [
  // ============================================================
  // CATÉGORIE 1: Dart - Null Safety & Types
  // ============================================================
  const Category(
    id: 'dart_null',
    name: 'Dart - Null Safety & Types',
    description: 'Opérateurs null-aware, types nullables, assertions',
    icon: '🎯',
    questions: [
      Question(
        id: 'dart_null_q1',
        question: 'Que retourne l\'expression suivante si `a` est null ?',
        options: [
          '5',
          'null',
          'Une erreur de compilation',
          'Une exception à l\'exécution',
        ],
        correctIndex: 0,
        explanation:
            'L\'opérateur ?? (coalescence null) retourne la valeur de gauche si elle n\'est pas null, sinon la valeur de droite. Ici, a est null donc b vaut 5.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'int? a;\nint b = a ?? 5;',
      ),
      Question(
        id: 'dart_null_q2',
        question: 'Quelle est la différence entre `int` et `int?` en Dart ?',
        options: [
          'int? est plus performant que int',
          'int peut contenir null, int? ne peut pas',
          'int? peut contenir null, int ne peut pas',
          'Il n\'y a aucune différence',
        ],
        correctIndex: 2,
        explanation:
            'Le suffixe ? rend un type nullable. int? accepte une valeur entière OU null, tandis que int n\'accepte que des valeurs entières non-null. C\'est le fondement du null safety en Dart.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_null_q3',
        question:
            'Que se passe-t-il si on utilise l\'opérateur `!` sur une valeur null ?',
        options: [
          'La valeur devient 0',
          'La valeur devient une chaîne vide',
          'Une erreur de compilation',
          'Une exception à l\'exécution (runtime error)',
        ],
        correctIndex: 3,
        explanation:
            'L\'opérateur ! (force unwrap / null assertion) dit au compilateur "je suis sûr que cette valeur n\'est pas null". Si elle est effectivement null à l\'exécution, une exception de type TypeError est levée. C\'est dangereux et à utiliser avec précaution.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'int? a = null;\nint b = a!; // BOOM! TypeError à l\'exécution',
      ),
      Question(
        id: 'dart_null_q4',
        question: 'Quel est le résultat de ce code ?',
        options: [
          'true',
          'false',
          'null',
          'Erreur de compilation',
        ],
        correctIndex: 0,
        explanation:
            'La propriété .isEven vérifie si un entier est pair. 42 est pair, donc 42.isEven retourne true. Cette propriété est disponible directement sur le type int.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'int x = 42;\nprint(x.isEven);',
      ),
      Question(
        id: 'dart_null_q5',
        question: 'Comment vérifier proprement si une variable nullable est null avant de l\'utiliser ?',
        options: [
          'Utiliser l\'opérateur ! pour forcer l\'accès',
          'Utiliser un if (variable == null) ou un if (variable != null)',
          'Ignorer le null safety et caster avec as int',
          'Utiliser try/catch systématiquement',
        ],
        correctIndex: 1,
        explanation:
            'La vérification avec if (variable == null) ou if (variable != null) est la façon la plus sûre. Dart effectue une "promotion de type" : après un check != null dans un if, le compilateur sait que la variable n\'est plus nullable dans le bloc.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'int? a = getNullableValue();\nif (a != null) {\n  // Ici, a est automatiquement promu en int (non-nullable)\n  print(a + 1);\n}',
      ),
      Question(
        id: 'dart_null_q6',
        question: 'Quel est le résultat de ce code ?',
        options: [
          '10',
          '0',
          'null',
          'Erreur de compilation',
        ],
        correctIndex: 0,
        explanation:
            'L\'opérateur ?? retourne la valeur de gauche si elle n\'est pas null. Ici, x vaut 10 (non null), donc y prend la valeur 10. Le 0 n\'est utilisé que si x était null.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'int? x = 10;\nint y = x ?? 0;\nprint(y);',
      ),
      Question(
        id: 'dart_null_q7',
        question: 'Peut-on appeler `.isOdd` directement sur une variable de type `int?` ?',
        options: [
          'Oui, sans aucun problème',
          'Non, il faut d\'abord vérifier que la valeur n\'est pas null ou utiliser ?. ou !',
          'Oui, mais ça retourne null si la valeur est null',
          'Non, .isOdd n\'existe pas en Dart',
        ],
        correctIndex: 1,
        explanation:
            'Sur un type nullable (int?), on ne peut pas appeler directement les propriétés de int. Il faut soit vérifier la nullité avec un if, soit utiliser l\'opérateur ?. (appel conditionnel) ou ! (force unwrap, risqué). Le compilateur protège contre les accès sur null.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'int? a = 7;\n// a.isOdd;   // ERREUR de compilation\na?.isOdd;    // OK, retourne true ou null\na!.isOdd;    // OK si a non null, sinon crash',
      ),
      Question(
        id: 'dart_null_q8',
        question: 'Que fait l\'opérateur `??=` en Dart ?',
        options: [
          'Il compare deux valeurs et retourne un booléen',
          'Il assigne une valeur uniquement si la variable est actuellement null',
          'Il force une variable à être non-null',
          'Il convertit une valeur nullable en non-nullable',
        ],
        correctIndex: 1,
        explanation:
            'L\'opérateur ??= (null-aware assignment) assigne la valeur de droite à la variable de gauche UNIQUEMENT si celle-ci est null. Si elle a déjà une valeur non-null, rien ne change. C\'est un raccourci très pratique.',
        difficulty: Difficulty.avance,
        codeSnippet: 'int? a;\na ??= 5; // a vaut maintenant 5\na ??= 10; // a vaut toujours 5 (car a n\'est plus null)',
      ),
      Question(
        id: 'dart_null_q9',
        question: 'Quel est le type de retour de l\'expression `a?.toString()` si `a` est de type `int?` ?',
        options: [
          'String',
          'String?',
          'int?',
          'dynamic',
        ],
        correctIndex: 1,
        explanation:
            'L\'opérateur ?. (null-aware access) retourne null si l\'objet est null, donc le type de retour devient nullable. Même si toString() retourne normalement un String, l\'utilisation de ?. fait que le résultat est de type String?.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'dart_null_q10',
        question: 'Quel code compile sans erreur ?',
        options: [
          'int a = null;',
          'int? a = null;',
          'int a = null ?? 0;',
          'Les réponses B et C sont toutes les deux valides',
        ],
        correctIndex: 3,
        explanation:
            'La réponse B est valide car int? accepte null. La réponse C est aussi valide car l\'expression null ?? 0 évalue à 0 (un int), donc l\'affectation à int est correcte. La réponse A ne compile pas car int ne peut pas recevoir null.',
        difficulty: Difficulty.avance,
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 2: Dart - Fonctions & Paramètres
  // ============================================================
  const Category(
    id: 'dart_functions',
    name: 'Dart - Fonctions & Paramètres',
    description: 'Paramètres positionnels, nommés, optionnels, arrow functions',
    icon: '⚡',
    questions: [
      Question(
        id: 'dart_functions_q1',
        question: 'Quelle est la syntaxe correcte pour un paramètre nommé avec valeur par défaut ?',
        options: [
          'void foo(int x = 5) { }',
          'void foo({int x = 5}) { }',
          'void foo([int x = 5]) { }',
          'void foo(int? x = 5) { }',
        ],
        correctIndex: 1,
        explanation:
            'Les paramètres nommés sont déclarés entre accolades { }. On peut leur donner une valeur par défaut avec =. Les crochets [ ] sont pour les paramètres positionnels optionnels. Sans accolades ni crochets, c\'est un paramètre positionnel obligatoire.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_functions_q2',
        question: 'Que retourne l\'appel `foo("Alice")` avec la fonction suivante ?',
        options: [
          'Alice 0',
          'ALICE 0',
          'alice 0',
          'Erreur de compilation',
        ],
        correctIndex: 0,
        explanation:
            'Les paramètres nommés number et toUpperCase ont des valeurs par défaut (0 et false). Comme toUpperCase est false par défaut, le nom n\'est pas converti en majuscules. Le résultat est donc "Alice 0".',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'String foo(String name, {int number = 0, bool toUpperCase = false}) =>\n    \'\${(toUpperCase ? name.toUpperCase() : name)} \$number\';\n\nprint(foo("Alice"));',
      ),
      Question(
        id: 'dart_functions_q3',
        question: 'Que retourne l\'appel `foo("Bob", toUpperCase: true, number: 42)` ?',
        options: [
          'Bob 42',
          'BOB 42',
          'bob 42',
          'Erreur : les paramètres nommés sont dans le mauvais ordre',
        ],
        correctIndex: 1,
        explanation:
            'Les paramètres nommés peuvent être passés dans n\'importe quel ordre. Ici toUpperCase est true, donc name.toUpperCase() est appelé, donnant "BOB". Le number est 42. Le résultat est "BOB 42".',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'String foo(String name, {int number = 0, bool toUpperCase = false}) =>\n    \'\${(toUpperCase ? name.toUpperCase() : name)} \$number\';\n\nprint(foo("Bob", toUpperCase: true, number: 42));',
      ),
      Question(
        id: 'dart_functions_q4',
        question: 'Quelle est la différence entre une arrow function et une fonction classique ?',
        options: [
          'L\'arrow function est plus rapide à l\'exécution',
          'L\'arrow function ne peut contenir qu\'une seule expression et retourne implicitement sa valeur',
          'L\'arrow function ne peut pas prendre de paramètres',
          'Il n\'y a aucune différence, c\'est purement cosmétique et les deux sont identiques',
        ],
        correctIndex: 1,
        explanation:
            'La syntaxe => expr est un raccourci pour { return expr; }. Elle ne peut contenir qu\'une seule expression. Pour plusieurs instructions, il faut utiliser la syntaxe classique avec des accolades. Les performances sont identiques.',
        difficulty: Difficulty.debutant,
        codeSnippet: '// Arrow function\nint double(int x) => x * 2;\n\n// Équivalent classique\nint double(int x) {\n  return x * 2;\n}',
      ),
      Question(
        id: 'dart_functions_q5',
        question: 'Que fait `toUpperCase()` en Dart ?',
        options: [
          'Convertit un nombre en majuscule',
          'Convertit une chaîne en majuscules',
          'Convertit le premier caractère en majuscule',
          'Vérifie si la chaîne est en majuscules',
        ],
        correctIndex: 1,
        explanation:
            'La méthode toUpperCase() convertit tous les caractères d\'une chaîne String en majuscules. Par exemple, "hello".toUpperCase() retourne "HELLO". Pour ne mettre en majuscule que le premier caractère, il faudrait utiliser une autre approche.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_functions_q6',
        question: 'Comment fonctionne la string interpolation en Dart ?',
        options: [
          'On utilise + pour concaténer : "Bonjour " + name',
          'On utilise \$ pour les variables simples et \${} pour les expressions',
          'On utilise % comme en C : "Bonjour %s"',
          'On utilise f-strings comme en Python : f"Bonjour {name}"',
        ],
        correctIndex: 1,
        explanation:
            'En Dart, on utilise \$variable pour insérer une variable simple et \${expression} pour des expressions plus complexes dans une chaîne. Exemple : "Bonjour \$name, vous avez \${age + 1} ans".',
        difficulty: Difficulty.debutant,
        codeSnippet: 'String name = "Alice";\nint age = 25;\nprint(\'Bonjour \$name, vous avez \${age + 1} ans\');',
      ),
      Question(
        id: 'dart_functions_q7',
        question: 'Quelle est la différence entre paramètres positionnels optionnels et paramètres nommés ?',
        options: [
          'Les positionnels optionnels utilisent { } et les nommés utilisent [ ]',
          'Les positionnels optionnels utilisent [ ] et les nommés utilisent { }',
          'Il n\'y a pas de différence syntaxique',
          'Les paramètres nommés ne peuvent pas avoir de valeur par défaut',
        ],
        correctIndex: 1,
        explanation:
            'Les paramètres positionnels optionnels sont entre crochets [int x = 0] et doivent être passés dans l\'ordre. Les paramètres nommés sont entre accolades {int x = 0} et sont passés avec leur nom (x: valeur), dans n\'importe quel ordre.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: '// Positionnel optionnel\nvoid foo(String a, [int b = 0]) { }\nfoo("hi", 5);\n\n// Nommé\nvoid bar(String a, {int b = 0}) { }\nbar("hi", b: 5);',
      ),
      Question(
        id: 'dart_functions_q8',
        question: 'Que se passe-t-il si on appelle une fonction avec un paramètre nommé `required` sans le fournir ?',
        options: [
          'Le paramètre prend la valeur null',
          'Le paramètre prend la valeur par défaut 0',
          'Erreur de compilation',
          'Erreur à l\'exécution',
        ],
        correctIndex: 2,
        explanation:
            'Le mot-clé required devant un paramètre nommé le rend obligatoire. Si on ne le fournit pas lors de l\'appel, le compilateur génère une erreur. C\'est vérifié à la compilation, pas à l\'exécution.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'void greet({required String name}) {\n  print(\'Bonjour \$name\');\n}\n\ngreet(); // ERREUR de compilation : name est requis',
      ),
      Question(
        id: 'dart_functions_q9',
        question: 'Peut-on mélanger paramètres positionnels obligatoires et paramètres nommés dans la même fonction ?',
        options: [
          'Non, c\'est interdit en Dart',
          'Oui, mais les positionnels doivent être déclarés avant les nommés',
          'Oui, dans n\'importe quel ordre',
          'Oui, mais seulement avec des arrow functions',
        ],
        correctIndex: 1,
        explanation:
            'On peut combiner les deux, mais les paramètres positionnels obligatoires doivent toujours être déclarés en premier, suivis des paramètres nommés entre accolades. C\'est exactement le pattern de la fonction foo(String name, {int number = 0}).',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'dart_functions_q10',
        question: 'Quel est le résultat de ce code ?',
        options: [
          'hello world',
          'HELLO WORLD',
          'Hello World',
          'Erreur de compilation',
        ],
        correctIndex: 1,
        explanation:
            'La fonction transform prend un String et une Function en paramètre. On lui passe la méthode toUpperCase comme référence de fonction. Celle-ci est appliquée à "hello world", donnant "HELLO WORLD".',
        difficulty: Difficulty.avance,
        codeSnippet: 'String transform(String s, String Function(String) fn) => fn(s);\n\nprint(transform("hello world", (s) => s.toUpperCase()));',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 3: Dart - Collections
  // ============================================================
  const Category(
    id: 'dart_collections',
    name: 'Dart - Collections',
    description: 'Listes, Map, sort, map, where, passage par référence',
    icon: '📦',
    questions: [
      Question(
        id: 'dart_collections_q1',
        question: 'Après l\'exécution de ce code, quel est l\'ordre de la liste ?',
        options: [
          '[12, 25, 42, 79]',
          '[79, 42, 25, 12]',
          '[25, 42, 79, 12]',
          '[12, 79, 42, 25]',
        ],
        correctIndex: 1,
        explanation:
            'b.compareTo(a) trie en ordre décroissant (du plus grand au plus petit). Si on avait utilisé a.compareTo(b), l\'ordre serait croissant. La convention est : compareTo retourne un nombre négatif si le premier est plus petit.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final list = [25, 42, 79, 12];\nlist.sort((a, b) => b.compareTo(a));',
      ),
      Question(
        id: 'dart_collections_q2',
        question: 'Quel est le type de retour de `.map()` sur une List en Dart ?',
        options: [
          'List',
          'Iterable',
          'Set',
          'Map',
        ],
        correctIndex: 1,
        explanation:
            '.map() retourne un Iterable, PAS une List. C\'est une évaluation paresseuse (lazy). Pour obtenir une List, il faut appeler .toList() après le .map(). C\'est une erreur fréquente chez les débutants.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final list = [1, 2, 3];\nvar result = list.map((e) => e * 2);\n// result est un Iterable<int>, pas une List<int>\nvar resultList = result.toList(); // Maintenant c\'est une List',
      ),
      Question(
        id: 'dart_collections_q3',
        question: 'Que retourne ce code ?',
        options: [
          '[2, 4]',
          '[1, 3, 5]',
          '[2, 4, 6]',
          'Un Iterable contenant [2, 4]',
        ],
        correctIndex: 3,
        explanation:
            '.where() filtre les éléments selon une condition et retourne un Iterable (pas une List). .isEven teste si un nombre est pair. Ici, seuls 2 et 4 passent le filtre. Pour obtenir une List, il faudrait appeler .toList().',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final numbers = [1, 2, 3, 4, 5];\nvar result = numbers.where((e) => e.isEven);',
      ),
      Question(
        id: 'dart_collections_q4',
        question: 'Que vaut `listB` après l\'exécution de ce code ?',
        options: [
          '[1, 2, 3]',
          '[1, 2, 3, 99]',
          'null',
          'Erreur de compilation',
        ],
        correctIndex: 1,
        explanation:
            'En Dart, les listes sont passées par référence. Quand on écrit listB = listA, les deux variables pointent vers le MÊME objet en mémoire. Modifier listA modifie aussi listB. C\'est un piège classique !',
        difficulty: Difficulty.avance,
        codeSnippet: 'var listA = [1, 2, 3];\nvar listB = listA;\nlistA.add(99);\nprint(listB);',
      ),
      Question(
        id: 'dart_collections_q5',
        question: 'Comment créer une copie indépendante d\'une liste en Dart ?',
        options: [
          'var copy = list;',
          'var copy = List.from(list); ou var copy = [...list];',
          'var copy = list.clone();',
          'var copy = list.duplicate();',
        ],
        correctIndex: 1,
        explanation:
            'Pour copier une liste sans conserver la référence, on utilise List.from(list) ou l\'opérateur spread [...list]. Ces deux méthodes créent une nouvelle liste avec les mêmes éléments. var copy = list ne fait que copier la référence !',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'var original = [1, 2, 3];\nvar copy1 = List.from(original);\nvar copy2 = [...original];\noriginal.add(4);\n// copy1 et copy2 valent toujours [1, 2, 3]',
      ),
      Question(
        id: 'dart_collections_q6',
        question: 'Quelle est la différence entre `a.compareTo(b)` et `b.compareTo(a)` dans un sort ?',
        options: [
          'Aucune différence',
          'a.compareTo(b) trie en ordre croissant, b.compareTo(a) en ordre décroissant',
          'a.compareTo(b) trie en ordre décroissant, b.compareTo(a) en ordre croissant',
          'Les deux trient en ordre croissant mais avec des performances différentes',
        ],
        correctIndex: 1,
        explanation:
            'compareTo retourne un nombre négatif si le premier est plus petit, 0 si égaux, positif si plus grand. Avec a.compareTo(b), les plus petits sont placés en premier (croissant). Inverser donne l\'ordre décroissant.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'dart_collections_q7',
        question: 'Que fait `.forEach()` sur une liste ?',
        options: [
          'Il retourne une nouvelle liste transformée',
          'Il filtre les éléments de la liste',
          'Il exécute une action sur chaque élément sans retourner de valeur',
          'Il trie la liste',
        ],
        correctIndex: 2,
        explanation:
            '.forEach() exécute une fonction sur chaque élément de la liste mais ne retourne rien (void). Contrairement à .map() qui retourne un Iterable transformé, .forEach() est utilisé pour les effets de bord comme print().',
        difficulty: Difficulty.debutant,
        codeSnippet: 'final fruits = [\'pomme\', \'banane\', \'cerise\'];\nfruits.forEach((fruit) => print(fruit));',
      ),
      Question(
        id: 'dart_collections_q8',
        question: 'Quel est le résultat de ce code ?',
        options: [
          '{name: Alice, age: 30}',
          '{name: Alice, age: 25}',
          'Erreur de compilation',
          'Erreur à l\'exécution',
        ],
        correctIndex: 0,
        explanation:
            'Un Map associe des clés à des valeurs. On peut modifier la valeur associée à une clé existante avec map[clé] = nouvelleValeur. Ici, la clé "age" passe de 25 à 30.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'var map = {\'name\': \'Alice\', \'age\': 25};\nmap[\'age\'] = 30;\nprint(map);',
      ),
      Question(
        id: 'dart_collections_q9',
        question: 'Que vaut `result` après ce code ?',
        options: [
          '[2, 4, 6, 8, 10]',
          '[1, 2, 3, 4, 5]',
          'Un Iterable de [2, 4, 6, 8, 10]',
          'Erreur car map et toList sont incompatibles',
        ],
        correctIndex: 0,
        explanation:
            '.map() transforme chaque élément et retourne un Iterable. En appelant .toList() ensuite, on convertit cet Iterable en List. Le résultat est bien une List<int> contenant [2, 4, 6, 8, 10].',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final numbers = [1, 2, 3, 4, 5];\nfinal result = numbers.map((e) => e * 2).toList();',
      ),
      Question(
        id: 'dart_collections_q10',
        question: 'Que fait le mot-clé `final` sur une liste ?',
        options: [
          'La liste et son contenu sont immuables',
          'La référence est immuable mais le contenu peut être modifié',
          'Le contenu est immuable mais la référence peut changer',
          'Aucun effet sur les listes',
        ],
        correctIndex: 1,
        explanation:
            'final empêche de réassigner la variable à une nouvelle liste, mais le CONTENU de la liste peut toujours être modifié (add, remove, sort...). Pour une liste totalement immuable, utilisez const ou List.unmodifiable().',
        difficulty: Difficulty.avance,
        codeSnippet: 'final list = [1, 2, 3];\nlist.add(4);     // OK : on modifie le contenu\n// list = [5, 6]; // ERREUR : on ne peut pas réassigner',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 4: Dart - Programmation Asynchrone
  // ============================================================
  const Category(
    id: 'dart_async',
    name: 'Dart - Programmation Asynchrone',
    description: 'Future, async, await, programmation asynchrone',
    icon: '🔄',
    questions: [
      Question(
        id: 'dart_async_q1',
        question: 'Quelle est la différence entre `int` et `Future<int>` ?',
        options: [
          'Future<int> est plus rapide',
          'int est une valeur immédiate, Future<int> est une promesse de valeur qui arrivera plus tard',
          'Future<int> peut contenir null, int ne peut pas',
          'Il n\'y a pas de différence pratique',
        ],
        correctIndex: 1,
        explanation:
            'Un Future<int> représente une valeur entière qui n\'est pas encore disponible. C\'est une promesse qu\'un int sera fourni dans le futur (après une opération asynchrone comme une requête réseau). On utilise await pour attendre cette valeur.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_async_q2',
        question: 'Que signifie le mot-clé `async` devant une fonction ?',
        options: [
          'La fonction s\'exécute dans un thread séparé',
          'La fonction retourne automatiquement un Future et peut utiliser await',
          'La fonction est plus rapide',
          'La fonction ne peut pas retourner de valeur',
        ],
        correctIndex: 1,
        explanation:
            'Le mot-clé async marque une fonction comme asynchrone. Elle retourne automatiquement un Future et permet l\'utilisation de await à l\'intérieur. Attention : Dart est mono-thread, async ne crée PAS de nouveau thread.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'Future<String> fetchData() async {\n  final response = await getFromServer();\n  return response;\n}',
      ),
      Question(
        id: 'dart_async_q3',
        question: 'Que fait `await` en Dart ?',
        options: [
          'Il bloque tout le programme en attendant le résultat',
          'Il met en pause la fonction actuelle et libère le thread pour d\'autres tâches',
          'Il crée un nouveau thread',
          'Il annule l\'opération si elle prend trop de temps',
        ],
        correctIndex: 1,
        explanation:
            'await suspend l\'exécution de la fonction async actuelle jusqu\'à ce que le Future soit complété, mais ne bloque PAS le thread principal. D\'autres événements (UI, animations) peuvent continuer à être traités pendant ce temps.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'dart_async_q4',
        question: 'Pourquoi les requêtes réseau sont-elles asynchrones ?',
        options: [
          'Pour économiser la batterie',
          'Parce que le réseau est lent et on ne veut pas bloquer l\'interface utilisateur',
          'Parce que le serveur l\'exige',
          'Ce n\'est pas obligatoire, c\'est juste une convention',
        ],
        correctIndex: 1,
        explanation:
            'Les requêtes réseau prennent un temps variable (millisecondes à secondes). Si on bloquait le thread principal en attendant la réponse, l\'UI serait figée. L\'asynchrone permet à l\'interface de rester réactive pendant l\'attente.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_async_q5',
        question: 'Que fait `Future.delayed()` ?',
        options: [
          'Il accélère l\'exécution d\'un Future',
          'Il crée un Future qui se complète après un délai donné',
          'Il annule un Future en cours',
          'Il retente un Future échoué après un délai',
        ],
        correctIndex: 1,
        explanation:
            'Future.delayed() crée un Future qui se complète après la durée spécifiée. C\'est utile pour simuler des opérations asynchrones (tests, démos) ou pour introduire un délai intentionnel.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Future<String> simulateNetwork() async {\n  await Future.delayed(Duration(seconds: 2));\n  return \'Données reçues\';\n}',
      ),
      Question(
        id: 'dart_async_q6',
        question: 'Comment gérer les erreurs dans une fonction async ?',
        options: [
          'Avec if/else',
          'Avec try/catch',
          'Les fonctions async ne peuvent pas échouer',
          'Avec l\'opérateur ??',
        ],
        correctIndex: 1,
        explanation:
            'On utilise try/catch pour capturer les exceptions dans les fonctions async. Le catch intercepte les erreurs levées par les Futures (erreur réseau, timeout, etc.). C\'est essentiel pour une bonne gestion d\'erreurs.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Future<void> fetchData() async {\n  try {\n    final data = await api.getData();\n    print(data);\n  } catch (e) {\n    print(\'Erreur : \$e\');\n  }\n}',
      ),
      Question(
        id: 'dart_async_q7',
        question: 'Quel est le résultat de ce code ?',
        options: [
          'A, B, C',
          'A, C, B',
          'C, A, B',
          'B, A, C',
        ],
        correctIndex: 1,
        explanation:
            'print("A") s\'exécute immédiatement. Ensuite, Future.delayed lance une tâche asynchrone de 1 seconde (print("B")). Comme on n\'utilise pas await, l\'exécution continue immédiatement avec print("C"). "B" est affiché après le délai.',
        difficulty: Difficulty.avance,
        codeSnippet: 'void main() {\n  print("A");\n  Future.delayed(Duration(seconds: 1), () => print("B"));\n  print("C");\n}',
      ),
      Question(
        id: 'dart_async_q8',
        question: 'Peut-on utiliser `await` en dehors d\'une fonction `async` ?',
        options: [
          'Oui, n\'importe où',
          'Oui, mais seulement dans main()',
          'Non, await ne peut être utilisé que dans une fonction marquée async',
          'Oui, mais avec une syntaxe spéciale',
        ],
        correctIndex: 2,
        explanation:
            'Le mot-clé await ne peut être utilisé que dans le corps d\'une fonction marquée avec async. L\'utiliser ailleurs provoque une erreur de compilation. C\'est une règle stricte du langage Dart.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'dart_async_q9',
        question: 'Que retourne une fonction `async` qui ne retourne explicitement rien ?',
        options: [
          'null',
          'void',
          'Future<void>',
          'Erreur de compilation',
        ],
        correctIndex: 2,
        explanation:
            'Une fonction async retourne toujours un Future. Si elle ne retourne pas de valeur explicitement, son type de retour est Future<void>. Même void est wrappé dans un Future car la fonction est asynchrone.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Future<void> doSomething() async {\n  await Future.delayed(Duration(seconds: 1));\n  print(\'Fait !\');\n  // pas de return explicite => Future<void>\n}',
      ),
      Question(
        id: 'dart_async_q10',
        question: 'Que fait `Future.wait()` ?',
        options: [
          'Il attend indéfiniment un seul Future',
          'Il exécute plusieurs Futures en parallèle et attend qu\'ils soient tous terminés',
          'Il annule tous les Futures en cours',
          'Il crée un délai entre chaque Future',
        ],
        correctIndex: 1,
        explanation:
            'Future.wait() prend une liste de Futures et retourne un Future qui se complète quand TOUS les Futures de la liste sont terminés. C\'est utile pour lancer plusieurs requêtes réseau en parallèle et attendre toutes les réponses.',
        difficulty: Difficulty.avance,
        codeSnippet: 'final results = await Future.wait([\n  fetchUser(),\n  fetchOrders(),\n  fetchSettings(),\n]);\n// results contient les 3 résultats',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 5: Flutter - Widgets de Base
  // ============================================================
  const Category(
    id: 'flutter_widgets',
    name: 'Flutter - Widgets de Base',
    description: 'Scaffold, AppBar, Column, Row, Text, Padding, SizedBox',
    icon: '🧱',
    questions: [
      Question(
        id: 'flutter_widgets_q1',
        question: 'Quel widget fournit la structure de base d\'un écran Flutter (appBar, body, floatingActionButton) ?',
        options: [
          'MaterialApp',
          'Container',
          'Scaffold',
          'Column',
        ],
        correctIndex: 2,
        explanation:
            'Le Scaffold est le widget de structure de base pour un écran Material Design. Il fournit des slots pour l\'AppBar, le body, le FloatingActionButton, le Drawer, le BottomNavigationBar, etc.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'Scaffold(\n  appBar: AppBar(title: Text(\'Mon App\')),\n  body: Center(child: Text(\'Contenu\')),\n  floatingActionButton: FloatingActionButton(\n    onPressed: () {},\n    child: Icon(Icons.add),\n  ),\n)',
      ),
      Question(
        id: 'flutter_widgets_q2',
        question: 'Quelle propriété d\'AppBar permet de centrer le titre ?',
        options: [
          'alignment: center',
          'centerTitle: true',
          'titleAlignment: TextAlign.center',
          'textAlign: center',
        ],
        correctIndex: 1,
        explanation:
            'La propriété centerTitle de AppBar accepte un booléen. Quand elle vaut true, le titre est centré horizontalement. Par défaut, sur Android le titre est à gauche, sur iOS il est centré.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'AppBar(\n  title: Text(\'Mon titre\'),\n  centerTitle: true,\n  backgroundColor: Colors.blue,\n)',
      ),
      Question(
        id: 'flutter_widgets_q3',
        question: 'Quelle est la différence entre Column et Row ?',
        options: [
          'Column affiche ses enfants horizontalement, Row verticalement',
          'Column affiche ses enfants verticalement, Row horizontalement',
          'Column est pour le texte, Row pour les images',
          'Il n\'y a pas de différence',
        ],
        correctIndex: 1,
        explanation:
            'Column dispose ses enfants (children) verticalement de haut en bas. Row les dispose horizontalement de gauche à droite. Les deux partagent les mêmes propriétés d\'alignement : mainAxisAlignment et crossAxisAlignment.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_widgets_q4',
        question: 'Que fait `mainAxisAlignment: MainAxisAlignment.spaceBetween` dans une Column ?',
        options: [
          'Centre tous les widgets',
          'Met un espace égal entre chaque widget, sans espace au début ni à la fin',
          'Met un espace uniquement au début et à la fin',
          'Empile les widgets sans espace',
        ],
        correctIndex: 1,
        explanation:
            'spaceBetween distribue l\'espace libre uniformément ENTRE les enfants. Le premier widget est collé en haut et le dernier en bas. C\'est différent de spaceAround (espace autour de chaque widget) et spaceEvenly (espace égal partout).',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_widgets_q5',
        question: 'Quelle est la différence entre Padding et SizedBox pour ajouter de l\'espace ?',
        options: [
          'Aucune différence',
          'Padding ajoute de l\'espace autour d\'un widget, SizedBox crée un widget vide de taille fixe',
          'SizedBox ajoute du padding, Padding crée une boîte vide',
          'Padding est pour les listes, SizedBox pour les grilles',
        ],
        correctIndex: 1,
        explanation:
            'Padding entoure un enfant avec de l\'espace (marge intérieure) via EdgeInsets. SizedBox crée une boîte de taille fixe qui peut servir d\'espacement entre deux widgets (SizedBox(height: 16)) ou contraindre la taille d\'un enfant.',
        difficulty: Difficulty.debutant,
        codeSnippet: '// Padding autour d\'un widget\nPadding(\n  padding: EdgeInsets.all(16),\n  child: Text(\'Hello\'),\n)\n\n// Espace entre deux widgets\nSizedBox(height: 16)',
      ),
      Question(
        id: 'flutter_widgets_q6',
        question: 'Comment styliser un widget Text en Flutter ?',
        options: [
          'Text(\'Hello\', css: \'color: red\')',
          'Text(\'Hello\', style: TextStyle(color: Colors.red, fontSize: 20))',
          'Text(\'Hello\').color(Colors.red)',
          'StyledText(\'Hello\', color: Colors.red)',
        ],
        correctIndex: 1,
        explanation:
            'Le widget Text accepte un paramètre style de type TextStyle. On y définit la couleur (color), la taille (fontSize), le poids (fontWeight), etc. C\'est l\'approche déclarative de Flutter, différente du CSS web.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'Text(\n  \'Bonjour\',\n  style: TextStyle(\n    color: Colors.blue,\n    fontSize: 24,\n    fontWeight: FontWeight.bold,\n  ),\n)',
      ),
      Question(
        id: 'flutter_widgets_q7',
        question: 'Que fait le widget Expanded dans une Row ?',
        options: [
          'Il rend le widget invisible',
          'Il fait prendre au widget tout l\'espace restant disponible',
          'Il ajoute une bordure au widget',
          'Il ajoute un padding automatique',
        ],
        correctIndex: 1,
        explanation:
            'Expanded force son enfant à occuper tout l\'espace restant le long de l\'axe principal. Dans une Row, il s\'étend horizontalement. On peut utiliser plusieurs Expanded avec des flex différents pour partager l\'espace proportionnellement.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Row(\n  children: [\n    Text(\'Label\'),\n    Expanded(\n      child: TextField(),\n    ),\n    IconButton(icon: Icon(Icons.send), onPressed: () {}),\n  ],\n)',
      ),
      Question(
        id: 'flutter_widgets_q8',
        question: 'Quelle est la différence entre `EdgeInsets.all(16)` et `EdgeInsets.symmetric(horizontal: 16, vertical: 8)` ?',
        options: [
          'all() met 16 pixels de chaque côté, symmetric() met 16 pixels à gauche/droite et 8 pixels en haut/bas',
          'Aucune différence',
          'all() est pour les Column, symmetric() est pour les Row',
          'all() met 16 pixels seulement en haut, symmetric() est réparti',
        ],
        correctIndex: 0,
        explanation:
            'EdgeInsets.all(16) applique un padding uniforme de 16 pixels sur les 4 côtés. EdgeInsets.symmetric() permet de définir des valeurs différentes pour l\'horizontal (gauche/droite) et le vertical (haut/bas).',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_widgets_q9',
        question: 'Quel widget permet de superposer des widgets les uns sur les autres ?',
        options: [
          'Column',
          'Row',
          'Stack',
          'Wrap',
        ],
        correctIndex: 2,
        explanation:
            'Stack superpose ses enfants les uns sur les autres (comme des calques). Le premier enfant est en arrière-plan. On utilise Positioned à l\'intérieur d\'un Stack pour placer précisément les widgets superposés.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Stack(\n  children: [\n    Image.asset(\'background.png\'),\n    Positioned(\n      bottom: 16,\n      right: 16,\n      child: Text(\'Overlay\'),\n    ),\n  ],\n)',
      ),
      Question(
        id: 'flutter_widgets_q10',
        question: 'Que fait le widget Center ?',
        options: [
          'Il centre le texte dans un Text widget',
          'Il centre son enfant unique au milieu de l\'espace disponible',
          'Il centre une Row horizontalement',
          'Il est identique à mainAxisAlignment.center',
        ],
        correctIndex: 1,
        explanation:
            'Le widget Center positionne son unique enfant (child) au centre de l\'espace disponible du parent, à la fois horizontalement et verticalement. C\'est un raccourci pour Align(alignment: Alignment.center).',
        difficulty: Difficulty.debutant,
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 6: Flutter - Formulaires & Inputs
  // ============================================================
  const Category(
    id: 'flutter_forms',
    name: 'Flutter - Formulaires & Inputs',
    description: 'TextField, InputDecoration, bordures, validation',
    icon: '📝',
    questions: [
      Question(
        id: 'flutter_forms_q1',
        question: 'Quelle propriété de TextField permet de donner le focus automatiquement à l\'ouverture de l\'écran ?',
        options: [
          'focus: true',
          'autoFocus: true',
          'autofocus: true',
          'requestFocus: true',
        ],
        correctIndex: 2,
        explanation:
            'La propriété autofocus (en minuscule, sans camelCase) de TextField, quand elle vaut true, donne automatiquement le focus au champ dès que le widget est affiché. Le clavier s\'ouvre automatiquement sur mobile.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_forms_q2',
        question: 'À quoi sert la propriété `prefixIcon` dans InputDecoration ?',
        options: [
          'Ajouter un bouton à droite du champ',
          'Ajouter une icône au début (à gauche) du champ de saisie',
          'Ajouter un label au-dessus du champ',
          'Ajouter un texte d\'aide en dessous du champ',
        ],
        correctIndex: 1,
        explanation:
            'prefixIcon place une icône à l\'intérieur du champ, à gauche. C\'est souvent utilisé pour indiquer le type de contenu attendu (email, mot de passe, recherche...). Il existe aussi suffixIcon pour une icône à droite.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'TextField(\n  decoration: InputDecoration(\n    prefixIcon: const Icon(Icons.email_outlined),\n    hintText: \'Email address\',\n  ),\n)',
      ),
      Question(
        id: 'flutter_forms_q3',
        question: 'Quelle est la différence entre `enabledBorder` et `focusedBorder` dans InputDecoration ?',
        options: [
          'enabledBorder est la bordure par défaut, focusedBorder est la bordure quand le champ a le focus',
          'enabledBorder active la bordure, focusedBorder la désactive',
          'enabledBorder est pour les champs actifs, focusedBorder pour les champs désactivés',
          'Il n\'y a pas de différence',
        ],
        correctIndex: 0,
        explanation:
            'enabledBorder définit l\'apparence de la bordure quand le champ est activé mais n\'a PAS le focus. focusedBorder définit la bordure quand l\'utilisateur est en train de taper (le champ a le focus). Cela permet de donner un feedback visuel.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'InputDecoration(\n  enabledBorder: OutlineInputBorder(\n    borderRadius: BorderRadius.circular(12),\n    borderSide: BorderSide(color: Colors.grey),\n  ),\n  focusedBorder: OutlineInputBorder(\n    borderRadius: BorderRadius.circular(12),\n    borderSide: BorderSide(color: Colors.blue, width: 2),\n  ),\n)',
      ),
      Question(
        id: 'flutter_forms_q4',
        question: 'Que fait `BorderRadius.circular(12)` ?',
        options: [
          'Crée une bordure de 12 pixels d\'épaisseur',
          'Crée des coins arrondis avec un rayon de 12 pixels sur tous les coins',
          'Crée un cercle de 12 pixels de diamètre',
          'Crée une marge de 12 pixels autour de la bordure',
        ],
        correctIndex: 1,
        explanation:
            'BorderRadius.circular(12) applique un arrondi uniforme de 12 pixels sur les 4 coins d\'un widget. Plus la valeur est grande, plus les coins sont arrondis. C\'est souvent utilisé avec OutlineInputBorder ou Container.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_forms_q5',
        question: 'Comment récupérer la valeur saisie par l\'utilisateur dans un TextField ?',
        options: [
          'En utilisant TextField.value',
          'En utilisant le callback onChanged avec setState',
          'La valeur est automatiquement accessible via une variable globale',
          'En utilisant TextField.getText()',
        ],
        correctIndex: 1,
        explanation:
            'Le callback onChanged est appelé à chaque modification du texte. On utilise setState pour mettre à jour une variable d\'état avec la nouvelle valeur. On peut aussi utiliser un TextEditingController pour un contrôle plus fin.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'String _email = \'\';\n\nTextField(\n  onChanged: (String value) {\n    setState(() {\n      _email = value;\n    });\n  },\n)',
      ),
      Question(
        id: 'flutter_forms_q6',
        question: 'Que fait la propriété `hintText` dans InputDecoration ?',
        options: [
          'Affiche un label permanent au-dessus du champ',
          'Affiche un texte indicatif grisé qui disparaît quand on tape',
          'Affiche un message d\'erreur en rouge',
          'Affiche un texte d\'aide en dessous du champ',
        ],
        correctIndex: 1,
        explanation:
            'hintText affiche un texte d\'indication (placeholder) à l\'intérieur du champ quand il est vide. Il disparaît dès que l\'utilisateur commence à taper. hintStyle permet de personnaliser son apparence (couleur, taille...).',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_forms_q7',
        question: 'Quel est le rôle de `OutlineInputBorder` ?',
        options: [
          'Créer un champ de texte sans bordure',
          'Créer une bordure rectangulaire (ou arrondie) autour du champ de saisie',
          'Créer une bordure uniquement en bas du champ',
          'Créer une ombre autour du champ',
        ],
        correctIndex: 1,
        explanation:
            'OutlineInputBorder dessine une bordure complète autour du champ (les 4 côtés). C\'est différent de UnderlineInputBorder qui ne dessine qu\'une ligne en bas. On peut personnaliser les coins avec borderRadius et le style avec borderSide.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'OutlineInputBorder(\n  borderRadius: BorderRadius.circular(12),\n  borderSide: BorderSide(\n    color: Colors.grey,\n    width: 1.5,\n  ),\n)',
      ),
      Question(
        id: 'flutter_forms_q8',
        question: 'Quel code crée correctement un champ email complet avec icône, placeholder et bordures arrondies ?',
        options: [
          'TextField(hint: "Email", icon: Icons.email)',
          'EmailField(placeholder: "Email")',
          'TextField avec InputDecoration contenant prefixIcon, hintText et des bordures OutlineInputBorder',
          'TextInput(type: "email", placeholder: "Email")',
        ],
        correctIndex: 2,
        explanation:
            'En Flutter, on personnalise un TextField via le paramètre decoration de type InputDecoration. On y place prefixIcon pour l\'icône, hintText pour le placeholder, et enabledBorder/focusedBorder pour les bordures.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'TextField(\n  decoration: InputDecoration(\n    prefixIcon: const Icon(Icons.email_outlined),\n    hintText: \'Email address\',\n    enabledBorder: OutlineInputBorder(\n      borderRadius: BorderRadius.circular(12),\n    ),\n    focusedBorder: OutlineInputBorder(\n      borderRadius: BorderRadius.circular(12),\n      borderSide: BorderSide(color: Colors.blue),\n    ),\n  ),\n)',
      ),
      Question(
        id: 'flutter_forms_q9',
        question: 'Quelle propriété de InputDecoration permet de personnaliser le style du texte indicatif (hint) ?',
        options: [
          'hintColor',
          'hintStyle',
          'placeholderStyle',
          'textHintStyle',
        ],
        correctIndex: 1,
        explanation:
            'hintStyle accepte un TextStyle qui permet de personnaliser la couleur, la taille, le poids et d\'autres propriétés du texte indicatif (hint). Par exemple : hintStyle: TextStyle(color: Colors.grey[400]).',
        difficulty: Difficulty.debutant,
        codeSnippet: 'InputDecoration(\n  hintText: \'Entrez votre email\',\n  hintStyle: TextStyle(\n    color: Colors.grey[400],\n    fontSize: 14,\n  ),\n)',
      ),
      Question(
        id: 'flutter_forms_q10',
        question: 'Quelle est la différence entre `onChanged` et `onSubmitted` dans un TextField ?',
        options: [
          'Aucune différence',
          'onChanged est appelé à chaque caractère tapé, onSubmitted quand l\'utilisateur valide (touche Entrée)',
          'onChanged est appelé à la validation, onSubmitted à chaque caractère',
          'onChanged est pour le texte, onSubmitted pour les nombres',
        ],
        correctIndex: 1,
        explanation:
            'onChanged est déclenché à CHAQUE modification du texte (ajout ou suppression d\'un caractère). onSubmitted n\'est déclenché que quand l\'utilisateur appuie sur le bouton de validation du clavier (Entrée / Done).',
        difficulty: Difficulty.intermediaire,
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 7: Flutter - Boutons & Interactions
  // ============================================================
  const Category(
    id: 'flutter_buttons',
    name: 'Flutter - Boutons & Interactions',
    description: 'FilledButton, OutlinedButton, onPressed, styleFrom',
    icon: '🔘',
    questions: [
      Question(
        id: 'flutter_buttons_q1',
        question: 'Que se passe-t-il quand on passe `null` à la propriété `onPressed` d\'un bouton ?',
        options: [
          'Le bouton déclenche une action vide',
          'Le bouton est désactivé (grisé et non cliquable)',
          'Une erreur de compilation',
          'Le bouton est invisible',
        ],
        correctIndex: 1,
        explanation:
            'Quand onPressed est null, Flutter désactive automatiquement le bouton : il apparaît grisé et ne réagit pas aux taps. C\'est la façon standard de désactiver un bouton en Flutter.',
        difficulty: Difficulty.debutant,
        codeSnippet: '// Bouton désactivé\nFilledButton(\n  onPressed: null,\n  child: Text(\'Valider\'),\n)\n\n// Bouton activé\nFilledButton(\n  onPressed: () { print(\'cliqué\'); },\n  child: Text(\'Valider\'),\n)',
      ),
      Question(
        id: 'flutter_buttons_q2',
        question: 'Quelle est la différence entre FilledButton et OutlinedButton ?',
        options: [
          'FilledButton a un fond coloré, OutlinedButton n\'a qu\'une bordure sans fond coloré',
          'OutlinedButton a un fond coloré, FilledButton n\'a qu\'une bordure',
          'FilledButton est cliquable, OutlinedButton ne l\'est pas',
          'Il n\'y a pas de différence visuelle',
        ],
        correctIndex: 0,
        explanation:
            'FilledButton affiche un bouton avec un fond de couleur plein (rempli). OutlinedButton affiche un bouton avec seulement une bordure et un fond transparent. ElevatedButton est une variante avec une ombre portée.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_buttons_q3',
        question: 'Comment activer un bouton uniquement quand l\'email n\'est pas vide ?',
        options: [
          'onPressed: _email.isNotEmpty',
          'onPressed: _email.isNotEmpty ? () { validate(); } : null',
          'enabled: _email.isNotEmpty',
          'disabled: _email.isEmpty',
        ],
        correctIndex: 1,
        explanation:
            'On utilise une expression ternaire : si _email.isNotEmpty est true, on passe une fonction à onPressed (bouton activé). Sinon, on passe null (bouton désactivé). C\'est un pattern très courant en Flutter.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'FilledButton(\n  onPressed: _email.isNotEmpty\n      ? () { validate(); }\n      : null,\n  child: Text(\'Valider\'),\n)',
      ),
      Question(
        id: 'flutter_buttons_q4',
        question: 'Que fait `FilledButton.styleFrom()` ?',
        options: [
          'Il crée un nouveau FilledButton',
          'Il crée un ButtonStyle à partir de propriétés simples comme backgroundColor et foregroundColor',
          'Il copie le style d\'un autre bouton',
          'Il supprime le style par défaut du bouton',
        ],
        correctIndex: 1,
        explanation:
            'styleFrom() est une factory method qui simplifie la création d\'un ButtonStyle. Au lieu de manipuler des MaterialStateProperty complexes, on passe directement des couleurs, des tailles, etc.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'FilledButton(\n  style: FilledButton.styleFrom(\n    foregroundColor: Colors.white,\n    backgroundColor: Colors.blue,\n    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),\n  ),\n  onPressed: () {},\n  child: Text(\'Mon bouton\'),\n)',
      ),
      Question(
        id: 'flutter_buttons_q5',
        question: 'Quel est le type de la propriété `onPressed` d\'un bouton Flutter ?',
        options: [
          'Function',
          'VoidCallback? (c\'est-à-dire void Function()?)',
          'bool',
          'EventHandler',
        ],
        correctIndex: 1,
        explanation:
            'onPressed est de type VoidCallback?, qui est un alias pour void Function()?. Le ? signifie qu\'il peut être null (pour désactiver le bouton). VoidCallback est une fonction sans paramètre et sans valeur de retour.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_buttons_q6',
        question: 'Qu\'est-ce qu\'un ValueChanged<T> en Flutter ?',
        options: [
          'Un widget qui change de valeur',
          'Un typedef pour void Function(T), un callback qui reçoit une valeur de type T',
          'Une classe pour observer les changements de valeur',
          'Un type de variable qui notifie ses changements',
        ],
        correctIndex: 1,
        explanation:
            'ValueChanged<T> est un typedef pour void Function(T value). C\'est utilisé partout dans Flutter : onChanged de TextField est un ValueChanged<String>, onChanged de Slider est un ValueChanged<double>, etc.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_buttons_q7',
        question: 'Comment créer un séparateur horizontal avec le texte "ou" au milieu entre deux boutons ?',
        options: [
          'Divider(text: "ou")',
          'Separator(label: "ou")',
          'Row avec deux Expanded(child: Divider()) et un Text("ou") au milieu',
          'OrDivider()',
        ],
        correctIndex: 2,
        explanation:
            'Flutter n\'a pas de widget "séparateur avec texte" par défaut. On le construit avec une Row contenant un Expanded + Divider, un Text("ou") au milieu, et un autre Expanded + Divider. C\'est un pattern classique de formulaire.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'Row(\n  children: [\n    Expanded(child: Divider()),\n    Padding(\n      padding: EdgeInsets.symmetric(horizontal: 16),\n      child: Text(\'ou\'),\n    ),\n    Expanded(child: Divider()),\n  ],\n)',
      ),
      Question(
        id: 'flutter_buttons_q8',
        question: 'Quelle est la différence entre ElevatedButton, FilledButton et OutlinedButton ?',
        options: [
          'ElevatedButton a une ombre, FilledButton est plat et rempli, OutlinedButton n\'a qu\'une bordure',
          'Ce sont trois noms pour le même widget',
          'ElevatedButton est l\'ancien nom de FilledButton',
          'OutlinedButton a une ombre, ElevatedButton est plat',
        ],
        correctIndex: 0,
        explanation:
            'ElevatedButton est surélevé avec une ombre portée. FilledButton est rempli d\'une couleur mais plat (pas d\'ombre). OutlinedButton n\'a qu\'une bordure sans remplissage. Ce sont les 3 variantes Material Design 3.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_buttons_q9',
        question: 'Comment ajouter une icône à un bouton en Flutter ?',
        options: [
          'FilledButton(icon: Icons.send, ...)',
          'FilledButton.icon(onPressed: ..., icon: Icon(Icons.send), label: Text("Envoyer"))',
          'IconFilledButton(Icons.send, ...)',
          'FilledButton(leading: Icons.send, ...)',
        ],
        correctIndex: 1,
        explanation:
            'Les boutons Flutter ont une variante .icon() qui prend un paramètre icon et un paramètre label. C\'est la façon standard d\'avoir un bouton avec une icône et du texte côte à côte.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'FilledButton.icon(\n  onPressed: () {},\n  icon: Icon(Icons.send),\n  label: Text(\'Envoyer\'),\n)',
      ),
      Question(
        id: 'flutter_buttons_q10',
        question: 'Pourquoi écrire `onPressed: () {}` plutôt que `onPressed: () => null` pour un bouton activé ?',
        options: [
          'Les deux sont strictement identiques en tout point',
          '() {} retourne void, () => null retourne Null, mais les deux fonctionnent comme VoidCallback',
          '() => null désactive le bouton',
          '() {} est plus performant',
        ],
        correctIndex: 1,
        explanation:
            '() {} est une fonction void, () => null retourne null. Les deux sont acceptés comme VoidCallback, mais () {} est la convention idiomatique en Dart pour une action vide. L\'important est que onPressed ne soit PAS null pour que le bouton soit activé.',
        difficulty: Difficulty.avance,
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 8: Flutter - State Management
  // ============================================================
  const Category(
    id: 'flutter_state',
    name: 'Flutter - State Management',
    description:
        'StatelessWidget, StatefulWidget, setState, Provider, ChangeNotifier',
    icon: '🔀',
    questions: [
      Question(
        id: 'flutter_state_q1',
        question: 'Quelle est la différence entre StatelessWidget et StatefulWidget ?',
        options: [
          'StatelessWidget est plus rapide, StatefulWidget est plus lent',
          'StatelessWidget n\'a pas d\'état interne mutable, StatefulWidget peut changer d\'état et se reconstruire',
          'StatelessWidget ne peut pas avoir de paramètres',
          'StatefulWidget ne peut pas avoir de constructeur const',
        ],
        correctIndex: 1,
        explanation:
            'Un StatelessWidget est immuable : une fois construit, il ne change jamais. Un StatefulWidget possède un objet State qui peut changer au cours du temps. Quand l\'état change (via setState), le widget se reconstruit avec les nouvelles valeurs.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_state_q2',
        question: 'Que fait `setState()` dans un StatefulWidget ?',
        options: [
          'Il sauvegarde l\'état dans une base de données',
          'Il envoie l\'état au serveur',
          'Il met à jour l\'état et déclenche un rebuild du widget',
          'Il réinitialise l\'état à ses valeurs par défaut',
        ],
        correctIndex: 2,
        explanation:
            'setState() sert à informer le framework Flutter que l\'état interne a changé. Flutter appelle alors la méthode build() à nouveau pour reconstruire le widget avec les nouvelles valeurs. C\'est le mécanisme de base de la réactivité.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'int _counter = 0;\n\nvoid _increment() {\n  setState(() {\n    _counter++;\n  });\n  // Le widget se reconstruit avec _counter mis à jour\n}',
      ),
      Question(
        id: 'flutter_state_q3',
        question: 'Quel est le rôle de la méthode `createState()` dans un StatefulWidget ?',
        options: [
          'Elle crée le widget lui-même',
          'Elle crée l\'objet State associé qui contient l\'état mutable',
          'Elle initialise les paramètres du widget',
          'Elle connecte le widget au thème de l\'application',
        ],
        correctIndex: 1,
        explanation:
            'createState() est une méthode obligatoire du StatefulWidget. Elle retourne une instance de la classe State associée. Cet objet State vit plus longtemps que le widget lui-même et contient l\'état mutable ainsi que la méthode build().',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'class MyWidget extends StatefulWidget {\n  @override\n  State<MyWidget> createState() => _MyWidgetState();\n}\n\nclass _MyWidgetState extends State<MyWidget> {\n  int _counter = 0;\n\n  @override\n  Widget build(BuildContext context) { ... }\n}',
      ),
      Question(
        id: 'flutter_state_q4',
        question: 'Pourquoi utiliser Provider plutôt que passer des données via les constructeurs ?',
        options: [
          'Provider est plus rapide à l\'exécution',
          'Provider évite le "prop drilling" (passer des données à travers de nombreux widgets intermédiaires)',
          'Les constructeurs ne peuvent pas passer de données en Flutter',
          'Provider est obligatoire pour les StatefulWidgets',
        ],
        correctIndex: 1,
        explanation:
            'Sans Provider, pour passer une donnée d\'un widget ancêtre à un widget descendant profond, il faudrait la passer en paramètre à chaque widget intermédiaire (prop drilling). Provider rend les données accessibles à n\'importe quel descendant sans les passer manuellement.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_state_q5',
        question: 'Que fait `notifyListeners()` dans un ChangeNotifier ?',
        options: [
          'Il envoie une notification push à l\'utilisateur',
          'Il informe tous les widgets qui écoutent ce ChangeNotifier qu\'ils doivent se reconstruire',
          'Il écrit un log dans la console',
          'Il sauvegarde l\'état automatiquement',
        ],
        correctIndex: 1,
        explanation:
            'notifyListeners() est l\'équivalent de setState() mais pour Provider. Il notifie tous les Consumer et les Provider.of qui écoutent ce ChangeNotifier, déclenchant leur reconstruction avec les nouvelles données.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'class CartModel extends ChangeNotifier {\n  final List<Item> _items = [];\n\n  void addItem(Item item) {\n    _items.add(item);\n    notifyListeners(); // Notifie les listeners du changement\n  }\n}',
      ),
      Question(
        id: 'flutter_state_q6',
        question: 'Quel widget utilise-t-on pour fournir un ChangeNotifier à l\'arbre de widgets ?',
        options: [
          'Provider()',
          'ChangeNotifierProvider()',
          'NotifierProvider()',
          'StateProvider()',
        ],
        correctIndex: 1,
        explanation:
            'ChangeNotifierProvider est le widget qui crée et fournit une instance de ChangeNotifier à ses descendants. Il s\'occupe aussi de disposer (libérer) le ChangeNotifier quand il n\'est plus nécessaire.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'ChangeNotifierProvider(\n  create: (context) => CartModel(),\n  child: MyApp(),\n)',
      ),
      Question(
        id: 'flutter_state_q7',
        question: 'Quelle est la différence entre `Consumer<T>` et `Provider.of<T>(context)` ?',
        options: [
          'Consumer est plus ancien et déprécié',
          'Consumer ne reconstruit que la partie de l\'arbre qu\'il enveloppe, Provider.of reconstruit tout le widget dans lequel il est appelé',
          'Provider.of est plus performant',
          'Il n\'y a aucune différence',
        ],
        correctIndex: 1,
        explanation:
            'Consumer<T> est un widget qui ne reconstruit que son builder quand le ChangeNotifier change. Provider.of<T>(context) s\'utilise dans build() mais reconstruit tout le widget parent. Consumer est généralement préféré pour les performances.',
        difficulty: Difficulty.avance,
        codeSnippet: '// Consumer : seul le Text est reconstruit\nConsumer<CartModel>(\n  builder: (context, cart, child) {\n    return Text(\'\${cart.itemCount} articles\');\n  },\n)\n\n// Provider.of : tout le build() est relancé\nfinal cart = Provider.of<CartModel>(context);',
      ),
      Question(
        id: 'flutter_state_q8',
        question: 'Qu\'est-ce qu\'un InheritedWidget ?',
        options: [
          'Un widget qui hérite du style de son parent',
          'Le mécanisme de base qui permet de propager des données vers le bas de l\'arbre de widgets (Provider est construit dessus)',
          'Un widget qui s\'adapte automatiquement à la taille de l\'écran',
          'Un widget qui se reconstruit automatiquement',
        ],
        correctIndex: 1,
        explanation:
            'InheritedWidget est le mécanisme bas-niveau de Flutter pour partager des données dans l\'arbre de widgets. Provider est une surcouche qui simplifie son utilisation. C\'est aussi ce que utilise Theme, MediaQuery, etc.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_state_q9',
        question: 'Quand faut-il utiliser un StatefulWidget plutôt qu\'un StatelessWidget ?',
        options: [
          'Toujours, StatelessWidget est obsolète',
          'Quand le widget a un état interne qui change au cours du temps (compteur, formulaire, animation...)',
          'Quand le widget a besoin de paramètres',
          'Quand le widget a des enfants',
        ],
        correctIndex: 1,
        explanation:
            'Un StatefulWidget est nécessaire quand le widget doit gérer un état local qui change (toggle, compteur, champs de formulaire, animations). Si le widget affiche uniquement des données passées en paramètre sans les modifier, un StatelessWidget suffit.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_state_q10',
        question: 'Que se passe-t-il si on modifie une variable dans un StatefulWidget SANS appeler setState() ?',
        options: [
          'Le widget se reconstruit automatiquement',
          'La variable change en mémoire mais le widget ne se reconstruit pas, donc l\'UI n\'est pas mise à jour',
          'Une erreur de compilation',
          'Une exception à l\'exécution',
        ],
        correctIndex: 1,
        explanation:
            'Sans setState(), Flutter ne sait pas que l\'état a changé et n\'appelle pas build(). La variable est bien modifiée en mémoire, mais l\'interface affiche toujours l\'ancienne valeur. C\'est un bug fréquent chez les débutants.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'int _counter = 0;\n\nvoid _increment() {\n  _counter++; // La variable change...\n  // Mais sans setState(), l\'UI affiche toujours 0 !\n}',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 9: Flutter - Requêtes HTTP & API
  // ============================================================
  const Category(
    id: 'flutter_http',
    name: 'Flutter - Requêtes HTTP & API',
    description: 'Dio, JSON parsing, fromJSON, async/await réseau',
    icon: '🌐',
    questions: [
      Question(
        id: 'flutter_http_q1',
        question: 'Pourquoi utiliser le package Dio plutôt que le package http de base ?',
        options: [
          'Dio est obligatoire en Flutter',
          'Dio offre plus de fonctionnalités : intercepteurs, annulation de requêtes, FormData, transformers',
          'Dio est plus léger que http',
          'http est déprécié',
        ],
        correctIndex: 1,
        explanation:
            'Dio est un client HTTP puissant qui offre des fonctionnalités avancées que le package http n\'a pas : intercepteurs pour ajouter des headers automatiquement, annulation de requêtes, upload de fichiers, timeout configurables, etc.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_http_q2',
        question: 'Que fait `jsonDecode()` de `dart:convert` ?',
        options: [
          'Il convertit un objet Dart en chaîne JSON',
          'Il convertit une chaîne JSON en objet Dart (Map ou List)',
          'Il valide qu\'une chaîne est du JSON valide',
          'Il encode une image en JSON',
        ],
        correctIndex: 1,
        explanation:
            'jsonDecode() prend une String contenant du JSON et la convertit en objet Dart : un Map<String, dynamic> pour un objet JSON, ou une List<dynamic> pour un tableau JSON. L\'inverse est jsonEncode().',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'import \'dart:convert\';\n\nString jsonString = \'{"name": "Alice", "age": 25}\';\nMap<String, dynamic> map = jsonDecode(jsonString);\nprint(map[\'name\']); // Alice',
      ),
      Question(
        id: 'flutter_http_q3',
        question: 'Quel est le rôle d\'un constructeur `fromJSON` (ou `fromJson`) ?',
        options: [
          'Envoyer un objet au serveur en JSON',
          'Créer une instance de la classe à partir d\'un Map<String, dynamic> provenant du JSON',
          'Valider le format JSON',
          'Convertir l\'objet en String JSON',
        ],
        correctIndex: 1,
        explanation:
            'Le constructeur fromJSON est un pattern courant qui crée une instance de votre classe Dart à partir d\'un Map<String, dynamic> obtenu via jsonDecode(). C\'est la façon standard de désérialiser du JSON en objets Dart.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'class Product {\n  final String? name;\n  final double? price;\n\n  Product.fromJSON(Map<String, dynamic> json)\n      : name = json[\'name\'] as String?,\n        price = (json[\'price\'] as num?)?.toDouble();\n}',
      ),
      Question(
        id: 'flutter_http_q4',
        question: 'Pourquoi rendre les champs nullable (sauf le code-barre) dans un modèle provenant d\'une API ?',
        options: [
          'Pour des raisons de performance',
          'Parce que les APIs ne retournent pas toujours tous les champs et certaines valeurs peuvent être absentes',
          'C\'est une convention sans raison technique',
          'Pour pouvoir utiliser les champs comme clé de Map',
        ],
        correctIndex: 1,
        explanation:
            'Les APIs externes ne garantissent pas toujours la présence de tous les champs. Un produit peut ne pas avoir de nom, de prix, etc. Rendre ces champs nullable permet de gérer gracieusement les données manquantes sans crash. Le code-barre est souvent non-nullable car c\'est l\'identifiant de la requête.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_http_q5',
        question: 'Qu\'est-ce que le pattern adaptateur dans le contexte API vers modèle local ?',
        options: [
          'Un design pattern qui convertit l\'interface d\'une classe en une autre interface attendue',
          'Un plugin Flutter pour gérer les APIs',
          'Un format de données alternatif au JSON',
          'Un type de requête HTTP',
        ],
        correctIndex: 0,
        explanation:
            'Le pattern adaptateur (adapter) convertit les données d\'un format API (classes API avec fromJSON) vers un format local (modèle de l\'application). Cela découple votre code de l\'API externe : si l\'API change, seul l\'adaptateur doit être modifié.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_http_q6',
        question: 'À quoi sert un CircularProgressIndicator pendant une requête réseau ?',
        options: [
          'Il accélère la requête',
          'Il affiche une animation de chargement pour informer l\'utilisateur que des données sont en cours de récupération',
          'Il est obligatoire pour que la requête fonctionne',
          'Il cache les erreurs réseau',
        ],
        correctIndex: 1,
        explanation:
            'CircularProgressIndicator est un widget qui affiche un spinner rotatif. Pendant une requête réseau asynchrone, il informe l\'utilisateur que quelque chose se passe. Sans indicateur, l\'utilisateur pourrait croire que l\'app est bloquée.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'if (_isLoading)\n  CircularProgressIndicator()\nelse\n  Text(\'Données chargées : \$_data\')',
      ),
      Question(
        id: 'flutter_http_q7',
        question: 'Comment gérer l\'état de chargement d\'une requête async dans un ChangeNotifier ?',
        options: [
          'En utilisant un bool _isLoading qui est mis à true avant la requête et false après, avec notifyListeners()',
          'Flutter le gère automatiquement',
          'En utilisant un Timer',
          'En utilisant un StreamController',
        ],
        correctIndex: 0,
        explanation:
            'Le pattern classique est : mettre _isLoading à true et appeler notifyListeners() avant la requête, puis _isLoading à false et notifyListeners() après. Les widgets Consumer affichent un loader ou les données selon cet état.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'class DataProvider extends ChangeNotifier {\n  bool _isLoading = false;\n  String? _data;\n\n  Future<void> fetchData() async {\n    _isLoading = true;\n    notifyListeners();\n    try {\n      _data = await api.getData();\n    } catch (e) {\n      // gérer l\'erreur\n    }\n    _isLoading = false;\n    notifyListeners();\n  }\n}',
      ),
      Question(
        id: 'flutter_http_q8',
        question: 'Quel est le type du paramètre json dans un constructeur fromJSON typique ?',
        options: [
          'String',
          'Map<String, dynamic>',
          'JsonObject',
          'dynamic',
        ],
        correctIndex: 1,
        explanation:
            'Le paramètre est de type Map<String, dynamic> car c\'est ce que retourne jsonDecode() pour un objet JSON. Les clés sont toujours des String, et les valeurs peuvent être de n\'importe quel type (d\'où dynamic).',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_http_q9',
        question: 'Comment convertir un String JSON en Map<String, dynamic> ?',
        options: [
          'String.toMap()',
          'Map.parse(jsonString)',
          'jsonDecode(jsonString) de dart:convert',
          'JSON.parse(jsonString)',
        ],
        correctIndex: 2,
        explanation:
            'La fonction jsonDecode() du package dart:convert est la façon standard de parser du JSON en Dart. Elle retourne un dynamic qui est en fait un Map<String, dynamic> pour un objet JSON ou une List<dynamic> pour un tableau JSON.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_http_q10',
        question: 'Que fait `(json[\'price\'] as num?)?.toDouble()` dans un fromJSON ?',
        options: [
          'Convertit toujours en double, même si null',
          'Cast la valeur en num nullable, puis la convertit en double si non null, sinon retourne null',
          'Lève une exception si price est absent',
          'Retourne 0.0 si price est absent',
        ],
        correctIndex: 1,
        explanation:
            'D\'abord, json[\'price\'] as num? effectue un cast en num nullable (int et double héritent de num). Ensuite, ?.toDouble() convertit en double SI la valeur n\'est pas null. Si elle est null, l\'expression complète retourne null. C\'est du null-safe access.',
        difficulty: Difficulty.avance,
        codeSnippet: '// Si json = {"price": 9.99}\n(json[\'price\'] as num?)?.toDouble() // => 9.99\n\n// Si json = {"price": 10}\n(json[\'price\'] as num?)?.toDouble() // => 10.0\n\n// Si json = {}\n(json[\'price\'] as num?)?.toDouble() // => null',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 10: Flutter - Navigation
  // ============================================================
  const Category(
    id: 'flutter_navigation',
    name: 'Flutter - Navigation',
    description: 'GoRouter, routes déclaratives, paramètres, type-safe routes',
    icon: '🧭',
    questions: [
      Question(
        id: 'flutter_navigation_q1',
        question: 'Sur quoi est basé GoRouter ?',
        options: [
          'Navigator 1 (impératif)',
          'Navigator 2 (déclaratif)',
          'Un système de navigation personnalisé sans Navigator',
          'Le système de navigation natif Android/iOS',
        ],
        correctIndex: 1,
        explanation:
            'GoRouter est construit par-dessus Navigator 2.0 (l\'API déclarative de Flutter). Il simplifie considérablement son utilisation en offrant une API plus lisible pour définir et gérer les routes.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_navigation_q2',
        question: 'Quelle est la différence entre navigation impérative et déclarative ?',
        options: [
          'Impérative : on push/pop manuellement. Déclarative : les routes sont définies comme configuration et la navigation est basée sur l\'état',
          'Impérative est plus récente que déclarative',
          'Déclarative utilise des animations, impérative non',
          'Il n\'y a pas de différence pratique',
        ],
        correctIndex: 0,
        explanation:
            'La navigation impérative (Navigator 1) utilise push/pop pour empiler/dépiler des écrans. La navigation déclarative (Navigator 2 / GoRouter) définit toutes les routes dans une configuration et navigue en changeant l\'état (URL, paramètres).',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_navigation_q3',
        question: 'Comment passer un paramètre (ex: un code-barre) à un écran via GoRouter ?',
        options: [
          'En utilisant une variable globale',
          'Via les paramètres de chemin (/product/:barcode) ou les query parameters (?barcode=xxx)',
          'En passant un Map dans le constructeur du widget',
          'GoRouter ne supporte pas les paramètres',
        ],
        correctIndex: 1,
        explanation:
            'GoRouter supporte les path parameters (/product/:barcode qui capture la valeur dans l\'URL) et les query parameters (?barcode=xxx). On récupère ces valeurs via state.pathParameters ou state.uri.queryParameters.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'GoRoute(\n  path: \'/product/:barcode\',\n  builder: (context, state) {\n    final barcode = state.pathParameters[\'barcode\']!;\n    return ProductScreen(barcode: barcode);\n  },\n)',
      ),
      Question(
        id: 'flutter_navigation_q4',
        question: 'À quoi servent `GoRouteData` et `TypedGoRoute` ?',
        options: [
          'À ajouter des animations aux transitions',
          'À rendre les routes type-safe avec de la génération de code',
          'À définir des routes dynamiques',
          'À gérer l\'authentification des routes',
        ],
        correctIndex: 1,
        explanation:
            'GoRouteData et TypedGoRoute permettent de définir des routes avec des types forts (type-safe). Au lieu de manipuler des String pour les chemins et les paramètres, on utilise des classes typées. La génération de code crée automatiquement le code de navigation.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_navigation_q5',
        question: 'Comment configure-t-on les routes dans GoRouter ?',
        options: [
          'Dans le fichier AndroidManifest.xml',
          'En passant une liste de GoRoute à l\'objet GoRouter',
          'Dans un fichier JSON séparé',
          'En décorant les widgets avec des annotations @Route',
        ],
        correctIndex: 1,
        explanation:
            'GoRouter est configuré en passant une liste de GoRoute dans son constructeur. Chaque GoRoute définit un path et un builder qui retourne le widget de l\'écran. Les sous-routes sont définies via le paramètre routes.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final router = GoRouter(\n  routes: [\n    GoRoute(\n      path: \'/\',\n      builder: (context, state) => HomeScreen(),\n      routes: [\n        GoRoute(\n          path: \'product/:id\',\n          builder: (context, state) => ProductScreen(\n            id: state.pathParameters[\'id\']!,\n          ),\n        ),\n      ],\n    ),\n  ],\n);',
      ),
      Question(
        id: 'flutter_navigation_q6',
        question: 'Comment naviguer vers un écran avec GoRouter ?',
        options: [
          'Navigator.push(context, route)',
          'context.go(\'/product/123\') ou context.push(\'/product/123\')',
          'GoRouter.navigate(\'/product/123\')',
          'Router.go(\'/product/123\')',
        ],
        correctIndex: 1,
        explanation:
            'GoRouter fournit des extensions sur BuildContext : context.go() remplace la pile de navigation, context.push() ajoute un écran sur la pile. C\'est une API simple et lisible qui utilise des chemins URL.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: '// Remplace toute la pile\ncontext.go(\'/product/123\');\n\n// Ajoute sur la pile (permet de revenir en arrière)\ncontext.push(\'/product/123\');',
      ),
      Question(
        id: 'flutter_navigation_q7',
        question: 'Quelle est la différence entre `context.go()` et `context.push()` dans GoRouter ?',
        options: [
          'Aucune différence',
          'go() remplace la pile de navigation complète, push() ajoute un écran par-dessus',
          'push() est déprécié, seul go() doit être utilisé',
          'go() est pour les URLs, push() est pour les widgets',
        ],
        correctIndex: 1,
        explanation:
            'context.go() modifie la pile de navigation pour correspondre au nouveau chemin (deep linking). context.push() empile un nouvel écran par-dessus la pile actuelle, permettant de revenir en arrière avec le bouton retour.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_navigation_q8',
        question: 'Pourquoi utiliser GoRouter plutôt que Navigator.push/pop classique ?',
        options: [
          'GoRouter est obligatoire depuis Flutter 3',
          'GoRouter offre le deep linking, les routes nommées, le support web (URL), et une configuration déclarative',
          'Navigator est uniquement pour iOS',
          'GoRouter est plus rapide',
        ],
        correctIndex: 1,
        explanation:
            'GoRouter simplifie Navigator 2 et apporte : le deep linking (ouvrir l\'app à une page précise), le support des URLs web, la redirection (ex: vers login), les routes imbriquées, et une configuration centralisée et lisible.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_navigation_q9',
        question: 'Qu\'est-ce que la génération de code pour les routes GoRouter ?',
        options: [
          'Le compilateur Flutter crée automatiquement toutes les routes',
          'Un outil (build_runner) génère du code Dart à partir d\'annotations @TypedGoRoute pour des routes type-safe',
          'GoRouter génère automatiquement les écrans',
          'Un plugin IDE qui crée les fichiers de routes',
        ],
        correctIndex: 1,
        explanation:
            'Avec @TypedGoRoute et GoRouteData, on annote des classes. Puis build_runner génère du code Dart qui fournit des extensions de navigation type-safe. Au lieu d\'écrire context.go(\'/product/123\'), on écrit ProductRoute(id: \'123\').go(context).',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_navigation_q10',
        question: 'Comment intégrer GoRouter dans un MaterialApp ?',
        options: [
          'MaterialApp(router: goRouter)',
          'MaterialApp.router(routerConfig: goRouter)',
          'MaterialApp(routes: goRouter)',
          'MaterialApp(navigatorKey: goRouter)',
        ],
        correctIndex: 1,
        explanation:
            'On utilise MaterialApp.router() au lieu de MaterialApp() classique. Le paramètre routerConfig accepte l\'instance GoRouter qui prend en charge toute la navigation. C\'est le point d\'intégration entre GoRouter et MaterialApp.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'MaterialApp.router(\n  routerConfig: router,\n  title: \'Mon App\',\n  theme: ThemeData(...),\n)',
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 11: Flutter - Assets & Configuration
  // ============================================================
  const Category(
    id: 'flutter_config',
    name: 'Flutter - Assets & Configuration',
    description: 'pubspec.yaml, assets, SVG, dépendances, lint, déploiement',
    icon: '⚙️',
    questions: [
      Question(
        id: 'flutter_config_q1',
        question: 'Où déclare-t-on les assets (images, fichiers) dans un projet Flutter ?',
        options: [
          'Dans le fichier main.dart',
          'Dans le fichier pubspec.yaml, section flutter > assets',
          'Dans le fichier AndroidManifest.xml',
          'Flutter détecte automatiquement les assets',
        ],
        correctIndex: 1,
        explanation:
            'Les assets doivent être déclarés dans pubspec.yaml sous la section flutter > assets. On liste les chemins des fichiers ou dossiers. Sans cette déclaration, Flutter ne les inclut pas dans le build.',
        difficulty: Difficulty.debutant,
        codeSnippet: '# pubspec.yaml\nflutter:\n  assets:\n    - assets/images/\n    - assets/icons/logo.png',
      ),
      Question(
        id: 'flutter_config_q2',
        question: 'Quel package utilise-t-on pour afficher des fichiers SVG en Flutter ?',
        options: [
          'flutter_image',
          'flutter_svg',
          'svg_renderer',
          'dart_svg',
        ],
        correctIndex: 1,
        explanation:
            'Le package flutter_svg permet d\'afficher des images SVG dans Flutter. Contrairement aux PNG/JPG qui sont supportés nativement, les SVG nécessitent ce package tiers. On utilise SvgPicture.asset() pour les afficher.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'import \'package:flutter_svg/flutter_svg.dart\';\n\nSvgPicture.asset(\n  \'assets/icons/logo.svg\',\n  width: 48,\n  height: 48,\n)',
      ),
      Question(
        id: 'flutter_config_q3',
        question: 'Quelle est la différence entre `dependencies` et `dev_dependencies` dans pubspec.yaml ?',
        options: [
          'dependencies sont pour le code principal, dev_dependencies uniquement pour le développement (tests, génération de code)',
          'dev_dependencies sont plus rapides',
          'dependencies sont optionnelles, dev_dependencies sont obligatoires',
          'Il n\'y a pas de différence',
        ],
        correctIndex: 0,
        explanation:
            'dependencies contient les packages nécessaires à l\'application en production (Dio, Provider, GoRouter...). dev_dependencies contient les packages utilisés uniquement pendant le développement : tests (flutter_test), linting (flutter_lints), génération de code (build_runner).',
        difficulty: Difficulty.intermediaire,
        codeSnippet: '# pubspec.yaml\ndependencies:\n  flutter:\n    sdk: flutter\n  dio: ^5.0.0\n  provider: ^6.0.0\n\ndev_dependencies:\n  flutter_test:\n    sdk: flutter\n  flutter_lints: ^3.0.0',
      ),
      Question(
        id: 'flutter_config_q4',
        question: 'Que fait la commande `flutter pub get` ?',
        options: [
          'Elle compile l\'application',
          'Elle télécharge les dépendances listées dans pubspec.yaml',
          'Elle publie le package sur pub.dev',
          'Elle met à jour Flutter lui-même',
        ],
        correctIndex: 1,
        explanation:
            'flutter pub get résout et télécharge toutes les dépendances déclarées dans pubspec.yaml. Cette commande est nécessaire après l\'ajout d\'un nouveau package ou le clonage d\'un projet. Elle génère aussi le fichier pubspec.lock.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_config_q5',
        question: 'À quoi sert le fichier `analysis_options.yaml` ?',
        options: [
          'Configurer les performances de l\'application',
          'Définir les règles de linting et d\'analyse statique du code Dart',
          'Configurer les tests unitaires',
          'Gérer les permissions de l\'application',
        ],
        correctIndex: 1,
        explanation:
            'analysis_options.yaml configure l\'analyseur statique de Dart. On y définit les règles de style de code (linting), les avertissements à activer/désactiver, et les bonnes pratiques à enforcer. C\'est essentiel pour la qualité du code.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_config_q6',
        question: 'Quelle est la différence entre `flutter build apk` et `flutter build web` ?',
        options: [
          'apk génère un fichier Android installable, web génère des fichiers HTML/JS/CSS pour le navigateur',
          'apk est pour iOS, web est pour Android',
          'apk est pour le debug, web est pour la production',
          'Il n\'y a pas de différence, les deux génèrent le même fichier',
        ],
        correctIndex: 0,
        explanation:
            'flutter build apk compile l\'app en un fichier .apk installable sur Android. flutter build web génère des fichiers statiques (HTML, JS, CSS) déployables sur un serveur web. Flutter supporte les deux plateformes depuis le même code source.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_config_q7',
        question: 'Pourquoi faut-il un keystore pour publier une app Android ?',
        options: [
          'Pour chiffrer le code source',
          'Pour signer l\'APK, ce qui garantit l\'identité du développeur et permet les mises à jour',
          'Pour protéger les assets de l\'application',
          'C\'est optionnel, ce n\'est pas obligatoire',
        ],
        correctIndex: 1,
        explanation:
            'Le keystore contient une clé cryptographique qui signe l\'APK. Le Google Play Store exige cette signature pour vérifier l\'identité du développeur. Sans la même clé, impossible de publier des mises à jour de l\'app.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_config_q8',
        question: 'Pourquoi le fichier `key.properties` doit-il être dans le `.gitignore` ?',
        options: [
          'Pour réduire la taille du dépôt git',
          'Parce qu\'il contient des informations sensibles (mot de passe du keystore) qui ne doivent pas être versionnées',
          'Parce que Git ne supporte pas les fichiers .properties',
          'Pour éviter les conflits de merge',
        ],
        correctIndex: 1,
        explanation:
            'key.properties contient le chemin du keystore et son mot de passe. Si ces informations sont poussées sur un dépôt public, n\'importe qui pourrait signer des APK à votre place. C\'est une règle de sécurité fondamentale.',
        difficulty: Difficulty.intermediaire,
      ),
      Question(
        id: 'flutter_config_q9',
        question: 'Comment déclarer un dossier entier d\'assets dans pubspec.yaml ?',
        options: [
          'assets: all',
          'En ajoutant le chemin du dossier avec un slash final : assets/images/',
          'En listant chaque fichier individuellement uniquement',
          'En utilisant un wildcard : assets/images/*',
        ],
        correctIndex: 1,
        explanation:
            'En terminant le chemin par un / (ex: assets/images/), Flutter inclut TOUS les fichiers du dossier (mais pas les sous-dossiers). Pour inclure les sous-dossiers, il faut les déclarer séparément. Le wildcard * n\'est pas supporté.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: '# pubspec.yaml\nflutter:\n  assets:\n    - assets/images/   # Tous les fichiers du dossier\n    - assets/data/config.json  # Un fichier spécifique',
      ),
      Question(
        id: 'flutter_config_q10',
        question: 'Que se passe-t-il si on oublie de lancer `flutter pub get` après avoir ajouté une dépendance ?',
        options: [
          'Rien, Flutter télécharge automatiquement',
          'L\'import du package échoue et le code ne compile pas',
          'Le package est disponible mais en mode dégradé',
          'L\'application crash au démarrage',
        ],
        correctIndex: 1,
        explanation:
            'Sans flutter pub get, le package n\'est pas téléchargé et n\'est pas disponible dans le projet. Les imports échouent et l\'analyseur signale des erreurs. L\'IDE lance souvent pub get automatiquement, mais pas toujours.',
        difficulty: Difficulty.debutant,
      ),
    ],
  ),

  // ============================================================
  // CATÉGORIE 12: Flutter - PocketBase & Backend
  // ============================================================
  const Category(
    id: 'flutter_pocketbase',
    name: 'Flutter - PocketBase & Backend',
    description: 'PocketBase SDK, intégration backend, rappels produits',
    icon: '🗄️',
    questions: [
      Question(
        id: 'flutter_pocketbase_q1',
        question: 'Qu\'est-ce que PocketBase ?',
        options: [
          'Un framework frontend',
          'Un backend as a service open-source en un seul fichier exécutable',
          'Un ORM pour Dart',
          'Un package Flutter pour les bases de données locales',
        ],
        correctIndex: 1,
        explanation:
            'PocketBase est un backend open-source distribué en un seul fichier exécutable. Il fournit une base de données, une API REST, une authentification, du stockage de fichiers et un tableau de bord admin. Idéal pour du prototypage rapide.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_pocketbase_q2',
        question: 'Comment lance-t-on PocketBase en local ?',
        options: [
          'npm start pocketbase',
          './pocketbase serve',
          'flutter run pocketbase',
          'docker start pocketbase',
        ],
        correctIndex: 1,
        explanation:
            'PocketBase se lance avec la commande ./pocketbase serve. Par défaut, l\'API est accessible sur http://127.0.0.1:8090 et le tableau de bord admin sur http://127.0.0.1:8090/_/. C\'est un simple exécutable, pas besoin de runtime.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_pocketbase_q3',
        question: 'Comment récupérer un enregistrement par son ID avec le SDK Dart PocketBase ?',
        options: [
          'pb.get(\'example\', \'RECORD_ID\')',
          'pb.collection(\'example\').getOne(\'RECORD_ID\')',
          'pb.find(\'example\', \'RECORD_ID\')',
          'pb.query(\'SELECT * FROM example WHERE id = RECORD_ID\')',
        ],
        correctIndex: 1,
        explanation:
            'Le SDK PocketBase utilise un pattern de collection. pb.collection(\'nomCollection\') accède à la collection, puis .getOne(\'id\') récupère un enregistrement spécifique. C\'est une API asynchrone qui retourne un Future.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final pb = PocketBase(\'http://127.0.0.1:8090\');\n\nfinal record = await pb.collection(\'products\').getOne(\'RECORD_ID\');',
      ),
      Question(
        id: 'flutter_pocketbase_q4',
        question: 'Comment extraire une valeur typée d\'un enregistrement PocketBase ?',
        options: [
          'record.name',
          'record[\'name\']',
          'record.get<String>(\'name\') ou record.getStringValue(\'name\')',
          'record.data.name',
        ],
        correctIndex: 2,
        explanation:
            'Le SDK PocketBase fournit des méthodes typées comme .get<Type>(\'champ\') ou des helpers comme .getStringValue(), .getIntValue(), etc. Ces méthodes assurent le bon typage et gèrent les valeurs par défaut.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'final record = await pb.collection(\'products\').getOne(\'abc123\');\n\nfinal name = record.getStringValue(\'name\');\nfinal price = record.getDoubleValue(\'price\');\nfinal isActive = record.getBoolValue(\'is_active\');',
      ),
      Question(
        id: 'flutter_pocketbase_q5',
        question: 'Qu\'est-ce que pb_hooks dans PocketBase ?',
        options: [
          'Des widgets Flutter pour PocketBase',
          'Des hooks JavaScript (ou Go) qui s\'exécutent côté serveur en réponse à des événements',
          'Des tests unitaires pour PocketBase',
          'Un package de gestion d\'état',
        ],
        correctIndex: 1,
        explanation:
            'pb_hooks permet d\'exécuter du code JavaScript (ou Go) côté serveur en réponse à des événements : avant/après la création d\'un enregistrement, sur une requête API, etc. C\'est la logique métier côté backend.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_pocketbase_q6',
        question: 'Comment utiliser ChangeNotifier pour gérer les données PocketBase dans Flutter ?',
        options: [
          'PocketBase gère automatiquement l\'état Flutter',
          'En créant un ChangeNotifier qui encapsule les appels PocketBase et appelle notifyListeners() après chaque opération',
          'En utilisant setState directement dans le widget',
          'En écoutant les WebSockets de PocketBase',
        ],
        correctIndex: 1,
        explanation:
            'On crée un ChangeNotifier qui contient l\'instance PocketBase et les données récupérées. Les méthodes async du notifier appellent le SDK PocketBase, mettent à jour l\'état interne, puis appellent notifyListeners() pour mettre à jour l\'UI.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: 'class ProductProvider extends ChangeNotifier {\n  final pb = PocketBase(\'http://127.0.0.1:8090\');\n  List<RecordModel> _products = [];\n\n  Future<void> loadProducts() async {\n    _products = (await pb.collection(\'products\').getFullList()).items;\n    notifyListeners();\n  }\n}',
      ),
      Question(
        id: 'flutter_pocketbase_q7',
        question: 'PocketBase peut-il planifier des tâches automatiques (jobs) ?',
        options: [
          'Non, il faut un service externe',
          'Oui, via les pb_hooks et le système de scheduling intégré',
          'Seulement avec un plugin payant',
          'Seulement en mode production',
        ],
        correctIndex: 1,
        explanation:
            'PocketBase supporte la planification de tâches (jobs scheduling) via pb_hooks. On peut programmer des tâches récurrentes (vérifier les rappels de produits, nettoyage de données...) directement dans le code côté serveur.',
        difficulty: Difficulty.avance,
      ),
      Question(
        id: 'flutter_pocketbase_q8',
        question: 'Comment initialiser le SDK PocketBase dans une application Dart ?',
        options: [
          'import \'pocketbase\'; PocketBase.init();',
          'final pb = PocketBase(\'http://127.0.0.1:8090\');',
          'PocketBase.connect(\'localhost\', 8090);',
          'var pb = new PocketBase();',
        ],
        correctIndex: 1,
        explanation:
            'On crée une instance PocketBase en passant l\'URL du serveur au constructeur. Cette instance est ensuite utilisée pour toutes les opérations (CRUD, authentification, etc.). On la crée généralement une seule fois et on la partage.',
        difficulty: Difficulty.debutant,
        codeSnippet: 'import \'package:pocketbase/pocketbase.dart\';\n\nfinal pb = PocketBase(\'http://127.0.0.1:8090\');',
      ),
      Question(
        id: 'flutter_pocketbase_q9',
        question: 'Quelles fonctionnalités PocketBase fournit-il "out of the box" ?',
        options: [
          'Uniquement une base de données',
          'Base de données, API REST, authentification, stockage de fichiers, tableau de bord admin',
          'Uniquement une API REST',
          'Uniquement l\'authentification',
        ],
        correctIndex: 1,
        explanation:
            'PocketBase est un backend complet en un seul fichier. Il inclut une base de données SQLite, une API REST auto-générée, un système d\'authentification (email, OAuth2), un stockage de fichiers et un tableau de bord d\'administration web.',
        difficulty: Difficulty.debutant,
      ),
      Question(
        id: 'flutter_pocketbase_q10',
        question: 'Comment lister tous les enregistrements d\'une collection PocketBase ?',
        options: [
          'pb.collection(\'products\').getAll()',
          'pb.collection(\'products\').getFullList()',
          'pb.collection(\'products\').list()',
          'pb.collection(\'products\').findAll()',
        ],
        correctIndex: 1,
        explanation:
            'La méthode getFullList() récupère TOUS les enregistrements d\'une collection. Pour la pagination, on utilise getList(page: 1, perPage: 20). getOne(\'id\') récupère un seul enregistrement par son ID.',
        difficulty: Difficulty.intermediaire,
        codeSnippet: '// Tous les enregistrements\nfinal all = await pb.collection(\'products\').getFullList();\n\n// Avec pagination\nfinal page = await pb.collection(\'products\').getList(\n  page: 1,\n  perPage: 20,\n);',
      ),
    ],
  ),
];
