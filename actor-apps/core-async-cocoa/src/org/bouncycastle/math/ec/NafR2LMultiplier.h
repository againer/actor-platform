//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core-crypto/src/main/java/org/bouncycastle/math/ec/NafR2LMultiplier.java
//

#ifndef _OrgBouncycastleMathEcNafR2LMultiplier_H_
#define _OrgBouncycastleMathEcNafR2LMultiplier_H_

#include "J2ObjC_header.h"
#include "org/bouncycastle/math/ec/AbstractECMultiplier.h"

@class JavaMathBigInteger;
@class OrgBouncycastleMathEcECPoint;

@interface OrgBouncycastleMathEcNafR2LMultiplier : OrgBouncycastleMathEcAbstractECMultiplier

#pragma mark Public

- (instancetype)init;

#pragma mark Protected

- (OrgBouncycastleMathEcECPoint *)multiplyPositiveWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p
                                                            withJavaMathBigInteger:(JavaMathBigInteger *)k;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcNafR2LMultiplier)

FOUNDATION_EXPORT void OrgBouncycastleMathEcNafR2LMultiplier_init(OrgBouncycastleMathEcNafR2LMultiplier *self);

FOUNDATION_EXPORT OrgBouncycastleMathEcNafR2LMultiplier *new_OrgBouncycastleMathEcNafR2LMultiplier_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcNafR2LMultiplier)

#endif // _OrgBouncycastleMathEcNafR2LMultiplier_H_
