import 'package:e_commarce/src/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget.blue(
                // isLoading: true,
                // isEnabled: false,
                isSmall: true,
                text: 'blue',
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget.white(
                // isLoading: true,
                // isEnabled: false,
                text: 'white',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
