//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core-crypto/src/main/java/org/bouncycastle/math/ec/ECCurve.java
//

#ifndef _OrgBouncycastleMathEcECCurve_H_
#define _OrgBouncycastleMathEcECCurve_H_

#include "J2ObjC_header.h"

@class IOSByteArray;
@class IOSIntArray;
@class IOSObjectArray;
@class JavaMathBigInteger;
@class OrgBouncycastleMathEcECCurve_Config;
@class OrgBouncycastleMathEcECFieldElement;
@class OrgBouncycastleMathEcECPoint;
@class OrgBouncycastleMathEcECPoint_Fp;
@protocol OrgBouncycastleMathEcECMultiplier;
@protocol OrgBouncycastleMathEcEndoECEndomorphism;
@protocol OrgBouncycastleMathEcPreCompInfo;
@protocol OrgBouncycastleMathFieldFiniteField;

#define OrgBouncycastleMathEcECCurve_COORD_AFFINE 0
#define OrgBouncycastleMathEcECCurve_COORD_HOMOGENEOUS 1
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN 2
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN_CHUDNOVSKY 3
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN_MODIFIED 4
#define OrgBouncycastleMathEcECCurve_COORD_LAMBDA_AFFINE 5
#define OrgBouncycastleMathEcECCurve_COORD_LAMBDA_PROJECTIVE 6
#define OrgBouncycastleMathEcECCurve_COORD_SKEWED 7

@interface OrgBouncycastleMathEcECCurve : NSObject {
 @public
  id<OrgBouncycastleMathFieldFiniteField> field_;
  OrgBouncycastleMathEcECFieldElement *a_, *b_;
  JavaMathBigInteger *order_, *cofactor_;
  jint coord_;
  id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism_;
  id<OrgBouncycastleMathEcECMultiplier> multiplier_;
}

#pragma mark Public

- (OrgBouncycastleMathEcECCurve_Config *)configure;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                        withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)decodePointWithByteArray:(IOSByteArray *)encoded;

- (jboolean)equalsWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)other;

- (jboolean)isEqual:(id)obj;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (OrgBouncycastleMathEcECFieldElement *)getA;

+ (IOSIntArray *)getAllCoordinateSystems;

- (OrgBouncycastleMathEcECFieldElement *)getB;

- (JavaMathBigInteger *)getCofactor;

- (jint)getCoordinateSystem;

- (id<OrgBouncycastleMathEcEndoECEndomorphism>)getEndomorphism;

- (id<OrgBouncycastleMathFieldFiniteField>)getField;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (id<OrgBouncycastleMathEcECMultiplier>)getMultiplier;

- (JavaMathBigInteger *)getOrder;

- (id<OrgBouncycastleMathEcPreCompInfo>)getPreCompInfoWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point
                                                                          withNSString:(NSString *)name;

- (NSUInteger)hash;

- (OrgBouncycastleMathEcECPoint *)importPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p;

- (void)normalizeAllWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)points;

- (void)setPreCompInfoWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point
                                          withNSString:(NSString *)name
                  withOrgBouncycastleMathEcPreCompInfo:(id<OrgBouncycastleMathEcPreCompInfo>)preCompInfo;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

- (OrgBouncycastleMathEcECPoint *)validatePointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                               withJavaMathBigInteger:(JavaMathBigInteger *)y;

- (OrgBouncycastleMathEcECPoint *)validatePointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                               withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                          withBoolean:(jboolean)withCompression;

#pragma mark Protected

- (instancetype)initWithOrgBouncycastleMathFieldFiniteField:(id<OrgBouncycastleMathFieldFiniteField>)field;

- (void)checkPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point;

- (void)checkPointsWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)points;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (id<OrgBouncycastleMathEcECMultiplier>)createDefaultMultiplier;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, field_, id<OrgBouncycastleMathFieldFiniteField>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, a_, OrgBouncycastleMathEcECFieldElement *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, b_, OrgBouncycastleMathEcECFieldElement *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, order_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, cofactor_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, endomorphism_, id<OrgBouncycastleMathEcEndoECEndomorphism>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, multiplier_, id<OrgBouncycastleMathEcECMultiplier>)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_AFFINE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_HOMOGENEOUS, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN_CHUDNOVSKY, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN_MODIFIED, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_LAMBDA_AFFINE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_LAMBDA_PROJECTIVE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_SKEWED, jint)

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleMathEcECCurve_getAllCoordinateSystems();

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_initWithOrgBouncycastleMathFieldFiniteField_(OrgBouncycastleMathEcECCurve *self, id<OrgBouncycastleMathFieldFiniteField> field);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve)

@interface OrgBouncycastleMathEcECCurve_Config : NSObject {
 @public
  jint coord_;
  id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism_;
  id<OrgBouncycastleMathEcECMultiplier> multiplier_;
}

#pragma mark Public

- (OrgBouncycastleMathEcECCurve *)create;

- (OrgBouncycastleMathEcECCurve_Config *)setCoordinateSystemWithInt:(jint)coord;

- (OrgBouncycastleMathEcECCurve_Config *)setEndomorphismWithOrgBouncycastleMathEcEndoECEndomorphism:(id<OrgBouncycastleMathEcEndoECEndomorphism>)endomorphism;

- (OrgBouncycastleMathEcECCurve_Config *)setMultiplierWithOrgBouncycastleMathEcECMultiplier:(id<OrgBouncycastleMathEcECMultiplier>)multiplier;

#pragma mark Package-Private

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)outer$
                                             withInt:(jint)coord
         withOrgBouncycastleMathEcEndoECEndomorphism:(id<OrgBouncycastleMathEcEndoECEndomorphism>)endomorphism
               withOrgBouncycastleMathEcECMultiplier:(id<OrgBouncycastleMathEcECMultiplier>)multiplier;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_Config)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Config, endomorphism_, id<OrgBouncycastleMathEcEndoECEndomorphism>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Config, multiplier_, id<OrgBouncycastleMathEcECMultiplier>)

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_Config_initWithOrgBouncycastleMathEcECCurve_withInt_withOrgBouncycastleMathEcEndoECEndomorphism_withOrgBouncycastleMathEcECMultiplier_(OrgBouncycastleMathEcECCurve_Config *self, OrgBouncycastleMathEcECCurve *outer$, jint coord, id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism, id<OrgBouncycastleMathEcECMultiplier> multiplier);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_Config *new_OrgBouncycastleMathEcECCurve_Config_initWithOrgBouncycastleMathEcECCurve_withInt_withOrgBouncycastleMathEcEndoECEndomorphism_withOrgBouncycastleMathEcECMultiplier_(OrgBouncycastleMathEcECCurve *outer$, jint coord, id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism, id<OrgBouncycastleMathEcECMultiplier> multiplier) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_Config)

@interface OrgBouncycastleMathEcECCurve_AbstractFp : OrgBouncycastleMathEcECCurve

#pragma mark Protected

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_AbstractFp)

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_AbstractFp_initWithJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_AbstractFp *self, JavaMathBigInteger *q);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_AbstractFp)

@interface OrgBouncycastleMathEcECCurve_Fp : OrgBouncycastleMathEcECCurve_AbstractFp {
 @public
  JavaMathBigInteger *q_, *r_;
  OrgBouncycastleMathEcECPoint_Fp *infinity_;
}

#pragma mark Public

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)a
                    withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)a
                    withJavaMathBigInteger:(JavaMathBigInteger *)b
                    withJavaMathBigInteger:(JavaMathBigInteger *)order
                    withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (JavaMathBigInteger *)getQ;

- (OrgBouncycastleMathEcECPoint *)importPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

#pragma mark Protected

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)r
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)r
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
                    withJavaMathBigInteger:(JavaMathBigInteger *)order
                    withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_Fp)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, q_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, r_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, infinity_, OrgBouncycastleMathEcECPoint_Fp *)

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_Fp *self, JavaMathBigInteger *q, JavaMathBigInteger *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_Fp *new_OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *q, JavaMathBigInteger *a, JavaMathBigInteger *b) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_Fp *self, JavaMathBigInteger *q, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_Fp *new_OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *q, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve_Fp *self, JavaMathBigInteger *q, JavaMathBigInteger *r, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_Fp *new_OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(JavaMathBigInteger *q, JavaMathBigInteger *r, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_Fp *self, JavaMathBigInteger *q, JavaMathBigInteger *r, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_Fp *new_OrgBouncycastleMathEcECCurve_Fp_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *q, JavaMathBigInteger *r, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_Fp)

@interface OrgBouncycastleMathEcECCurve_AbstractF2m : OrgBouncycastleMathEcECCurve

#pragma mark Protected

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_AbstractF2m)

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_AbstractF2m_initWithInt_withInt_withInt_withInt_(OrgBouncycastleMathEcECCurve_AbstractF2m *self, jint m, jint k1, jint k2, jint k3);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_AbstractF2m)

@interface OrgBouncycastleMathEcECCurve_F2m : OrgBouncycastleMathEcECCurve_AbstractF2m

#pragma mark Public

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                        withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (jint)getFieldSize;

- (JavaMathBigInteger *)getH;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (jint)getK1;

- (jint)getK2;

- (jint)getK3;

- (jint)getM;

- (JavaMathBigInteger *)getN;

- (jboolean)isKoblitz;

- (jboolean)isTrinomial;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

#pragma mark Protected

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (id<OrgBouncycastleMathEcECMultiplier>)createDefaultMultiplier;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

#pragma mark Package-Private

- (jbyte)getMu;

- (IOSObjectArray *)getSi;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_F2m)

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_F2m *self, jint m, jint k, JavaMathBigInteger *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_F2m *new_OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_(jint m, jint k, JavaMathBigInteger *a, JavaMathBigInteger *b) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_F2m *self, jint m, jint k, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_F2m *new_OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(jint m, jint k, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_F2m *self, jint m, jint k1, jint k2, jint k3, JavaMathBigInteger *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_F2m *new_OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_(jint m, jint k1, jint k2, jint k3, JavaMathBigInteger *a, JavaMathBigInteger *b) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_F2m *self, jint m, jint k1, jint k2, jint k3, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_F2m *new_OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(jint m, jint k1, jint k2, jint k3, JavaMathBigInteger *a, JavaMathBigInteger *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve_F2m *self, jint m, jint k1, jint k2, jint k3, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve_F2m *new_OrgBouncycastleMathEcECCurve_F2m_initWithInt_withInt_withInt_withInt_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withJavaMathBigInteger_withJavaMathBigInteger_(jint m, jint k1, jint k2, jint k3, OrgBouncycastleMathEcECFieldElement *a, OrgBouncycastleMathEcECFieldElement *b, JavaMathBigInteger *order, JavaMathBigInteger *cofactor) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_F2m)

#endif // _OrgBouncycastleMathEcECCurve_H_
