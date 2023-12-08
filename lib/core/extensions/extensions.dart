

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
