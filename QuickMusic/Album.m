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
/**
 * Initialize new Album with the specified title.
 *
 * @param title - the title of the Album.
 * @returns the new instance of the Album.
 */
- (id) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _albumTitle = title;
        _albumSongs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/**
 * Initialize new Album with the specified title and artist.
 *
 * @param title - the title of the Album.
 * @param artist - the artist of the Album.
 * @returns the new instance of the Album.
 */
- (id) initWithTitleAndArtist:(NSString *)title :(NSString *)artist {
    if (self = [super init]) {
        _albumTitle = title;
        _albumArtist = artist;
        _albumSongs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/**
 * Adds a new Song into the Albums array of Songs and
 *     increments the track count.
 * @param song - a new Song object to add to the songs array.
 */
- (void) addSong:(Song *)song {
    [_albumSongs addObject:song];
    _albumTrackCount++;
}

/**
 * Returns a Song from the Album that has the specified title.
 *
 * @param title - a Song title to use to find a matching Song object.
 * @returns a Song object with the specified title. Returns nil if no Song
 *    was found.
 */
- (Song *) getSongByTitle:(NSString *)title {
    for (int x = 0; x < [_albumSongs count]; x++) {
        if ([title isEqualToString:[[_albumSongs objectAtIndex:x] title]]) {
            return [_albumSongs objectAtIndex:x];
        }
    }
    return nil;
}

/**
 * Returns a Song from the Albums song array with the specified index.
 *
 * @param trackID - an index to look at in the songs array.
 * @returns a Song object found at the specified index. Returns nil if 
 *     index doesn't exist.
 */
- (Song *) getSongByID:(NSUInteger)trackID {
    if (trackID < [_albumSongs count]) {
        return _albumSongs[trackID];
    }
    return nil;
}

@end