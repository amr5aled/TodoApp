
import 'package:flutter/material.dart';
import 'package:testapp/shared/components/components.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final key = GlobalKey<FormState>();
  final emailedit = TextEditingController();
  final passedit = TextEditingController();

  bool ispassword = true;
  bool validation() {
    if (key.currentState.validate()) {
      return true;
    }
    return false;
  }

  void submit() {
    if (validation()) {
      key.currentState.save();
      print('sucess');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 5.0,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultTextForm(
                      edit: emailedit,
                      label: 'email',
                      icon: Icons.email,
                      functionValidator: (value) {
                        if (value.isEmpty) {
                          return 'please enter email ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passedit,
                      decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(ispassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              ispassword = !ispassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                      obscureText: ispassword,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        print('value is :value');
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: submit,
                        color: Colors.blue,
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don \'t have account?',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        // ignore: deprecated_member_use
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now',
                            style: TextStyle(color: Colors.teal),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}