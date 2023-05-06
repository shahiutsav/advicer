import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/pages/features/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/pages/features/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child:

                    /*
                * ---- Error State ----
                */
                    ErrorMessage(
                  message: 'Oops! Something went wrong.',
                ),

                /*
                * ---- Loaded State ----
                */
                //     AdviceField(
                //   advice: 'example advice - Your day will get better',
                // ),

                /*
                  *  ---- Loading state ----  
                */
                //  CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // ),

                /* 
                * ---- Initial state ---- 
                 */
                // Text(
                //   'Your advice is waiting for you...',
                //   style: themeData.textTheme.displayLarge,
                // ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
