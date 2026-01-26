import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cours_01/res/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            color: AppColors.textPrimary,  
            fontSize: 20,                   
            fontWeight: FontWeight.bold,    
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailField(
              valueChanged: (String value) {
                  print(value);
                  _email = value;
                  setState(() {});
                },
            ),

            const SizedBox(height: 16),
            ContinueButton(onPressed: _email.isNotEmpty ? () {} : null),
            const SizedBox(height: 24),
            const OrSeparator(),
            const SizedBox(height: 24),
            ContinueWithButton(
              name: 'Apple',
              assetPath: 'assets/apple_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ContinueWithButton(
              name: 'Google',
              assetPath: 'assets/google_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ContinueWithButton(
              name: 'Facebook',
              assetPath: 'assets/facebook_logo.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Widget 1 : Champ email (étape 5)
class EmailField extends StatelessWidget {
  const EmailField({required this.valueChanged,super.key});

  final ValueChanged<String> valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false, 
      onChanged: valueChanged,
      style: const TextStyle(
        color: AppColors.textPrimary, 
      ),
      keyboardType: TextInputType.emailAddress,



      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: 'Adresse email',
        hintStyle: const TextStyle(
          color: AppColors.textSecondary, 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputFieldInactiveBackground,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputFieldActiveBackground,
          ),
        ),
      ),
    );
  }
}

// Widget 2 : Bouton Continuer (étape 6) - paramètre optionnel VoidCallback?
class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          foregroundColor: AppColors.buttonPrimaryText,       // Couleur 1er plan
          backgroundColor: AppColors.buttonPrimaryBackground, // Couleur arrière-plan
          textStyle: const TextStyle(
            fontSize: 16,              // Taille
            fontWeight: FontWeight.w600, // Weight
          ),
        ),
        child: const Text('Continue'),
      ),
    );
  }
}

// Widget 3 : Séparateur "Ou"
class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Ou'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

// Widget 4 : Bouton "Continuer avec" (3 paramètres obligatoires)
class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({
    super.key,
    required this.name,
    required this.assetPath,
    required this.onPressed,
  });

  final String name;
  final String assetPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
        label: Text('Continuer avec $name'),
      ),
    );
  }
}
