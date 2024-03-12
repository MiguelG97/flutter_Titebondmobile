abstract class OnboardingState {}

class OnboardingCurrentState extends OnboardingState {
  int currentPageIndex;
  OnboardingCurrentState({this.currentPageIndex = 0});
}
