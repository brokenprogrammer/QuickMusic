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

- (id) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _title = title;
    }
    return self;
}

- (id) initWithLocation:(NSURL *)location {
    if (self = [super init]) {
        _location = location;
    }
    return self;
}

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

