//
//  Library.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/26/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMAlbum.h"
#import "QMSong.h"

@interface QMLibrary : NSObject {
    
}

@property const NSString* source; /* Source of the import */
@property NSMutableArray* albums; /* Array of albums */
@property NSUInteger albumCount;  /* Ammount of albums */

//Initialize with sourcename
- (id) initWithSource:(NSString *)sourceName;

//Add new album to library
- (void) addAlbum:(QMAlbum *)album;

//Retrieves all albums
- (NSMutableArray *) getAlbums;

//Return Album by its array index
- (QMAlbum *) getAlbumById:(NSUInteger) albumID;

//Returns Albums of specific artist
- (NSMutableArray *) getAlbumByArtist:(NSString *) artist;

//Returns Album by using a Songs properties.
- (QMAlbum *) getAlbumBySong:(QMSong *) song;
@end