abstract class SearchEvent {}

class SubmitEvent extends SearchEvent {
  final String year;
  SubmitEvent({required this.year});
}

class TypeEvent extends SearchEvent {
  String textYear;

  TypeEvent({required this.textYear});
}
