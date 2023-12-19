import 'dart:io';
import '/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';

class CheckNetworkConnectionWidget extends StatefulWidget {
  const CheckNetworkConnectionWidget({
    super.key,
    required this.child,
    required this.onRetryPressed,
  });

  final Widget child;
  final Function onRetryPressed;

  @override
  State<CheckNetworkConnectionWidget> createState() =>
      _CheckNetworkConnectionStateWidget();
}

class _CheckNetworkConnectionStateWidget
    extends State<CheckNetworkConnectionWidget> {
  bool _isNetworkConnected = false;

  Future _checkNetwork() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setState(() {
        _isNetworkConnected = true;
      });
    } else {
      setState(() {
        _isNetworkConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkNetwork(),
        builder: (context, snapshot) {
          if (_isNetworkConnected) {
            return widget.child;
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.noInternetImage,
                    fit: BoxFit.cover,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onRetryPressed();
                    },
                    child: const Text(
                      'Retry',
                      // AppLocalizations.of(context)!.retry
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
