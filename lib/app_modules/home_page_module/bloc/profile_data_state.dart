part of 'profile_data_bloc.dart';

@freezed
class ProfileDataState with _$ProfileDataState {
  const factory ProfileDataState.initial() = _Initial;
  const factory ProfileDataState.loading() = ProfileDataLoading;
  const factory ProfileDataState.success(
    ProfileModel profile,
  ) = ProfileDataSuccess;
  const factory ProfileDataState.error(
    String errorMessage,
  ) = ProfileDataError;
}
