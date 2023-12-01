import 'package:flutter/material.dart';
import 'package:flutter_sample_app/phyllo_provider.dart';
import 'package:flutter_sample_app/views/primary_button.dart';
import 'package:flutter_sample_app/views/loader.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String instagramId = '9bb8913b-ddd9-430b-a66a-d74d846e6c66';
  static const String youtubeId = '14d9ddf5-51c6-415e-bde6-f8ed36ad7054';

  // Future<void> _onChangedEnvironment() async {
  //   var provider = context.read<PhylloProvider>();
  //   Environment? environment =
  //       await showEnvironmentChangeDialog(context, provider.phylloEnvironment);

  //   if (environment != null) {
  //     provider.onChangedEnvironment(environment);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhylloProvider>(
      builder: (context, phylloProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Phyllo Connect Example'),
            elevation: 0,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PrimaryButton(
                        label: 'Connect Platform Account(S)',
                        onPressed: () {
                          phylloProvider.launchSdk('');
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Connect Instagram using Phyllo',
                        onPressed: () {
                          phylloProvider.launchSdk(instagramId);
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Connect YouTube using Phyllo',
                        onPressed: () {
                          phylloProvider.launchSdk(youtubeId);
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildExistingUserCheckbox(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.transparent,
                      ),
                    ),
                    // onLongPress: _onChangedEnvironment,
                  ),
                ),
                Loader.loadingWithBackground(phylloProvider.isLoading),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildExistingUserCheckbox() {
    var phylloController = context.read<PhylloProvider>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: phylloController.isExistingUser,
          activeColor: Colors.green,
          onChanged: phylloController.userId != null
              ? phylloController.isExistingUserStatusChanged
              : null,
        ),
        const Text('Existing user'),
      ],
    );
  }
}
