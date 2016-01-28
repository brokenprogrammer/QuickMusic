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

@interface SongTests : XCTestCase

@property (nonatomic) QMSong* testSong;

@end

@implementation SongTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _testSong = [[[[[QMImporter importITLib] getAlbums] objectAtIndex:0] albumSongs] objectAtIndex:0];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSongType {
    XCTAssertEqual([self.testSong isKindOfClass:[QMSong class]], true, @"The testSong is a Song Object.");
}

- (void)testSongValues {
    /* Test For Song Title */
    XCTAssertEqual([[self.testSong title] isKindOfClass:[NSString class]], true, @"The testSong title is a NSString.");
    
    /* Test For Song Artist */
    XCTAssertEqual([[self.testSong artist] isKindOfClass:[NSString class]], true, @"The testSong artist is a NSString.");
    
    /* Test For Song Composer */
    if ([self.testSong composer] != nil) {
      XCTAssertEqual([[self.testSong composer] isKindOfClass:[NSString class]], true, @"The testSong composer is a NSString.");
    } else {
        XCTAssertEqual([self.testSong composer] == nil, true, @"The testSong composer is a NSString.");
    }
    
    /* Test For Song Album */
    if ([self.testSong album] != nil) {
        XCTAssertEqual([[self.testSong album] isKindOfClass:[NSString class]], true, @"The testSong album is a NSString.");
    } else {
        XCTAssertEqual([self.testSong album] == nil, true, @"The testSong album is a NSString.");
    }
    
    /* Test For Song TrackNumber */
    if ([self.testSong trackNumber]) {
        XCTAssertEqual([self.testSong trackNumber] > 0, true, @"The testSong trackNumber is a NSUInteger.");
    }
    
    /* Test For Song Genre */
    if ([self.testSong genre] != nil) {
        XCTAssertEqual([[self.testSong genre] isKindOfClass:[NSString class]], true, @"The testSong genre is a NSString.");
    } else {
        XCTAssertEqual([self.testSong genre] == nil, true, @"The testSong genre is a NSString and not defined.");
    }
    
    /* Test For Song totalTime */
    if ([self.testSong totalTime]) {
        XCTAssertEqual([self.testSong totalTime] > 0, true, @"The testSong totalTime is a NSUInteger.");
    }
    
    /* Test For Song Rating */
    if ([self.testSong rating]) {
        XCTAssertEqual([self.testSong rating] > 0, true, @"The testSong rating is a NSUInteger.");
    }
    
    /* Test For Song releaseDate */
    if ([self.testSong releaseDate] != nil) {
        XCTAssertEqual([[self.testSong releaseDate] isKindOfClass:[NSDate class]], true, @"The testSong releaseDate is a NSDate.");
    } else {
        XCTAssertEqual([self.testSong releaseDate] == nil, true, @"The testSong releaseDate is a NSDate.");
    }
    
    /* Test For Song year */
    if ([self.testSong year]) {
        XCTAssertEqual([self.testSong year] > 0, true, @"The testSong year is a NSUInteger.");
    }
    
    /* Test For Song beatsPerMinute */
    if ([self.testSong beatsPerMinute]) {
        XCTAssertEqual([self.testSong beatsPerMinute] > 0, true, @"The testSong beatsPerMinute is a NSUInteger.");
    }
    
    /* Test For Song File Location */
    if ([self.testSong location] != nil) {
        XCTAssertEqual([[self.testSong location] isKindOfClass:[NSURL class]], true, @"The testSong location is a NSURL.");
    } else {
        XCTAssertEqual([self.testSong location] == nil, true, @"The testSong location is a NSURL.");
    }
    
    /* Test For Song locationType */
    if ([self.testSong locationType]) {
        XCTAssertEqual([self.testSong locationType] >= 0, true, @"The testSong composer is a NSUInteger.");
    }
}

@end
