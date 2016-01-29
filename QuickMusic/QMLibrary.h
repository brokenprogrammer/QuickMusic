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
#import "QMAlbum.h"
#import "QMSong.h"

@interface QMLibrary : NSObject {
    
}

@property (nonatomic, copy) const NSString* source; /* Source of the import */
@property (nonatomic, strong) NSMutableArray* albums; /* Array of albums */
@property (nonatomic )NSUInteger albumCount;          /* Ammount of albums */

//Initialize with sourcename
- (id)initWithSource:(NSString *)sourceName;

//Add new album to library
- (void)addAlbum:(QMAlbum *)album;

//Retrieves all albums
- (NSMutableArray *)getAlbums;

//Return Album by its array index
- (QMAlbum *)getAlbumById:(NSUInteger) albumID;

//Returns Albums of specific artist
- (NSMutableArray *)getAlbumByArtist:(NSString *) artist;

//Returns Album by using a Songs properties.
- (QMAlbum *)getAlbumBySong:(QMSong *) song;

//Sorting functions
- (void)sortByTitle;     /* Sorts the albums in alphabetical order by its titles */
- (void)sortByArtist;    /* Sorts the albums in alphabetical order by its artists */
- (void)sortBySongCount; /* Sorts the albums in alphabetical order by its number of songs */

- (NSMutableArray *)searchAlbum:(NSString *)keyWords;
@end