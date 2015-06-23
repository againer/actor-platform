//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/library/core/src/main/java/im/actor/model/api/rpc/RequestLoadHistory.java
//

#ifndef _APRequestLoadHistory_H_
#define _APRequestLoadHistory_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class APOutPeer;
@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APRequestLoadHistory_HEADER 118

@interface APRequestLoadHistory : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithAPOutPeer:(APOutPeer *)peer
                         withLong:(jlong)minDate
                          withInt:(jint)limit;

+ (APRequestLoadHistory *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (jint)getLimit;

- (jlong)getMinDate;

- (APOutPeer *)getPeer;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestLoadHistory)

J2OBJC_STATIC_FIELD_GETTER(APRequestLoadHistory, HEADER, jint)

FOUNDATION_EXPORT APRequestLoadHistory *APRequestLoadHistory_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestLoadHistory_initWithAPOutPeer_withLong_withInt_(APRequestLoadHistory *self, APOutPeer *peer, jlong minDate, jint limit);

FOUNDATION_EXPORT APRequestLoadHistory *new_APRequestLoadHistory_initWithAPOutPeer_withLong_withInt_(APOutPeer *peer, jlong minDate, jint limit) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestLoadHistory_init(APRequestLoadHistory *self);

FOUNDATION_EXPORT APRequestLoadHistory *new_APRequestLoadHistory_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestLoadHistory)

typedef APRequestLoadHistory ImActorModelApiRpcRequestLoadHistory;

#endif // _APRequestLoadHistory_H_