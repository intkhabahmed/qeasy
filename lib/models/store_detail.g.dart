// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetail _$StoreDetailFromJson(Map<String, dynamic> json) {
  return StoreDetail()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..address = json['address'] as String
    ..distance = json['distance'] as String
    ..slots = (json['slots'] as List)?.map((e) => e as String)?.toList()
    ..imageUrl = json['imageUrl'] as String
    ..storeCategory =
        _$enumDecodeNullable(_$StoreCategoryEnumMap, json['storeCategory']);
}

Map<String, dynamic> _$StoreDetailToJson(StoreDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'distance': instance.distance,
      'slots': instance.slots,
      'imageUrl': instance.imageUrl,
      'storeCategory': _$StoreCategoryEnumMap[instance.storeCategory],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StoreCategoryEnumMap = {
  StoreCategory.ALL: 'ALL',
  StoreCategory.GROCERIES: 'GROCERIES',
  StoreCategory.MEDICINES: 'MEDICINES',
  StoreCategory.MEAT: 'MEAT',
};
