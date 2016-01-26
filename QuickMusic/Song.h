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

@interface Song : NSObject

@property NSString* title;
@property NSString* artist;
@property NSString* album;
@property NSUInteger* trackNumber;
@property NSString* genre;
@property NSUInteger* totalTime;

@property NSDate* releaseDate;
@property NSUInteger* year;

@property NSUInteger* size;
@property NSURL* location;


@end

#endif /* Song_h */
