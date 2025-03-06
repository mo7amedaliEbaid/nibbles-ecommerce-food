import 'package:flutter/material.dart';

extension TextWithDifferentStyle on Text {
  Text withDifferentStyle(String targetWord, TextStyle differentStyle) {
    final originalText = this.data;
    final index = originalText?.lastIndexOf(targetWord);

    if (index != -1) {
      final preText = originalText?.substring(0, index);
      final postText = originalText?.substring(index!);

      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: preText,
              style: style, // Apply the original style to the preText
            ),
            TextSpan(
              text: postText,
              style: differentStyle, // Apply the different style to the postText
            ),
          ],
        ),
      );
    } else {
      // If the target word is not found, return the original text
      return this;
    }
  }
}

extension StringCapitalizeExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(' ');
    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        return word;
      }
    }).toList();

    return words.join(' ');
  }
}
