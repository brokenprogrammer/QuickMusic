//
//  Album.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMSong.h"

@interface QMAlbum : NSObject {
    
}

@property NSString* albumTitle;        /* Album Title */
@property NSUInteger* albumTrackCount; /* Ammount of tracks in album */
@property NSString* albumArtist;       /* Album Artist */

@property NSMutableArray* albumSongs;  /* Array of songs owned by Album */

//Initialize using only a title
- (id) initWithTitle:(NSString *)title;
//Initialize using title and artist
- (id) initWithTitleAndArtist:(NSString *)title :(NSString *)artist;

//Add new Song to the album
- (void) addSong:(QMSong *)song;

//Get Song with the specified title
- (QMSong *) getSongByTitle:(NSString *)title;
//Get Song at the specified index
- (QMSong *) getSongByID:(NSUInteger)trackID;


@end