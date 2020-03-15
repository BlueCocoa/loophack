//
//  loophack.mm
//  loophack
//
//  Created by Cocoa on 16/03/2020.
//  Copyright © 2020 Cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <limits>

id nothing() {
    return nil;
}

BOOL notForPurchase() {
    return NO;
}

float registrationAudioTimeLimit() {
    return std::numeric_limits<float>::max();
}

int licenseBits() {
    return 1;
}

static void __attribute__((constructor)) init(void) {
    method_setImplementation(class_getInstanceMethod(
     objc_getClass("LBApplicationPolicies"),
     NSSelectorFromString(@"trialWarning")),
     (IMP)nothing);

    method_setImplementation(class_getInstanceMethod(
     objc_getClass("LBApplicationPolicies"),
     NSSelectorFromString(@"isForPurchase")),
     (IMP)notForPurchase);
    
    method_setImplementation(class_getInstanceMethod(
     objc_getClass("LBApplicationPolicies"),
     NSSelectorFromString(@"registrationAudioTimeLimit")),
     (IMP)registrationAudioTimeLimit);
    
    method_setImplementation(class_getInstanceMethod(
     objc_getClass("PTAppController"),
     NSSelectorFromString(@"licenseBits")),
     (IMP)licenseBits);
    
    method_setImplementation(class_getInstanceMethod(
     objc_getClass("PTAppController"),
     NSSelectorFromString(@"licenseBitsGoodly")),
     (IMP)licenseBits);
}
