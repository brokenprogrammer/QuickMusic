/**
 * QuickMusic.
 * An simple OS X Music Player.
 *
 * The MIT License (MIT)
 *
 * Copyright (C) 2016 The QuickMusic Project
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import <iTunesLibrary/ITLibMediaItem.h>
#import <iTunesLibrary/ITLibAlbum.h>
#import <iTunesLibrary/ITLibArtist.h>

@interface QMSong : NSObject {
    
}

@property (nonatomic, strong) NSString* title;           /* Song Title */
@property (nonatomic, strong) NSString* artist;          /* Song Artist */
@property (nonatomic, strong) NSString* composer;        /* Song Composer */
@property (nonatomic, strong) NSString* album;           /* Song Album Title */
@property (nonatomic) NSUInteger trackNumber;    /* Song TrackNumber */
@property (nonatomic, strong) NSString* genre;           /* Song Genre */
@property (nonatomic) NSUInteger totalTime;      /* Song Total RunTime */

@property (nonatomic) NSInteger rating;          /* Song Rating */
@property (nonatomic, strong) NSDate* releaseDate;       /* Song Release Date */
@property (nonatomic) NSUInteger year;           /* Song Release Year */

@property (nonatomic) NSUInteger beatsPerMinute; /* Song Beats Per Minute BPM */
@property (nonatomic, strong) NSURL* location;           /* Song File Path */
@property (nonatomic) NSUInteger locationType;   /* Song LocationType (File, URL, Remote) */

//Initialize using only a title
- (id) initWithTitle:(NSString *)songTitle;
//Initialize using only a file location
- (id) initWithLocation: (NSURL *)songLocation;
//Initialize using the information from an iTunes Media Item
- (id) initWithMediaItem: (ITLibMediaItem *)songInfo;
@end