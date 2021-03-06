//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/droidkit/engine/SyncKeyValue.java
//

#ifndef _DKSyncKeyValue_H_
#define _DKSyncKeyValue_H_

#include "J2ObjC_header.h"

@class IOSByteArray;
@protocol DKKeyValueStorage;

@interface DKSyncKeyValue : NSObject

#pragma mark Public

- (instancetype)initWithDKKeyValueStorage:(id<DKKeyValueStorage>)storage;

- (void)delete__WithLong:(jlong)key;

- (IOSByteArray *)getWithLong:(jlong)key;

- (void)putWithLong:(jlong)key
      withByteArray:(IOSByteArray *)data;

@end

J2OBJC_EMPTY_STATIC_INIT(DKSyncKeyValue)

FOUNDATION_EXPORT void DKSyncKeyValue_initWithDKKeyValueStorage_(DKSyncKeyValue *self, id<DKKeyValueStorage> storage);

FOUNDATION_EXPORT DKSyncKeyValue *new_DKSyncKeyValue_initWithDKKeyValueStorage_(id<DKKeyValueStorage> storage) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(DKSyncKeyValue)

typedef DKSyncKeyValue ImActorModelDroidkitEngineSyncKeyValue;

#endif // _DKSyncKeyValue_H_
