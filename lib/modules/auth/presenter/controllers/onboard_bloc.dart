import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/modules/auth/presenter/controllers/onboard_events.dart';
import 'package:mobile/modules/auth/presenter/controllers/onboard_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingCurrentState()) {
    on<OnboardpageHasChanged>(
        (OnboardpageHasChanged event, Emitter<OnboardingState> emit) {
      // print(state);
      // print(state is OnboardingCurrentState);

      emit(OnboardingCurrentState(currentPageIndex: event.pageIndex));
      // if (state is OnboardingCurrentState) {
      //   (state as OnboardingCurrentState)..currentPageIndex = event.pageIndex;
      // }
    });
  }
}
