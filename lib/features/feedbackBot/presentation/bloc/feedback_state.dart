class FeedbackState {
  final int step;
  final List<String> messages;

  const FeedbackState({required this.step, required this.messages});

  List<Object> get props => [step, messages];
}
