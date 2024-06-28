// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailsImpl _$$TransactionDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailsImpl(
      description: json['description'] as String,
      valueCents: (json['valueCents'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionDetailsImplToJson(
        _$TransactionDetailsImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'valueCents': instance.valueCents,
    };
