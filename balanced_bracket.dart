bool _checkBalancedBracket(String input) {
  Map<String, String> bracketPairs = {
    '(': ')',
    '{': '}',
    '[': ']',
  };

  List<String> openBrackets = bracketPairs.keys.toList();
  List<String> closeBrackets = bracketPairs.values.toList();

  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String currentBracket = input[i];

    if (openBrackets.contains(currentBracket)) {
      stack.add(currentBracket);
    } else if (closeBrackets.contains(currentBracket)) {
      if (stack.isEmpty || bracketPairs[stack.removeLast()] != currentBracket) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}

void main() {
  String input1 = "({[()]})";
  String input2 = "({[()]}";

  print("Input 1: ${_checkBalancedBracket(input1)}"); // Output: true
  print("Input 2: ${_checkBalancedBracket(input2)}"); // Output: false
}
