import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'widget.dart';

showErrorSnackBar(String title, String message) {
  Get.snackbar(title, message,
      icon: const Icon(
        Icons.error_outlined,
        color: WHITE,
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: LIGHTRED,
      colorText: PRIMARY,
      duration: const Duration(seconds: 3));
}

showSuccessSnackBar(String title, String message) {
  Get.snackbar(title, message,
      icon: const Icon(
        Icons.check_circle,
        color: WHITE,
      ),
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: LIGHTGREEN,
      colorText: APPGREEN,
      duration: const Duration(seconds: 2));
}

showNoticeSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    borderRadius: 10,
    duration: const Duration(seconds: 4),
    margin: const EdgeInsets.symmetric(horizontal: 30),
    backgroundColor: WHITE.withOpacity(0.5),
    colorText: BLUE,
  );
}

Future<void> showConfirmDialog(context,
    {message, actionText, cancelText, title, cancelAction, action}) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    title ?? 'Hey!',
                  ),
                ),
                content: Text(message),
                actions: <Widget>[
                  MaterialButton(
                    onPressed: cancelAction ?? () => Get.back(),
                    child: Text(
                      cancelText,
                      style: TextStyle(color: BLACK),
                    ),
                  ),
                  MaterialButton(
                    onPressed: action,
                    shape: const CircleBorder(),
                    child: Text(
                      actionText,
                      style: TextStyle(color: PRIMARY),
                    ),
                  ),
                ],
              )
            : AlertDialog(
                elevation: 0,
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                content: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Wrap(
                    children: <Widget>[
                      Container(height: 25),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            title ?? 'Hey!',
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      message,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: dialogButton(
                                          title: cancelText,
                                          color: Colors.transparent,
                                          borderColor: PRIMARY,
                                          onPressed: cancelAction ??
                                              () => Get.back())),
                                  const SizedBox(width: 5),
                                  Expanded(
                                      child: dialogButton(
                                          title: actionText,
                                          onPressed: action)),
                                ],
                              ),
                            ),
                            Container(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      });
}


Future<void> showSuccessDialog(context,
    {message, actionText, cancelText, title, cancelAction, action}) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                // title: Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Text(
                //     title ?? 'Hey!',
                //   ),
                // ),
                content: Text(message),
                actions: <Widget>[
                  MaterialButton(
                    onPressed: cancelAction ?? () => Get.back(),
                    child: Text(
                      cancelText,
                      style: TextStyle(color: BLACK),
                    ),
                  ),
                  MaterialButton(
                    onPressed: action,
                    shape: const CircleBorder(),
                    child: Text(
                      actionText,
                      style: TextStyle(color: PRIMARY),
                    ),
                  ),
                ],
              )
            : AlertDialog(
                elevation: 0,
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                content: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Wrap(
                    children: <Widget>[
                      Container(height: 25),
                      // Center(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Text(
                      //       title ?? 'Hey!',
                      //       style: const TextStyle(
                      //           fontSize: 15.0, fontWeight: FontWeight.w600),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      message,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Column(
                                children: [
                                  dialogButton(
                                      title: actionText,
                                      onPressed: action),
                                  const SizedBox(height: 8),

                                  dialogButton(
                                      title: cancelText,
                                      onPressed: cancelAction ??
                                              () => Get.back()),
                                ],
                              ),
                            ),
                            Container(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      });
}

Future<void> loadingDialog(context) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("assets/images/VAyR.gif",
                    height: 70),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Loading...\nPlease wait.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: WHITE),
                ),
              ),
            ],
          ),
        );
      });
}
