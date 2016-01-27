//
//  ImporterTests.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/27/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Importer.h"
#import "Library.h"

@interface ImporterTests : XCTestCase

//@property (nonatomic) Importer *importer;

@end

@implementation ImporterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //self.importer = [[Importer alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testImporter {
    Library *importedLib = [Importer importITLib];
    XCTAssertEqual([importedLib isKindOfClass:[Library class]], true, @"Imported Library is a new Library Object.");
}

@end
