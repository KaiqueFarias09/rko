part of '../home_view.dart';

class _BaseContainer extends StatelessWidget {
  const _BaseContainer({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions();

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 30, 16, 30),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue800),
          borderRadius: BorderRadius.circular(dimensions.borderRadius1),
        ),
        child: Column(children: children),
      ),
    );
  }
}
