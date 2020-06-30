import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;

  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();

    FocusScope.of(context).unfocus();
    if (isValid) _formKey.currentState.save();
    print(_userEmail);
    print(_userName);
    print(_userPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    if (_isLogin)
                      TextFormField(
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@'))
                            return 'Please enter a valid email address';
                          return null;
                        },
                        onSaved: (value) => _userEmail = value,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email address',
                            hintText: 'Enter the email address'),
                      ),
                    TextFormField(
                      key: ValueKey('username'),
                      decoration: InputDecoration(labelText: 'User Name'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3)
                          return 'User name must be at least 3 character long';
                        return null;
                      },
                      onSaved: (value) => _userName = value,
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 5)
                          return 'Password must be at least 5 character long';
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) => _userPassword = value,
                    ),
                    SizedBox(height: 12),
                    RaisedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Login' : 'Sign Up'),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new Account'
                          : 'I already have an account'),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.max,
                )),
          ),
        ),
      ),
    );
  }
}
