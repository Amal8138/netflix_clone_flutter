import 'package:api/common/snack_bar.dart';
import 'package:flutter/material.dart';

void handleHttpErrors(int statusCode , BuildContext context){
  switch(statusCode) {
    case 400:
    showSnackBarWidget(context, "Bad request , Request was invalid");
    break;

    case 500:
    showSnackBarWidget(context, "Server Error , Internal server error");
    break;

    default:
    showSnackBarWidget(context, "Error , An unexpected error occured");
  }
}