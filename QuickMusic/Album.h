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

@property NSString* title;
@property NSUInteger* trackCount;
@property NSString* artist;

@property NSMutableArray* songs;

- (id) initWithTitle:(NSString *)title;
- (id) initWithTitleAndArtist:(NSString *)title :(NSString *)artist;

- (void) addSong:(Song *)song;
//- (Song *) getSongByTitle:(NSString *)title;
- (Song *) getSongByID:(NSUInteger)trackID;


@end

#endif /* Album_h */
