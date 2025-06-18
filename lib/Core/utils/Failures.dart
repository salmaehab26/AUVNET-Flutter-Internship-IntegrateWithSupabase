class Failures {
  final String message;
  final int? code;

  Failures({
    required this.message,
    this.code,
  });

  @override
  String toString() => 'Failures(message: $message, code: $code)';
}
