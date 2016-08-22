//
//  J2ObjC-PodTests.m
//  J2ObjC-PodTests
//
//  Created by Danny Ruiz on 08/22/2016.
//  Copyright (c) 2016 Danny Ruiz. All rights reserved.
//

// https://github.com/Specta/Specta

#import "java/util/ArrayList.h"

SpecBegin(J2ObjCTest)

describe(@"using j2objc", ^{

    it(@"allows for using Java's ArrayList", ^{
        JavaUtilArrayList *arrayList = [[JavaUtilArrayList alloc] init];
        [arrayList addWithId:@(2)];

        expect([arrayList getWithInt:0]).to.equal(@2);
    });
});

SpecEnd

