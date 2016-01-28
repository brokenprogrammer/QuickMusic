//
//  LibraryTests.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/28/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QMImporter.h"
#import "QMLibrary.h"
#import "QMAlbum.h"
#import "QMSong.h"
@interface LibraryTests : XCTestCase

@property QMLibrary* testLib;

@end

@implementation LibraryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _testLib = [QMImporter importITLib];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLibraryType {
    XCTAssertEqual([_testLib isKindOfClass:[QMLibrary class]], true, @"The testLib is a Library Object.");
}

- (void)testLibraryValues {
    XCTAssertEqual([[_testLib source ]isKindOfClass:[NSString class]], true, @"The testLib's source is a NSString Object.");
    
    XCTAssertEqual([[_testLib albums] isKindOfClass:[NSMutableArray class]], true, @"The testLib's albums array is a NSMutableArray Object.");
    
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitle:@"testAlbum"];
    [_testLib addAlbum:newAlbum];
    XCTAssertEqual([[_testLib albums] count] >= 0, true, @"The testLib's albums is an NSMutableArray Object.");
    
    XCTAssertEqual([_testLib albumCount] >= 0, true, @"The testLib's albumCount is a NSUInteger Object.");
}

- (void)testAddAlbum {
    NSUInteger lastAlbumCount = [[_testLib albums] count];
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitle:@"testAlbum"];
    
    [_testLib addAlbum:newAlbum];
    
    XCTAssertGreaterThan([[_testLib albums] count], lastAlbumCount, @"Successfully added album to library.");
}

- (void)testGetAlbums {
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitle:@"testAlbum"];
    [_testLib addAlbum:newAlbum];
    
    NSUInteger newAlbumCount = [[_testLib albums] count] -1;
    
    XCTAssertEqual([[[_testLib getAlbums] objectAtIndex:newAlbumCount] isKindOfClass:[QMAlbum class]], true, @"getAlbums returns all albums.");
    
    XCTAssertEqual([[[_testLib getAlbums] objectAtIndex:newAlbumCount] albumTitle], @"testAlbum", @"The testLib's latest Albums titles match");
}

- (void)testGetAlbumByID {
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitle:@"testAlbum"];
    
    [_testLib addAlbum:newAlbum];
    
    NSUInteger songAmmount = [[_testLib albums] count] - 1;
    
    XCTAssertEqual([[_testLib getAlbumById:songAmmount] isKindOfClass:[QMAlbum class]], true, @"getAlbumByID returns the Album at the specified index.");
    XCTAssertEqual([[_testLib getAlbumById:songAmmount] albumTitle], @"testAlbum", @"Titles for getAlbumByID is matching.");
}

- (void)testGetAlbumByArtist {
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitleAndArtist:@"testAlbum" :@"testArtist"];
    
    [_testLib addAlbum:newAlbum];
    
    XCTAssertEqual([[_testLib getAlbumByArtist:@"testArtist"] isKindOfClass:[NSMutableArray class]], true, @"getAlbumByArtist returns an NSMutableArray.");
    
    XCTAssertEqual([[[_testLib getAlbumByArtist:@"testArtist"] objectAtIndex:0] albumTitle], @"testAlbum", @"Titles for getAlbumByArtist is matching.");
}

- (void)testGetAlbumBySong {
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"testSong"];
    newSong.artist = @"testArtist";
    newSong.album = @"testAlbum";
    
    QMAlbum *newAlbum = [[QMAlbum alloc] initWithTitleAndArtist:@"testAlbum" :@"testArtist"];
    
    [newAlbum addSong:newSong];
    [_testLib addAlbum:newAlbum];
    
    XCTAssertEqual([[_testLib getAlbumBySong:newSong] isKindOfClass:[QMAlbum class]], true, @"getAlbumBySong return an Album.");
    XCTAssertEqual([[_testLib getAlbumBySong:newSong] albumTitle], @"testAlbum", @"Titles for getAlbumBySong is matching.");
}

@end
