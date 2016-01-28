//
//  Song.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iTunesLibrary/ITLibMediaItem.h>
#import <iTunesLibrary/ITLibAlbum.h>
#import <iTunesLibrary/ITLibArtist.h>

@interface QMSong : NSObject {
    
}

@property NSString* title;           /* Song Title */
@property NSString* artist;          /* Song Artist */
@property NSString* composer;        /* Song Composer */
@property NSString* album;           /* Song Album Title */
@property NSUInteger trackNumber;    /* Song TrackNumber */
@property NSString* genre;           /* Song Genre */
@property NSUInteger totalTime;      /* Song Total RunTime */

@property NSInteger rating;          /* Song Rating */
@property NSDate* releaseDate;       /* Song Release Date */
@property NSUInteger year;           /* Song Release Year */

@property NSUInteger beatsPerMinute; /* Song Beats Per Minute BPM */
@property NSURL* location;           /* Song File Path */
@property NSUInteger locationType;   /* Song LocationType (File, URL, Remote) */

//Initialize using only a title
- (id) initWithTitle:(NSString *)title;
//Initialize using only a file location
- (id) initWithLocation: (NSURL *)location;
//Initialize using the information from an iTunes Media Item
- (id) initWithMediaItem: (ITLibMediaItem *)songInfo;
@end