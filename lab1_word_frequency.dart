// Roll Number: [Your Roll Number]
// Name: [Your Name]
// SMD 2026 - Classwork #1 - Dart Basics

void main() {
  List<String> sentences = [
    "this is a test this is",
    "hello hello world",
    "dart is fun fun fun"
  ];

  print("The following words have the highest word frequency per line:");

  for (int i = 0; i < sentences.length; i++) {
    List<String> words = sentences[i].split(' ');
    Map<String, int> frequency = {};

    for (String word in words) {
      frequency[word] = (frequency[word] ?? 0) + 1;
    }

    int maxFreq = frequency.values.reduce((a, b) => a > b ? a : b);

    List<String> maxWords =
        frequency.entries.where((e) => e.value == maxFreq).map((e) => e.key).toList();

    String wordList = maxWords.join(', ');
    print("[$wordList] (appears in line ${i + 1})");
  }
}
