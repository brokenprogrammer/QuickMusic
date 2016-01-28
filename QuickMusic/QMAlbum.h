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