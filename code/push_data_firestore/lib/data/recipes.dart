import 'package:dto/model/ingredient.dart';
import 'package:dto/model/recipe.dart';

String generateId(String name) {
  final now = DateTime.now().microsecondsSinceEpoch;
  final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000);
  return '${name.toLowerCase().replaceAll(" ", "")}_recipe_${now.toRadixString(36)}${random.toRadixString(36)}';
}

String getIngredientId(String name) {
  return '${name.toLowerCase().replaceAll(" ", "_").replaceAll("'", "_")}_ingredient';
}

final List<Recipe> recipes = [
  Recipe(
      id: generateId("Poulet curry"),
      titre: "Poulet au curry et riz basmati",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/poulet%20curry.jpg",
      temps: 60,
      difficulty: 2,
      nbMinPersonne: 4,
      listEtape: [
        "Émincer les oignons et l’ail.",
        "Couper le poulet en morceaux réguliers.",
        "Faire revenir les oignons dans une grande poêle avec un peu d’huile.",
        "Ajouter l’ail puis le poulet et faire dorer.",
        "Saupoudrer de curry, saler, poivrer et bien mélanger.",
        "Ajouter un fond d’eau et laisser mijoter 25 minutes.",
        "Cuire le riz basmati dans une grande casserole d’eau salée.",
        "Égoutter le riz et servir avec le poulet bien chaud."
      ],
      isPosted: true,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Pates bolognaise"),
      titre: "Pâtes à la bolognaise",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/pate%20bolognaise.png",
      temps: 50,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Émincer l’oignon et l’ail.",
        "Faire revenir l’oignon dans une poêle.",
        "Ajouter la viande hachée et bien la saisir.",
        "Ajouter les tomates coupées en dés.",
        "Assaisonner avec sel, poivre et basilic.",
        "Laisser mijoter 30 minutes à feu doux.",
        "Cuire les pâtes dans de l’eau bouillante salée.",
        "Égoutter et servir avec la sauce."
      ],
      isPosted: false,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Pomme de terre sautees"),
      titre: "Pommes de terre sautées à l’ail",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/pomme%20de%20terre%20sautee%20ail.png",
      temps: 45,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Éplucher et couper les pommes de terre en cubes.",
        "Les rincer puis les sécher.",
        "Faire chauffer de l’huile dans une poêle.",
        "Ajouter les pommes de terre et faire dorer.",
        "Ajouter l’ail émincé et le thym.",
        "Saler, poivrer et cuire encore 15 minutes.",
        "Servir bien chaud."
      ],
      isPosted: true,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Riz saute legumes"),
      titre: "Riz sauté aux légumes",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/Riz-saute-aux-legumes-1024x576.jpg",
      temps: 40,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Cuire le riz et le laisser refroidir.",
        "Couper les légumes en petits dés.",
        "Faire revenir les légumes dans un wok.",
        "Ajouter le riz et bien mélanger.",
        "Assaisonner avec sel, poivre et sauce soja.",
        "Faire sauter 10 minutes.",
        "Servir chaud."
      ],
      isPosted: false,
      nbLike: 0,
  ),

  Recipe(
      id: generateId("Poulet roti pommes de terre"),
      titre: "Poulet rôti aux pommes de terre",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/poulet%20pomme%20de%20terre.png",
      temps: 90,
      difficulty: 2,
      nbMinPersonne: 4,
      listEtape: [
        "Préchauffer le four à 200°C.",
        "Éplucher et couper les pommes de terre.",
        "Disposer le poulet dans un plat.",
        "Ajouter les pommes de terre autour.",
        "Saler, poivrer et ajouter le romarin.",
        "Enfourner pendant 1h15 en arrosant régulièrement.",
        "Servir bien chaud."
      ],
      isPosted: true,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Lentilles mijotees"),
      titre: "Lentilles mijotées aux légumes",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/lentilles%20au%20legume.png",
      temps: 60,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Rincer les lentilles.",
        "Couper les carottes en rondelles.",
        "Émincer l’oignon.",
        "Faire revenir l’oignon dans une casserole.",
        "Ajouter les lentilles et les carottes.",
        "Couvrir d’eau et cuire 40 minutes.",
        "Saler, poivrer et servir."
      ],
      isPosted: false,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Boeuf mijote"),
      titre: "Boeuf mijoté au paprika",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/boeuf%20mijote.jpg",
      temps: 120,
      difficulty: 3,
      nbMinPersonne: 4,
      listEtape: [
        "Couper le boeuf en cubes.",
        "Émincer les oignons.",
        "Faire revenir les oignons.",
        "Ajouter le boeuf et faire dorer.",
        "Saupoudrer de paprika.",
        "Couvrir et laisser mijoter 1h30.",
        "Servir avec du riz ou des pommes de terre."
      ],
      isPosted: true,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Quinoa legumes"),
      titre: "Quinoa aux légumes",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/quinoa%20aux%20legumes.png",
      temps: 35,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Cuire le quinoa selon les instructions.",
        "Couper les légumes en dés.",
        "Faire revenir les légumes.",
        "Ajouter le quinoa.",
        "Assaisonner et mélanger.",
        "Servir chaud."
      ],
      isPosted: false,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Pates champignons"),
      titre: "Pâtes aux champignons",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/pate%20champignon.jpg",
      temps: 40,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Cuire les pâtes.",
        "Émincer les champignons.",
        "Faire revenir l’ail.",
        "Ajouter les champignons.",
        "Saler, poivrer.",
        "Mélanger avec les pâtes.",
        "Servir chaud."
      ],
      isPosted: true,
      nbLike: 0,
  ),
  Recipe(
      id: generateId("Riz curcuma"),
      titre: "Riz parfumé au curcuma",
      image: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/riz%20curcuma.jpeg",
      temps: 30,
      difficulty: 1,
      nbMinPersonne: 4,
      listEtape: [
        "Rincer le riz.",
        "Faire revenir l’oignon.",
        "Ajouter le riz et le curcuma.",
        "Couvrir d’eau.",
        "Cuire 18 minutes.",
        "Servir chaud."
      ],
      isPosted: false,
      nbLike: 0,
  ),
];

final List<List<Ingredient>> ingredientsForRecipe = [

  // =====================================================
  // Poulet au curry et riz basmati
  // =====================================================
  [
    Ingredient(id: getIngredientId("Poulet"), name: "Poulet", type: "Viandes", quantity: "800 gr"),
    Ingredient(id: getIngredientId("Riz basmati"), name: "Riz basmati", type: "Feculent", quantity: "600 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "300 gr"),
    Ingredient(id: getIngredientId("Ail"), name: "Ail", type: "Legumineuse", quantity: "10 gr"),
    Ingredient(id: getIngredientId("Curry"), name: "Curry", type: "Epice", quantity: "20 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Pâtes à la bolognaise
  // =====================================================
  [
    Ingredient(id: getIngredientId("Viande hachée"), name: "Viande hachée", type: "Viandes", quantity: "700 gr"),
    Ingredient(id: getIngredientId("Pâtes"), name: "Pâtes", type: "Feculent", quantity: "600 gr"),
    Ingredient(id: getIngredientId("Tomate"), name: "Tomate", type: "Legumineuse", quantity: "600 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "150 gr"),
    Ingredient(id: getIngredientId("Ail"), name: "Ail", type: "Legumineuse", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Basilic"), name: "Basilic", type: "Epice", quantity: "10 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Pommes de terre sautées à l’ail
  // =====================================================
  [
    Ingredient(id: getIngredientId("Pomme de terre"), name: "Pomme de terre", type: "Feculent", quantity: "1500 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "300 gr"),
    Ingredient(id: getIngredientId("Ail"), name: "Ail", type: "Legumineuse", quantity: "10 gr"),
    Ingredient(id: getIngredientId("Thym"), name: "Thym", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Riz sauté aux légumes
  // =====================================================
  [
    Ingredient(id: getIngredientId("Riz"), name: "Riz", type: "Feculent", quantity: "500 gr"),
    Ingredient(id: getIngredientId("Carotte"), name: "Carotte", type: "Legumineuse", quantity: "300 gr"),
    Ingredient(id: getIngredientId("Courgette"), name: "Courgette", type: "Legumineuse", quantity: "250 gr"),
    Ingredient(id: getIngredientId("Poivron"), name: "Poivron", type: "Legumineuse", quantity: "200 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Poulet rôti aux pommes de terre
  // =====================================================
  [
    Ingredient(id: getIngredientId("Poulet"), name: "Poulet", type: "Viandes", quantity: "1000 gr"),
    Ingredient(id: getIngredientId("Pomme de terre"), name: "Pomme de terre", type: "Feculent", quantity: "1000 gr"),
    Ingredient(id: getIngredientId("Romarin"), name: "Romarin", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "6 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "3 gr"),
  ],

  // =====================================================
  // Lentilles mijotées aux légumes
  // =====================================================
  [
    Ingredient(id: getIngredientId("Lentille"), name: "Lentille", type: "Legumineuse", quantity: "400 gr"),
    Ingredient(id: getIngredientId("Carotte"), name: "Carotte", type: "Legumineuse", quantity: "350 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "150 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Boeuf mijoté au paprika
  // =====================================================
  [
    Ingredient(id: getIngredientId("Boeuf"), name: "Boeuf", type: "Viandes", quantity: "800 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "300 gr"),
    Ingredient(id: getIngredientId("Paprika"), name: "Paprika", type: "Epice", quantity: "10 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Quinoa aux légumes
  // =====================================================
  [
    Ingredient(id: getIngredientId("Quinoa"), name: "Quinoa", type: "Feculent", quantity: "400 gr"),
    Ingredient(id: getIngredientId("Courgette"), name: "Courgette", type: "Legumineuse", quantity: "300 gr"),
    Ingredient(id: getIngredientId("Poivron"), name: "Poivron", type: "Legumineuse", quantity: "200 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Pâtes aux champignons
  // =====================================================
  [
    Ingredient(id: getIngredientId("Pâtes"), name: "Pâtes", type: "Feculent", quantity: "500 gr"),
    Ingredient(id: getIngredientId("Champignon"), name: "Champignon", type: "Legumineuse", quantity: "400 gr"),
    Ingredient(id: getIngredientId("Ail"), name: "Ail", type: "Legumineuse", quantity: "10 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Poivre"), name: "Poivre", type: "Epice", quantity: "2 gr"),
  ],

  // =====================================================
  // Riz parfumé au curcuma
  // =====================================================
  [
    Ingredient(id: getIngredientId("Riz"), name: "Riz", type: "Feculent", quantity: "500 gr"),
    Ingredient(id: getIngredientId("Oignon"), name: "Oignon", type: "Legumineuse", quantity: "150 gr"),
    Ingredient(id: getIngredientId("Curcuma"), name: "Curcuma", type: "Epice", quantity: "5 gr"),
    Ingredient(id: getIngredientId("Sel"), name: "Sel", type: "Epice", quantity: "5 gr"),
  ],
];