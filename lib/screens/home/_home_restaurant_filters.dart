part of 'home_screen.dart';

class _RestaurantFilters extends StatelessWidget {
  const _RestaurantFilters();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomActionChip(
            labelText: 'Rating',
            onPressed: () => openRatingModal(context),
          ),
          const SizedBox(width: 4.0),
          CustomActionChip(
            labelText: 'Price',
            onPressed: () => openPriceModal(context),
          ),
          const SizedBox(width: 4.0),
          CustomActionChip(
            labelText: 'Dietary',
            onPressed: () => openDietaryModal(context),
          ),
          const SizedBox(width: 4.0),
          CustomActionChip(
            labelText: 'Delivery Fee',
            onPressed: () => openDeliveryFeeModal(context),
          ),
        ],
      ),
    );
  }

  Future<dynamic> openRatingModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => const RatingModal(),
    );
  }

  Future<dynamic> openPriceModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Container(),
    );
  }

  Future<dynamic> openDietaryModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Container(),
    );
  }

  Future<dynamic> openDeliveryFeeModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Container(),
    );
  }
}
