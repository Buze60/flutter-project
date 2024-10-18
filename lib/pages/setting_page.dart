import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro/component/my_setting_tile.dart';
import 'package:pro/theme/themeProvider.dart';
import 'package:provider/provider.dart';
/*
   SETTING PAGE

   Dark Mode
   Blocked User
   Account Setting
 */

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  //BUILD UI
  @override
  Widget build(BuildContext context) {
    //SACFFOLD
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        //App Bar
        appBar: AppBar(
          title: const Text('S e t t i n g '),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        //Body
        body: Column(
          children: [
            //Dark Mode Tile
            MySettingTile(
              title: 'Dark Mode',
              action: CupertinoSwitch(
                onChanged: (value) =>
                    Provider.of<Themeprovider>(context, listen: false)
                        .toggleTheme(),
                value: Provider.of<Themeprovider>(context, listen: false)
                    .isDarMode,
              ),
            ),
          ],
        )
        //Block User Tile
        //Account Setting Tile

        );
  }
}
