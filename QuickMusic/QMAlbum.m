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

#import "QMAlbum.h"

@implementation QMAlbum {
    
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
- (void) addSong:(QMSong *)song {
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
- (QMSong *) getSongByTitle:(NSString *)title {
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
- (QMSong *) getSongByID:(NSUInteger)trackID {
    if (trackID < [_albumSongs count]) {
        return _albumSongs[trackID];
    }
    return nil;
}

@end