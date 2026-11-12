import 'package:equatable/equatable.dart';

/// A simple typed failure so the UI can show friendly messages
/// instead of leaking raw exceptions.
class Failure extends Equatable implements Exception {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
