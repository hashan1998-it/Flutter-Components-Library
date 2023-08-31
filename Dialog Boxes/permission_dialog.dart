import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> showPermissionDialog(context) async {
  return showDialog<void>(

    context: context,

    //! Dialog cannot be dismissed by tapping outside
    barrierDismissible: false,

    builder: (BuildContext context) {
     //!Dialog widget
      return CupertinoAlertDialog(
        //!title
        title: const Text('Permission Required'),

        //!content
        content:
            const Text('You have to allow the permission to access the songs.'),

        //!actions    
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              //!When pressed it close app
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
          CupertinoDialogAction(
            //!when click it opens settings
            isDefaultAction: true,
            child: const Text('Open Settings'),
            onPressed: () => openAppSettings(),
          ),
        ],
      );
    },
  );
}


