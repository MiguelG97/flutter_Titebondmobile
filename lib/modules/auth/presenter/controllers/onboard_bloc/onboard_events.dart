abstract class OnboardingEvent {}

class OnboardpageHasChanged extends OnboardingEvent {
  int pageIndex;
  OnboardpageHasChanged({required this.pageIndex});
}
