List<int> _calculateWeight(String s) {
  final Map<String, int> weights = {
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 6,
    'g': 7,
    'h': 8,
    'i': 9,
    'j': 10,
    'k': 11,
    'l': 12,
    'm': 13,
    'n': 14,
    'o': 15,
    'p': 16,
    'q': 17,
    'r': 18,
    's': 19,
    't': 20,
    'u': 21,
    'v': 22,
    'w': 23,
    'x': 24,
    'y': 25,
    'z': 26
  };

  String current = '';
  int currentWeight = 0;
  final result = <int>[];

  for (var element in s.split('')) {
    if (element == current) {
      result.add(currentWeight + weights[current]!);
      currentWeight = currentWeight + weights[current]!;
    } else {
      current = element;
      currentWeight = weights[current]!;
      result.add(currentWeight);
    }
  }

  return result;
}

List<String> _checkQueries(List<int> resultInput, List<int> queriesInput) {
  final result = <String>[];

  for (var element in queriesInput) {
    final isContains = resultInput.contains(element);
    result.add(isContains ? 'Yes' : 'No');
  }

  return result;
}

void main() {
  String stringInput = 'abbcccd';
  List<int> queriesInput = [1, 3, 9, 8];

  final calculate = _calculateWeight(stringInput);
  final output = _checkQueries(calculate, queriesInput);
  print(output);
}
