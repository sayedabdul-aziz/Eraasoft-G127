class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    imagePath: 'assets/images/on1.svg',
    title: 'ابحث عن دكتور متخصص',
    description:
        'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/on2.svg',
    title: 'سهولة الحجز',
    description: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/on3.svg',
    title: 'آمن وسري',
    description: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.',
  ),
];
