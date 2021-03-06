//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/entity/compat/ObsoleteGroupMember.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/compat/ObsoleteGroupMember.h"
#include "java/io/IOException.h"
#include "java/lang/UnsupportedOperationException.h"

@interface ImActorModelEntityCompatObsoleteGroupMember () {
 @public
  jint uid_;
  jint inviterUid_;
  jlong inviteDate_;
  jboolean isAdministrator__;
}

@end

@implementation ImActorModelEntityCompatObsoleteGroupMember

- (instancetype)initWithByteArray:(IOSByteArray *)data {
  ImActorModelEntityCompatObsoleteGroupMember_initWithByteArray_(self, data);
  return self;
}

- (instancetype)initWithBSBserValues:(BSBserValues *)values {
  ImActorModelEntityCompatObsoleteGroupMember_initWithBSBserValues_(self, values);
  return self;
}

- (jint)getUid {
  return uid_;
}

- (jint)getInviterUid {
  return inviterUid_;
}

- (jlong)getInviteDate {
  return inviteDate_;
}

- (jboolean)isAdministrator {
  return isAdministrator__;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  uid_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  inviterUid_ = [values getIntWithInt:2];
  inviteDate_ = [values getLongWithInt:3];
  isAdministrator__ = [values getBoolWithInt:4];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  @throw new_JavaLangUnsupportedOperationException_init();
}

@end

void ImActorModelEntityCompatObsoleteGroupMember_initWithByteArray_(ImActorModelEntityCompatObsoleteGroupMember *self, IOSByteArray *data) {
  (void) BSBserObject_init(self);
  [self load__WithByteArray:data];
}

ImActorModelEntityCompatObsoleteGroupMember *new_ImActorModelEntityCompatObsoleteGroupMember_initWithByteArray_(IOSByteArray *data) {
  ImActorModelEntityCompatObsoleteGroupMember *self = [ImActorModelEntityCompatObsoleteGroupMember alloc];
  ImActorModelEntityCompatObsoleteGroupMember_initWithByteArray_(self, data);
  return self;
}

void ImActorModelEntityCompatObsoleteGroupMember_initWithBSBserValues_(ImActorModelEntityCompatObsoleteGroupMember *self, BSBserValues *values) {
  (void) BSBserObject_init(self);
  [self parseWithBSBserValues:values];
}

ImActorModelEntityCompatObsoleteGroupMember *new_ImActorModelEntityCompatObsoleteGroupMember_initWithBSBserValues_(BSBserValues *values) {
  ImActorModelEntityCompatObsoleteGroupMember *self = [ImActorModelEntityCompatObsoleteGroupMember alloc];
  ImActorModelEntityCompatObsoleteGroupMember_initWithBSBserValues_(self, values);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelEntityCompatObsoleteGroupMember)
