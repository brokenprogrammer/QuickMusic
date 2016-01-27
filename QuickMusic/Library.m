//
//  Library.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/26/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import "Library.h"

@implementation Library {
    
}

/*
 * initialize a new Library by giving it a name of where its
 * imported from.
 * @param sourceName - name of the source the library was imported from.
 * @returns self instance which is initialized.
 */
- (id) initWithSource:(NSString *)sourceName {
    if (self = [super init]) {
        _source = sourceName;
        _albums = [[NSMutableArray alloc] init];
    }
    return self;
}

/*
 * adds a new Album into the libraries array of albums and 
 *  increments the album count.
 * @param album - a new album object to add to the albums array.
 */
- (void) addAlbum:(Album *)album {
    [_albums addObject:album];
    _albumCount++;
}

/*
 * gets the entire array of albums contained in the Library.
 * @returns the NSMutableArray albums which contains all the
 *  albums in the library.
 */
- (NSMutableArray *) getAlbums {
    return _albums;
}

/*
 * gets the album by its index id in the albums array.
 * @param albumID - index of the album to be returned.
 * @returns Album from the albums array at index of albumID. 
 *  returns nil if there is no album at the specified index.
 */
- (Album *) getAlbumById:(NSUInteger)albumID {
    if (albumID < [_albums count]) {
        return _albums[albumID];
    }
    return nil;
}

/*
 * gets all the albums from the specified artist.
 * @param artist - the artist to return albums from.
 * @returns Array of albums that has the specified artist.
 *  returns nil if artist not found in any albums.
 */
- (Album *) getAlbumByArtist:(NSString *)artist {
    return nil;
}

/*
 * gets an Album by using the information from the specified Song
 *  loops through the entire albums array matching the album name 
 *  and artist name with the albums in the array.
 * @param song - a Song object to use values from.
 * @returns an Album if the album name and artist name from the
 *  song has any matches inside the albums array. returns nil
 *  if there was no matches.
 */
- (Album *) getAlbumBySong:(Song *)song {
    NSString *albumTitle = song.album;
    NSString *albumArtist = song.artist;
    
    for (int x = 0; x < _albumCount; x++) {
        if ([albumTitle isCaseInsensitiveLike:[[_albums objectAtIndex:x] title]]) {
            if ([albumArtist isCaseInsensitiveLike:[[_albums objectAtIndex:x] artist]]) {
                return [_albums objectAtIndex:x];
            }
        }
    }
    return nil;
}
@end