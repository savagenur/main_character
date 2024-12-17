import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardFormatter extends TextInputFormatter {
  final String separator;

  CardFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    // if you add text
    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      // print(
      //     'Ends with separator: $endsWithSeparator, so we will add it with next digit.');

      var clean = newS.replaceAll(separator, '');
      // print('CLEAN add: $clean');
      if (!endsWithSeparator && clean.length > 1 && clean.length % 4 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    // if you delete text
    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      // print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      // print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 4 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}
class CardMonthYearFormatter extends TextInputFormatter {
  final String separator;

  CardMonthYearFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    // if you add text
    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      // print(
      //     'Ends with separator: $endsWithSeparator, so we will add it with next digit.');

      var clean = newS.replaceAll(separator, '');
      // print('CLEAN add: $clean');
      if (!endsWithSeparator && clean.length > 1 && clean.length % 2 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    // if you delete text
    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      // print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      // print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 2 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}