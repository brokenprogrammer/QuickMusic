//
//  Album.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import "Album.h"

@implementation Album {
    
}

- (id) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _title = title;
        _songs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id) initWithTitleAndArtist:(NSString *)title :(NSString *)artist {
    if (self = [super init]) {
        _title = title;
        _artist = artist;
        _songs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) addSong:(Song *)song {
    [_songs addObject:song];
    _trackCount++;
}

//- (Song *) getSongByTitle:(NSString *)title {
    
//}

- (Song *) getSongByID:(NSUInteger)trackID {
    if (trackID < [_songs count]) {
        return _songs[trackID];
    }
    return _songs[trackID];
}

@end