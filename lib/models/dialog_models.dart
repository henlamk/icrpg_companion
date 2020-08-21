import 'package:flutter/foundation.dart';

class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String cancelTitle;
  final bool isSetAmountDialog;
  final bool isSetHpDialog;

  DialogRequest({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
    this.cancelTitle,
    this.isSetAmountDialog = false,
    this.isSetHpDialog = false,
  });
}

class DialogResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}


class SetHpDialogResponse extends DialogResponse {
  final bool confirmed;
  final int amount;

  SetHpDialogResponse({this.confirmed, this.amount});
}
