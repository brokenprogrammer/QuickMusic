//
//  Library.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/26/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#ifndef Library_h
#define Library_h

#import <Foundation/Foundation.h>
#import "Album.h"
#import "Song.h"

@interface Library : NSObject {
    
}

@property const NSString* source; /* source of the import */
@property NSMutableArray* albums; /* array of albums */
@property NSUInteger albumCount;  /* ammount of albums */

//Initialize with sourcename
- (id) initWithSource:(NSString *)sourceName;

//Add new album to library
- (void) addAlbum:(Album *)album;

//Retrieves all albums
- (NSMutableArray *) getAlbums;

//Get Album by its array id
- (Album *) getAlbumById:(NSUInteger) albumID;

//Get Albums of specific artist
- (Album *) getAlbumByArtist:(NSString *) artist;

//Get Album by using a Song.
- (Album *) getAlbumBySong:(Song *) song;
@end

#endif /* Library_h */
