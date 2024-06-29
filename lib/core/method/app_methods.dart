import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class AppMethods {
    static showFlexibleSizeBottomSheet({
        required Widget widget,
        required BuildContext context,
        bool isScrollable = true,
        bool showConstraints = true,
    }) {
        return showModalBottomSheet(
            backgroundColor: AppColors.greyStroke,
            isScrollControlled: isScrollable,
            // constraints: BoxConstraints(maxHeight: 0.70.sh),
            constraints: showConstraints ? const BoxConstraints(maxHeight: 0.70) : null,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                ),
            ),
            builder: (context) => Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: widget,
            ),
        );
    }

    static void showLoaderDialog(BuildContext context,
        {String? txt, bool dismissible = true}) {
        AlertDialog alert = AlertDialog(
            content: Row(
                children: [
                    const CircularProgressIndicator(),
                    Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(txt ?? AppStrings.loadingTxt)),
                ],
            ),
        );
        showDialog(
            barrierDismissible: dismissible,
            context: context,
            builder: (BuildContext context) {
                return alert;
            },
        );
    }

    /// import 'package:fluttertoast/fluttertoast.dart';

    static displayToastFailure({message}) {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0,
        );
    }



    static displayToastSuccess({message}) {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
        );
    }


    static Future<bool?> showConfirmDialog(
        BuildContext context,
        String title,
        String message,
        String? id,
        ) async {
        return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                surfaceTintColor: AppColors.white,
                title: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                    child: Text(message),
                ),
                actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Cancel'),
                    ),
                    TextButton(
                        onPressed: () {
                            print("Property Deleted");
                            // context.pop();
                            // Navigator.pop(context,true);
                        },
                        child: const Text('Confirm'),
                    ),
                ],
            ),
        );
    }
}
