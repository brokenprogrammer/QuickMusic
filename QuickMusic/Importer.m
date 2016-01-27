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

+ (Library *) importLib {
    Library *iTunesLib = [[Library alloc] initWithSource:@"iTunes"];
    
    NSError *error = nil;
    ITLibrary *aLib = [ITLibrary libraryWithAPIVersion:@"1.0" error:&error];
    
    if (aLib) {
        NSArray *tracks = aLib.allMediaItems;
        
        if (tracks.count >= 1) {
            
            for (int i = 0; i < [tracks count]; i++) {
                ITLibMediaItem *cur = [tracks objectAtIndex:i];
                if (cur.mediaKind == 2) {
                    Song *aSong = [[Song alloc] initWithMediaItem:cur];
                    
                    Album *currentAlbum = [iTunesLib getAlbumBySong:aSong];
                    if (currentAlbum != nil) {
                        [currentAlbum addSong:aSong];
                    } else {
                        currentAlbum = [[Album alloc] initWithTitleAndArtist:[aSong album] :[aSong artist]];
                        [iTunesLib addAlbum:currentAlbum];
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