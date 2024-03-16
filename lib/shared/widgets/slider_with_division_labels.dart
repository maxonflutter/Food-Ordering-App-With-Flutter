import 'package:flutter/material.dart';

class SliderWithDivisionLabels extends StatelessWidget {
  const SliderWithDivisionLabels({
    super.key,
    this.min = 0.0,
    this.max = 5.0,
    this.divisions = 5,
    this.onChanged,
  });

  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    final divisionValue = max / divisions;

    final labels = List.generate(
      divisions + 1,
      (index) => Text((divisionValue * index).toStringAsFixed(0)),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels,
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 1.0,
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            min: min,
            max: max,
            onChanged: onChanged,
            value: 2,
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
    Offset offset = Offset.zero,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0.0;
    final double trackLeft = offset.dx + 0.0;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width + 4.0;

    return Rect.fromLTWH(
      trackLeft,
      trackTop,
      trackWidth,
      trackHeight,
    );
  }
}
