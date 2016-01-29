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

#import "QMSong.h"
#import <iTunesLibrary/ITLibMediaItem.h>
#import <iTunesLibrary/ITLibAlbum.h>
#import <iTunesLibrary/ITLibArtist.h>

@implementation QMSong {
    
}

@synthesize title;
@synthesize artist;
@synthesize composer;
@synthesize album;
@synthesize trackNumber;
@synthesize genre;
@synthesize totalTime;

@synthesize rating;
@synthesize releaseDate;
@synthesize year;

@synthesize beatsPerMinute;
@synthesize location;
@synthesize locationType;

/**
 * Initialize new Song with the specified title.
 * This will create an empty song with only a title.
 *
 * @param title - the title of the Song.
 * @returns the new instance of the Song.
 */
- (id)initWithTitle:(NSString *)songTitle {
    if (self = [super init]) {
        self.title = songTitle;
    }
    return self;
}

/**
 * Initialize new Song with the specified file location.
 * This will create an empty song with only a file location.
 *
 * @param location - the file location of the Song.
 * @returns the new instance of the Song.
 */
- (id)initWithLocation:(NSURL *)songLocation {
    if (self = [super init]) {
        self.location = songLocation;
    }
    return self;
}

/**
 * Initialize new Song using a complete iTunes Media Item.
 * This will create a full Song initializing all the properties.
 *
 * @param songInfo - iTunes media item containing all information for a Song.
 * @returns the new instance of the Song.
 */
- (id)initWithMediaItem:(ITLibMediaItem *)songInfo {
    if (self = [super init]) {
        self.title = [songInfo title];
        self.artist = [[songInfo artist] name];
        self.composer = [songInfo composer];
        self.album = [[songInfo album] title];
        self.trackNumber = [songInfo trackNumber];
        self.genre = [songInfo genre];
        self.totalTime = [songInfo totalTime];
        
        self.rating = [songInfo rating];
        self.releaseDate = [songInfo releaseDate];
        self.year = [songInfo year];
        
        self.beatsPerMinute = [songInfo beatsPerMinute];
        self.location = [songInfo location];
    }
    
    return self;
}
@end

