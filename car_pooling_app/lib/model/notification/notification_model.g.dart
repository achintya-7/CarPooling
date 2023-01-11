// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      email: json['email'] as String,
      sender_phone: json['sender_phone'] as String,
      sender_name: json['sender_name'] as String,
      type: json['type'] as int,
      content: json['content'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'sender_phone': instance.sender_phone,
      'sender_name': instance.sender_name,
      'type': instance.type,
      'content': instance.content,
      'timestamp': instance.timestamp,
    };
