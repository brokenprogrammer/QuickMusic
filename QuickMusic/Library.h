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

@property const NSString* source; /* Source of the import */
@property NSMutableArray* albums; /* Array of albums */
@property NSUInteger albumCount;  /* Ammount of albums */

//Initialize with sourcename
- (id) initWithSource:(NSString *)sourceName;

//Add new album to library
- (void) addAlbum:(Album *)album;

//Retrieves all albums
- (NSMutableArray *) getAlbums;

//Return Album by its array index
- (Album *) getAlbumById:(NSUInteger) albumID;

//Returns Albums of specific artist
- (NSMutableArray *) getAlbumByArtist:(NSString *) artist;

//Returns Album by using a Songs properties.
- (Album *) getAlbumBySong:(Song *) song;
@end

#endif /* Library_h */
