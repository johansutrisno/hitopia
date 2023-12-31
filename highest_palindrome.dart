String _makePalindrome(String input, int maxReplacements) {
  if (maxReplacements == 0 || input.isEmpty) {
    return input;
  }

  int leftIndex = 0;
  int rightIndex = input.length - 1;

  while (leftIndex < rightIndex) {
    if (input[leftIndex] != input[rightIndex]) {
      final leftDigit = int.parse(input[leftIndex]);
      final rightDigit = int.parse(input[rightIndex]);

      final replacement = leftDigit > rightDigit ? leftDigit : rightDigit;

      final updatedInput = input.substring(0, leftIndex) +
          replacement.toString() +
          input.substring(leftIndex + 1, rightIndex) +
          replacement.toString() +
          input.substring(rightIndex + 1);

      // Recursive call with reduced maxReplacements
      final recursiveResult = _makePalindrome(
        updatedInput,
        maxReplacements - 1,
      );

      // Compare current result with recursive result
      if (recursiveResult.compareTo(updatedInput) > 0) {
        return recursiveResult;
      } else {
        return updatedInput;
      }
    }

    leftIndex++;
    rightIndex--;
  }

  // If the input is already a palindrome or we have exhausted replacements
  return input;
}

bool isPalindrome(String str) {
  // Remove spaces and convert to lowercase for case-insensitive comparison
  String cleanedStr = str.replaceAll(' ', '').toLowerCase();

  // Compare the original string with its reverse
  return cleanedStr == cleanedStr.split('').reversed.join('');
}

final _inputData = [
  {
    'input': '3123',
    'k': 1,
  },
  {
    'input': '393923',
    'k': 2,
  },
  {
    'input': '3912323',
    'k': 1,
  }
];

void main() {
  for (var element in _inputData) {
    final input = element['input'] as String;
    final k = element['k'] as int;
    final result = _makePalindrome(input, k);
    if (isPalindrome(result)) {
      print("Input: $input");
      print("k: $k");
      print("Output: $result\n");
    } else {
      print("Input: $input");
      print("k: $k");
      print("Output: -1\n");
    }
  }
}
