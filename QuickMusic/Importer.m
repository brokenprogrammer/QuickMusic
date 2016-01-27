//
//  Importer.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import "Importer.h"

@implementation Importer {
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
+ (Library *) importITLib {
    Library *iTunesLib = [[Library alloc] initWithSource:@"iTunes"];
    
    NSError *error = nil;
    ITLibrary *aLib = [ITLibrary libraryWithAPIVersion:@"1.0" error:&error];
    
    if (aLib) {
        NSArray *tracks = aLib.allMediaItems;
        Album *lastAlbum; /* used to compare songs with the last used album to improve speed. */
        
        if (tracks.count >= 1) {
            
            for (int i = 0; i < [tracks count]; i++) {
                ITLibMediaItem *currentMedia = [tracks objectAtIndex:i];
                
                if (currentMedia.mediaKind == 2) {
                    Song *newSong = [[Song alloc] initWithMediaItem:currentMedia];
                    
                    /* Checking if the last used album is the same for this Song*/
                    if (lastAlbum != nil &&
                         [newSong.album isEqualToString:lastAlbum.albumTitle] &&
                            [newSong.artist isEqualToString:lastAlbum.albumArtist]) {
                        [lastAlbum addSong:newSong];
                    } else { /* If not try find an existing Album using the getAlbumBySong */
                        Album *currentAlbum = [iTunesLib getAlbumBySong:newSong];
                        if (currentAlbum != nil) { /* If an Album was found place the song into it */
                            [currentAlbum addSong:newSong];
                            lastAlbum = currentAlbum;
                        } else { /* If not then initialize a new Album object and place it into the Library */
                            currentAlbum = [[Album alloc] initWithTitleAndArtist:[newSong album] :[newSong artist]];
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
    
    return iTunesLib;
}

@end