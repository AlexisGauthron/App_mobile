import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widgets/product_separator.dart';
import '../widgets/nutri_score_widget.dart';
import '../widgets/nova_score_widget.dart';
import '../widgets/green_score_widget.dart';
import '../widgets/product_data_row.dart';

/// Page produit qui affiche les informations d'un produit alimentaire
/// - Étape 1 : Entête avec image et carte (nom, marque)
/// - Étape 2 : Bandeau Nutri-Score / Nova / Green-Score
/// - Étape 3 : Données produit (Quantité, Vendu)
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = generateProduct();

    return Scaffold(
      backgroundColor: Colors.white,
      body: _ProductPageContent(product: product),
    );
  }
}

/// Version chargement 
class _ProductPageLoading extends StatelessWidget {
  const _ProductPageLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/// Version contenu 
class _ProductPageContent extends StatelessWidget {
  final Product product;

  const _ProductPageContent({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =====================================================
          // ÉTAPE 1 : ENTÊTE (Image + Carte avec nom/marque)
          // =====================================================
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                // Image d'arrière-plan (lien Unsplash)
                Image.network(
                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                // Carte qui chevauche l'image
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nom du produit
                        Text(
                          product.name ?? 'Produit inconnu',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Marque(s) du produit
                        Text(
                          product.brands?.join(', ') ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================
          // ÉTAPES 2 & 3 : WIDGETS SOUS L'IMAGE
          // =====================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =====================================================
                // ÉTAPE 2 : BANDEAU NUTRI-SCORE / NOVA SCORE
                // Proportions : 44% | 1px | reste (56%)
                // =====================================================
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nutri-Score : 44%
                      Expanded(
                        flex: 44,
                        child: product.nutriScore != null
                            ? NutriScoreWidget(
                                nutriScore: product.nutriScore!)
                            : const SizedBox.shrink(),
                      ),

                      // Séparateur vertical de 1px
                      const ProductSeparator(axis: Axis.vertical),

                      // Nova Score : le reste (56%)
                      Expanded(
                        flex: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: product.novaScore != null
                              ? NovaScoreWidget(
                                  novaScore: product.novaScore!)
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Séparateur horizontal
                const ProductSeparator(axis: Axis.horizontal),

                const SizedBox(height: 24),

                // =====================================================
                // ÉTAPE 2 : GREEN-SCORE
                // =====================================================
                if (product.greenScore != null)
                  GreenScoreWidget(greenScore: product.greenScore!),

                const SizedBox(height: 24),

                // Séparateur horizontal
                const ProductSeparator(axis: Axis.horizontal),

                // =====================================================
                // ÉTAPE 3 : DONNÉES PRODUIT
                // =====================================================
                // Quantité
                if (product.quantity != null)
                  ProductDataRow(
                    label: 'Quantité',
                    value: product.quantity,
                  ),

                // Vendu (pays de fabrication)
                ProductDataRow(
                  label: 'Vendu',
                  value: product.manufacturingCountries?.join(', '),
                  showSeparator: false,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
