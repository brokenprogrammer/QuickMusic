//
//  Song.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import "Song.h"

@implementation Song {
    
}

@synthesize title = _title;
@synthesize artist = _artist;
@synthesize composer = _composer;
@synthesize album = _album;
@synthesize trackNumber = _trackNumber;
@synthesize genre = _genre;
@synthesize totalTime = _totalTime;

@synthesize rating = _rating;
@synthesize releaseDate = _releaseDate;
@synthesize year = _year;

@synthesize beatsPerMinute = _beatsPerMinute;
@synthesize location = _location;
@synthesize locationType = _locationType;

/**
 * Initialize new Song with the specified title.
 * This will create an empty song with only a title.
 *
 * @param title - the title of the Song.
 * @returns the new instance of the Song.
 */
- (id) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _title = title;
    }
    return self;
}

/**
 * Initialize new Song with the specified file location.
 * This will create an empty song with only a file location.
 *
 * @param location - the file location of the Song.
 * @returns the new instance of the Song.
 */
- (id) initWithLocation:(NSURL *)location {
    if (self = [super init]) {
        _location = location;
    }
    return self;
}

/**
 * Initialize new Song using a complete iTunes Media Item.
 * This will create a full Song initializing all the properties.
 *
 * @param songInfo - iTunes media item containing all information for a Song.
 * @returns the new instance of the Song.
 */
- (id) initWithMediaItem:(ITLibMediaItem *)songInfo {
    if (self = [super init]) {
        _title = [songInfo title];
        _artist = [[songInfo artist] name];
        _composer = [songInfo composer];
        _album = [[songInfo album] title];
        _trackNumber = [songInfo trackNumber];
        _genre = [songInfo genre];
        _totalTime = [songInfo totalTime];
        
        _rating = [songInfo rating];
        _releaseDate = [songInfo releaseDate];
        _year = [songInfo year];
        
        _beatsPerMinute = [songInfo beatsPerMinute];
        _location = [songInfo location];
    }
    return self;
}
@end

