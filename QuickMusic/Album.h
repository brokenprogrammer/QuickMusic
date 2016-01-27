//
//  Album.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#ifndef Album_h
#define Album_h

#import <Foundation/Foundation.h>
#import "Song.h"

@interface Album : NSObject {
    
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
- (void) addSong:(Song *)song;

//Get Song with the specified title
- (Song *) getSongByTitle:(NSString *)title;
//Get Song at the specified index
- (Song *) getSongByID:(NSUInteger)trackID;


@end

#endif /* Album_h */
