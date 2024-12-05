extension StringFormattingHelper on String {
  String formatAsSentence() {
    if (isEmpty) return this;

    String formatted = this[0].toUpperCase() + substring(1);

    if (!formatted.endsWith('.')) {
      formatted += '.';
    }

    return formatted;
  }
}
