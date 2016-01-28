/**
 * QuickMusic.
 * An simple OS X Music Player.
 *
 * The MIT License (MIT)
 *
 * Copyright (C) 2016 The QuickMusic Project
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

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
