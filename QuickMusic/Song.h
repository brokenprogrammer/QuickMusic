//
//  Song.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#ifndef Song_h
#define Song_h

#import <Foundation/Foundation.h>
#import <iTunesLibrary/ITLibMediaItem.h>
#import <iTunesLibrary/ITLibAlbum.h>
#import <iTunesLibrary/ITLibArtist.h>

@interface Song : NSObject {
    
}

@property NSString* title;
@property NSString* artist;
@property NSString* composer;
@property NSString* album;
@property NSUInteger trackNumber;
@property NSString* genre;
@property NSUInteger totalTime;

@property NSInteger rating;
@property NSDate* releaseDate;
@property NSUInteger year;

@property NSUInteger beatsPerMinute;
@property NSURL* location;
@property NSUInteger locationType;

//- (id) initWithTitle:(NSString *)title;
//- (id) initWithLocation: (NSURL *)location;
//- (id) initWithMediaItem: (ITLibMediaItem *)songInfo;
@end

#endif /* Song_h */
