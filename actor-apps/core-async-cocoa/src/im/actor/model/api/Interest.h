//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/library/core/src/main/java/im/actor/model/api/Interest.java
//

#ifndef _APInterest_H_
#define _APInterest_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/bser/BserObject.h"

@class BSBserValues;
@class BSBserWriter;
@protocol JavaUtilList;

@interface APInterest : BSBserObject

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithInt:(jint)id_
               withNSString:(NSString *)title
                withBoolean:(jboolean)isSelected
           withJavaUtilList:(id<JavaUtilList>)childInterests;

- (id<JavaUtilList>)getChildInterests;

- (jint)getId;

- (NSString *)getTitle;

- (jboolean)isSelected;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APInterest)

FOUNDATION_EXPORT void APInterest_initWithInt_withNSString_withBoolean_withJavaUtilList_(APInterest *self, jint id_, NSString *title, jboolean isSelected, id<JavaUtilList> childInterests);

FOUNDATION_EXPORT APInterest *new_APInterest_initWithInt_withNSString_withBoolean_withJavaUtilList_(jint id_, NSString *title, jboolean isSelected, id<JavaUtilList> childInterests) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APInterest_init(APInterest *self);

FOUNDATION_EXPORT APInterest *new_APInterest_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APInterest)

typedef APInterest ImActorModelApiInterest;

#endif // _APInterest_H_