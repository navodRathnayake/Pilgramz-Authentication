import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/API/Auth/AuthServices.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';

class LoginSignin extends StatefulWidget {
  final ThemeData themedata;
  const LoginSignin({Key? key, required this.themedata}) : super(key: key);

  @override
  State<LoginSignin> createState() => _LoginSigninState();
}

class _LoginSigninState extends State<LoginSignin> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset('assests/images/tempLogo.png'),
              ),
              Column(
                //
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hey There,',
                      style: widget.themedata.textTheme.headline3),
                  Text(
                    'Welcome Back',
                    style: widget.themedata.textTheme.headline3,
                  ),
                  Text(
                    'Login to your account to find beautiful destinations',
                    style: widget.themedata.textTheme.bodySmall,
                  ),
                  VerticalSpace(height: 25)
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // Foreground color
                          onPrimary: Color.fromARGB(255, 0, 0, 0),
                          // Background color
                          primary: Color.fromARGB(255, 255, 255, 255),
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          AuthServices().signInWithGoogle();
                        },
                        child: const Text('Sign Up With Google'),
                      ),
                    ),
                  ),
                  VerticalSpace(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?        | ',
                          style: widget.themedata.textTheme.bodySmall),
                      Login(themedata: widget.themedata),
                    ],
                  ),
                  Container(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.teal[50],
                          )
                        : null,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  final ThemeData themedata;
  const Login({Key? key, required this.themedata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Pilgramz Login'),
          content: PopUpDialogBody(themedata: themedata),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            // TextButton(
            //   onPressed: () => Navigator.pop(context, 'OK'),
            //   child: const Text('OK'),
            // ),
          ],
        ),
      ),
      child: Text(
        'Login',
        style: themedata.textTheme.bodySmall,
      ),
    );
  }
}

class PopUpDialogBody extends StatefulWidget {
  final ThemeData themedata;
  const PopUpDialogBody({Key? key, required this.themedata}) : super(key: key);

  @override
  State<PopUpDialogBody> createState() => _PopUpDialogBodyState();
}

class _PopUpDialogBodyState extends State<PopUpDialogBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Center(
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      EmailFieldWidget(
                          controller: emailController,
                          themedata: widget.themedata),
                      VerticalSpace(height: 10),
                      PasswordFieldWidget(
                        controller: passwordController,
                        themedata: widget.themedata,
                      ),
                      const SizedBox(height: 16),
                      buildButton(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'LOGIN',
        onClicked: () {
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
          }
        },
      );
}

class EmailFieldWidget extends StatefulWidget {
  final ThemeData themedata;
  final TextEditingController controller;

  const EmailFieldWidget({
    Key? key,
    required this.themedata,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailFieldWidgetState createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        autofocus: true,
        style: widget.themedata.textTheme.bodySmall,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 13,
          ),
          hintText: 'Email',
          hintStyle: widget.themedata.textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //prefixIcon: Icon(Icons.mail),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => widget.controller.clear(),
                ),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          shape: StadiumBorder(),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: onClicked,
      );
}

class PasswordFieldWidget extends StatefulWidget {
  final ThemeData themedata;
  final TextEditingController controller;

  const PasswordFieldWidget({
    Key? key,
    required this.themedata,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) => TextFormField(
      controller: widget.controller,
      style: widget.themedata.textTheme.bodySmall,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        suffix: GestureDetector(
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: _isVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off)),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 13,
        ),
        hintText: 'Password',
        hintStyle: widget.themedata.textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        //prefixIcon: Icon(Icons.mail),
      ),
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      validator: (password) {
        if (password != null && password.isEmpty) {
          return 'Password cannot be empty';
        }
        return null;
      });
}
