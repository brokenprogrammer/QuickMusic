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

#import "QMImporter.h"

@implementation QMImporter {
    //Private instance variables
}

/**
 * Returns a new Library with the entire imported iTunes library.
 * This will import all music contained in iTunes and sort them into Song objects
 * and Album objects and then store them all in a Library object as an Array.
 * This will first find all Media Items in iTunes then loop through all of them
 * and if the Media item is of mediaKind 2 then it is a Song. If it is a Song then
 * it is compared with the last used Album and placing it into the Album it belongs to
 * or creates a new Album if it couldn't be found. The Album is then placed into the
 * library.
 *
 * @returns a new Library with all the imported music from iTunes.
 */
+ (QMLibrary *)importITLib {
    QMLibrary *iTunesLib = [[QMLibrary alloc] initWithSource:@"iTunes"];
    
    @autoreleasepool {
        NSError *error = nil;
        ITLibrary *aLib = [ITLibrary libraryWithAPIVersion:@"1.0" error:&error];
    
        if (aLib) {
            NSArray *tracks = aLib.allMediaItems;
            QMAlbum *lastAlbum; /* used to compare songs with the last used album to improve speed. */
        
            if (tracks.count >= 1) {
            
                for (int i = 0; i < [tracks count]; i++) {
                    ITLibMediaItem *currentMedia = [tracks objectAtIndex:i];
                
                    if (currentMedia.mediaKind == 2) {
                        QMSong *newSong = [[QMSong alloc] initWithMediaItem:currentMedia];
                    
                        /* Checking if the last used album is the same for this Song*/
                        if (lastAlbum != nil &&
                            [newSong.album isEqualToString:lastAlbum.title] &&
                                [newSong.artist isEqualToString:lastAlbum.artist]) {
                            [lastAlbum addSong:newSong];
                        } else { /* If not try find an existing Album using the getAlbumBySong */
                            QMAlbum *currentAlbum = [iTunesLib getAlbumBySong:newSong];
                            if (currentAlbum != nil) { /* If an Album was found place the song into it */
                                [currentAlbum addSong:newSong];
                                lastAlbum = currentAlbum;
                            } else { /* If not then initialize a new Album object and place it into the Library */
                                currentAlbum = [[QMAlbum alloc] initWithTitleAndArtist:[newSong album] :[newSong artist]];
                                [currentAlbum addSong:newSong];
                                [iTunesLib addAlbum:currentAlbum];
                                lastAlbum = currentAlbum;
                            }
                        }
                    }
                }
            }
        } else {
        NSLog(@"%@", error);
        }
    }
    return iTunesLib;
}

@end