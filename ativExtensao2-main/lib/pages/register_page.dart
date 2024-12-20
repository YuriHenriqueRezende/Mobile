import 'package:app_base/components/button.dart';
import 'package:app_base/components/text_field.dart';
import 'package:app_base/themes/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
Map<String, String> errorMessages = {
  'user-not-found': 'Nenhum usuário encontrado com este e-mail.',
  'wrong-password': 'Senha incorreta.',
  'email-already-in-use': 'Este e-mail já está em uso.',
  'invalid-email': 'Email inválido.',
  'weak-password': 'A senha deve ter pelo menos 6 caracteres.',
  // Adicione mais traduções conforme necessário
};
  // sign user up
  void signUp() async{
      // circulo de carregamento
    showDialog(context: context, builder: (context)=> const Center(child: CircularProgressIndicator(),));

    if(passwordTextController.text != confirmPasswordTextController.text){
      // pop loading
      Navigator.pop(context);
      // show error
      displayMessage(context, "Senhas diferentes", false);
      return;
    }

    // try criar usuario
    try {
  // Cria um novo usuário com Firebase Authentication usando o email e senha fornecidos
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailTextController.text, // pega o email do campo de texto
    password: passwordTextController.text // pega a senha do campo de texto
  );
  
  // Verifica se o contexto ainda está "montado" para evitar erros. Se sim, navega para a tela anterior
  // Isso pode ser útil se você quiser fechar a tela de registro após a criação do usuário.
  if (context.mounted) Navigator.pop(context);

  // Após criar o usuário, cria um novo documento no Cloud Firestore chamado "Users",
  // onde o ID do documento será o email do usuário (para facilitar a recuperação dos dados no futuro)
  FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email).set({
    'username': emailTextController.text.split('@')[0], // Extrai o nome de usuário antes do "@" do email
    'bio': 'Bio vazia...' // Define a bio inicial como "Bio vazia..."
  });
  
} on FirebaseAuthException catch (e){
   print(e.code);
    Navigator.pop(context); 
      displayMessage(context, e.code, true);
    }

  }

  
void displayMessage(BuildContext context, String errorCode, bool traduzir) {
  if(traduzir){
String message = errorMessages[errorCode] ?? 'Ocorreu um erro desconhecido.';   
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
      
    
     
    ),
  ); 
  }
  else{
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(errorCode),
      
    
     
    ),
  );
  
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cor1, // Usando a cor 'cor1' para o fundo

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
           // Logo
                Image.asset(
                  "assets/images/logoProject.png",
                  height: 150,
                  // color: AppTheme.cor4, // Usando a cor 'cor4' para o ícone (verde profundo)
                ),
                const SizedBox(
                  height: 50,
                ),
                // Bem-vindo de volta
                Text(
                  "Vamos criar sua conta!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.cor5, // Usando a cor 'cor4' para o texto
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // Email textfield
                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                // Senha textfield
                MyTextField(
                    controller: passwordTextController,
                    hintText: 'Senha',
                    obscureText: true),

                const SizedBox(
                  height: 10,
                ),
                // Confirmar senha
                MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirmar senha',
                    obscureText: true),
                const SizedBox(
                  height: 25,
                ),
                // Botão de logar
                MyButton(
                  onTap: signUp,
                  text: "Logar",
                  buttonColor: AppTheme.cor4, 
                ),

                const SizedBox(
                  height: 25,
                ),
                // Página de registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já tem uma conta?",
                      style: TextStyle(color: AppTheme.cor5), // Usando 'cor5' para texto secundário
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Entre agora!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: AppTheme.cor4, // Usando 'cor4' para texto de ação
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
