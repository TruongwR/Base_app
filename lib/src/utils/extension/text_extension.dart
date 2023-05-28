extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String capitalizeWords() {
    if (isEmpty) {
      return this;
    }
    List<String> words = split(" ");
    List<String> capitalizedWords = [];
    for (String word in words) {
      capitalizedWords.add(word.capitalize());
    }
    return capitalizedWords.join(" ");
  }
}
