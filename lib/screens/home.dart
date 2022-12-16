

import 'package:flutter/material.dart';
import 'package:loginpage/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 55, 234),
        title: const Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                Signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('PERSON ${index + 1}'),
              subtitle: const Text('iam using this App '),
              leading: index.isEven
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          'https://www.shutterstock.com/shutterstock/photos/147778580/display_1500/stock-vector-male-profile-picture-silhouette-profile-avatar-147778580.jpg'))
                  : const CircleAvatar (
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/shutterstock/photos/147777731/display_1500/stock-vector-female-profile-picture-silhouette-profile-avatar-147777731.jpg'),
                    ),
              trailing: Text('1$index:00 PM'),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
            //  return ListTile(
            //     title:Text('PERSON ${index+1}') ,
            //     subtitle: const Text('iam using this App '),
            // leading:const CircleAvatar(
            //   radius: 25,
            //   backgroundImage: NetworkImage('https://www.shutterstock.com/shutterstock/photos/147777731/display_1500/stock-vector-female-profile-picture-silhouette-profile-avatar-147777731.jpg'),
            // ) ,
            //    trailing: Text('1$index:00 PM'),
            //   );
          },
          itemCount: 10,
        ),
      ),
    );
  }

  Signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
