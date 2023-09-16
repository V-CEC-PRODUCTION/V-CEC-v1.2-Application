part of 'google_cubit.dart';

@freezed
class GoogleState with _$GoogleState {
  const factory GoogleState(
          {required bool isSubmitting,
          required bool showerrormessages,
          required Option<Either<MainFailure, Unit>> authfailureorsuccess}) =
      _GoogleState;
  factory GoogleState.initial() => GoogleState(
      isSubmitting: false,
      showerrormessages: false,
      authfailureorsuccess: none());
}
