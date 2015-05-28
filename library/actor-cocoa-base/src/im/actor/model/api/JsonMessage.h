//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/JsonMessage.java
//

#ifndef _APJsonMessage_H_
#define _APJsonMessage_H_

#include "J2ObjC_header.h"
#include "im/actor/model/api/Message.h"

@class BSBserValues;
@class BSBserWriter;

@interface APJsonMessage : APMessage

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithNSString:(NSString *)rawJson;

- (jint)getHeader;

- (NSString *)getRawJson;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APJsonMessage)

FOUNDATION_EXPORT void APJsonMessage_initWithNSString_(APJsonMessage *self, NSString *rawJson);

FOUNDATION_EXPORT APJsonMessage *new_APJsonMessage_initWithNSString_(NSString *rawJson) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APJsonMessage_init(APJsonMessage *self);

FOUNDATION_EXPORT APJsonMessage *new_APJsonMessage_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APJsonMessage)

typedef APJsonMessage ImActorModelApiJsonMessage;

#endif // _APJsonMessage_H_