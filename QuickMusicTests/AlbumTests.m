//
//  AlbumTests.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/27/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

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
    _testAlbum = [[[QMImporter importITLib] getAlbums] objectAtIndex:0];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAlbumType {
    XCTAssertEqual([_testAlbum isKindOfClass:[QMAlbum class]], true, @"The testAlbum is a Album Object.");
}

- (void)testAlbumValues {
    XCTAssertEqual([_testAlbum isKindOfClass:[QMAlbum class]], true, @"The testAlbum is a Album Object.");
}

- (void)testAddSong {
    NSUInteger songAmmount = [[_testAlbum albumSongs] count];
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"A New Song"];
    
    [_testAlbum addSong:newSong];
    
    XCTAssertGreaterThan([[_testAlbum albumSongs] count], songAmmount, @"Successfully added song to album.");
}

- (void)testGetSongByTitle {
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"TestTitle"];
    
    [_testAlbum addSong:newSong];
    
    XCTAssertEqual([[_testAlbum getSongByTitle:@"TestTitle"] isKindOfClass:[QMSong class]], true, @"getSongByTitle returns a song with matching title");
    XCTAssertEqual([[_testAlbum getSongByTitle:@"TestTitle"] title], @"TestTitle", @"Titles for getSongByTitle is matching.");
}

- (void)testGetSongByID {
    QMSong *newSong = [[QMSong alloc] initWithTitle:@"TestTitle"];
    
    [_testAlbum addSong:newSong];
    
    NSUInteger songAmmount = [[_testAlbum albumSongs] count] - 1;
    
    XCTAssertEqual([[_testAlbum getSongByID:songAmmount] isKindOfClass:[QMSong class]], true, @"getSongByID returns the song at the specified index.");
    XCTAssertEqual([[_testAlbum getSongByID:songAmmount] title], @"TestTitle", @"Titles for getSongByID is matching.");
}

@end
