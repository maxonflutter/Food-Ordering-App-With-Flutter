class Filter {
  List<FilterCondition> conditions = [];

  void addCondition(FilterCondition condition) {
    conditions.add(condition);
  }

  void removeCondition(FilterCondition condition) {
    conditions.removeWhere(
      (c) => c.type == condition.type && c.value == condition.value,
    );
  }

  Map<String, dynamic> toJson() => {
        'conditions': conditions.map((c) => c.toJson()).toList(),
      };
}

abstract class FilterCondition {
  String type;
  dynamic value;
  bool isInequality;

  FilterCondition(this.type, this.value, this.isInequality);

  Map<String, dynamic> toJson();
}

class IsGreaterThan extends FilterCondition {
  IsGreaterThan(dynamic value)
      : super(
          'isGreaterThan',
          value,
          true,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class IsGreaterThanOrEqualTo extends FilterCondition {
  IsGreaterThanOrEqualTo(dynamic value)
      : super(
          'isGreaterThanOrEqualTo',
          value,
          true,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class IsLessThan extends FilterCondition {
  IsLessThan(dynamic value)
      : super(
          'isLessThan',
          value,
          true,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class IsLessThanOrEqualTo extends FilterCondition {
  IsLessThanOrEqualTo(dynamic value)
      : super(
          'isLessThanOrEqualTo',
          value,
          true,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class IsEqualTo extends FilterCondition {
  IsEqualTo(dynamic value)
      : super(
          'isEqualTo',
          value,
          false,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class IsNotEqualTo extends FilterCondition {
  IsNotEqualTo(dynamic value)
      : super(
          'isNotEqualTo',
          value,
          true,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}

class ArrayContains extends FilterCondition {
  ArrayContains(dynamic value)
      : super(
          'arrayContains',
          value,
          false,
        );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'isInequality': isInequality,
      };
}
