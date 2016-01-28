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

#import "QMLibrary.h"

@implementation QMLibrary {
    
}

/**
 * Initialize a new Library by giving it a name of where its
 * imported from.
 *
 * @param sourceName - name of the source the library was imported from.
 * @returns self instance which is initialized.
 */
- (id) initWithSource:(NSString *)sourceName {
    if (self = [super init]) {
        self.source = sourceName;
        self.albums = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 * Adds a new Album into the libraries array of albums and
 *     increments the album count.
 * @param album - a new album object to add to the albums array.
 */
- (void) addAlbum:(QMAlbum *)album {
    [self.albums addObject:album];
    self.albumCount++;
}

/**
 * Returns the entire array of albums contained in the Library.
 *
 * @returns the NSMutableArray albums which contains all the
 *     albums in the library.
 */
- (NSMutableArray *) getAlbums {
    return self.albums;
}

/**
 * Returns the album by its index in the albums array.
 *
 * @param albumID - index of the album to be returned.
 * @returns Album from the albums array at index of albumID. 
 *     returns nil if there is no album at the specified index.
 */
- (QMAlbum *) getAlbumById:(NSUInteger)albumID {
    if (albumID < [self.albums count]) {
        return self.albums[albumID];
    }
    return nil;
}

/**
 * Returns all the albums from the specified artist.
 *
 * @param artist - the artist to return albums from.
 * @returns Array of albums that has the specified artist.
 *     returns nil if artist not found in any albums.
 */
- (NSMutableArray *) getAlbumByArtist:(NSString *)artist {
    NSMutableArray *albumsFromArtist = [[NSMutableArray alloc] init];
    
    for (int x = 0; x < self.albumCount; x++) {
        if ([artist isEqualToString:[[self.albums objectAtIndex:x] albumArtist]]) {
            [albumsFromArtist addObject:[self.albums objectAtIndex:x]];
        }
    }
    
    if ([albumsFromArtist count] < 1) {
        albumsFromArtist = nil;
        return nil;
    }
    
    return albumsFromArtist;
}

/**
 * Returns an Album by using the information from the specified Song Object
 *     loops through the entire albums array matching the album name
 *     and artist name with the albums in the array.
 *
 * @param song - a Song object to use values from.
 * @returns an Album if the album name and artist name from the
 *     song has any matches inside the albums array. Returns nil
 *     if there was no matches.
 */
- (QMAlbum *) getAlbumBySong:(QMSong *)song {
    NSString *albumTitle = song.album;
    NSString *albumArtist = song.artist;
    
    for (int x = 0; x < self.albumCount; x++) {
        if ([albumTitle isEqualToString:[[self.albums objectAtIndex:x] albumTitle]]) {
            if ([albumArtist isEqualToString:[[self.albums objectAtIndex:x] albumArtist]]) {
                return [self.albums objectAtIndex:x];
            }
        }
    }
    return nil;
}
@end