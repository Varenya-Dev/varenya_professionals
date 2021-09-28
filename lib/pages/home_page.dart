import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varenya_professionals/pages/user/user_update_page.dart';
import 'package:varenya_professionals/providers/user_provider.dart';
import 'package:varenya_professionals/services/auth_service.dart';
import 'package:varenya_professionals/services/user_service.dart';

import 'auth/auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AuthService _authService;
  late final UserService _userService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._authService = Provider.of<AuthService>(context, listen: false);
    this._userService = Provider.of<UserService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Varenya For Professionals'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<UserProvider>(
              builder: (context, state, child) {
                var user = state.user;
                return Text(user.email!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserUpdatePage.routeName);
              },
              child: Text('User Update'),
            ),
            ElevatedButton(
              onPressed: () async {
                await this._authService.logOut();
                Navigator.of(context).pushNamed(AuthPage.routeName);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
