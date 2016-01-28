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

@interface AlbumTests : XCTestCase

@property (nonatomic) QMAlbum* testAlbum;

@end

@implementation AlbumTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testAlbum = [[[QMImporter importITLib] getAlbums] objectAtIndex:0];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAlbumType {
    XCTAssertEqual([self.testAlbum isKindOfClass:[QMAlbum class]], true, @"The testAlbum is a Album Object.");
}

- (void)testAlbumValues {
    XCTAssertEqual([self.testAlbum isKindOfClass:[QMAlbum class]], true, @"The testAlbum is a Album Object.");
}

- (void)testAddSong {
    NSUInteger songAmmount = [[self.testAlbum albumSongs] count];
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"A New Song"];
    
    [self.testAlbum addSong:newSong];
    
    XCTAssertGreaterThan([[self.testAlbum albumSongs] count], songAmmount, @"Successfully added song to album.");
}

- (void)testGetSongByTitle {
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"TestTitle"];
    
    [self.testAlbum addSong:newSong];
    
    XCTAssertEqual([[self.testAlbum getSongByTitle:@"TestTitle"] isKindOfClass:[QMSong class]], true, @"getSongByTitle returns a song with matching title");
    XCTAssertEqual([[self.testAlbum getSongByTitle:@"TestTitle"] title], @"TestTitle", @"Titles for getSongByTitle is matching.");
}

- (void)testGetSongByID {
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"TestTitle"];
    
    [self.testAlbum addSong:newSong];
    
    NSUInteger songAmmount = [[self.testAlbum albumSongs] count] - 1;
    
    XCTAssertEqual([[self.testAlbum getSongByID:songAmmount] isKindOfClass:[QMSong class]], true, @"getSongByID returns the song at the specified index.");
    XCTAssertEqual([[self.testAlbum getSongByID:songAmmount] title], @"TestTitle", @"Titles for getSongByID is matching.");
}

@end
