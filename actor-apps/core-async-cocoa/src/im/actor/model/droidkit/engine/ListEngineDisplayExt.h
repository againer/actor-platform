//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/library/core-async/src/main/java/im/actor/model/droidkit/engine/ListEngineDisplayExt.java
//

#ifndef _DKListEngineDisplayExt_H_
#define _DKListEngineDisplayExt_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/engine/ListEngine.h"

@protocol DKListEngineDisplayListener;
@protocol DKListEngineDisplayLoadCallback;

@protocol DKListEngineDisplayExt < DKListEngine, NSObject, JavaObject >

- (void)subscribeWithListener:(id<DKListEngineDisplayListener>)listener;

- (void)unsubscribeWithListener:(id<DKListEngineDisplayListener>)listener;

- (void)loadForwardWithLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadForwardAfterSortKey:(jlong)afterSortKey
                      withLimit:(jint)limit
                   withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadForwardWithQuery:(NSString *)query
                   withLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadForwardWithQuery:(NSString *)query
                afterSortKey:(jlong)afterSortKey
                   withLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadBackwardWithLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadBackwardBeforeSortKey:(jlong)beforeSortKey
                        withLimit:(jint)limit
                     withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadBackwardWithQuery:(NSString *)query
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadBackwardWithQuery:(NSString *)query
                beforeSortKey:(jlong)beforeSortKey
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

- (void)loadCenterWithSortKey:(jlong)centerSortKey
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback;

@end

J2OBJC_EMPTY_STATIC_INIT(DKListEngineDisplayExt)

J2OBJC_TYPE_LITERAL_HEADER(DKListEngineDisplayExt)

#define ImActorModelDroidkitEngineListEngineDisplayExt DKListEngineDisplayExt

#endif // _DKListEngineDisplayExt_H_