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

+ (Song *) populateSong:(ITLibMediaItem *)songInfo {
    Song *newSong = [[Song alloc] init];
    
    newSong.title = [songInfo title];
    newSong.artist = [[songInfo artist] name];
    newSong.composer = [songInfo composer];
    newSong.album = [[songInfo album] title];
    newSong.trackNumber = [songInfo trackNumber];
    newSong.genre = [songInfo genre];
    newSong.totalTime = [songInfo totalTime];
    
    newSong.rating = [songInfo rating];
    newSong.releaseDate = [songInfo releaseDate];
    newSong.year = [songInfo year];
    
    newSong.beatsPerMinute = [songInfo beatsPerMinute];
    newSong.location = [songInfo location];
    
    return newSong;
}

+ (void) importLib {
    NSError *error = nil;
    ITLibrary *aLib = [ITLibrary libraryWithAPIVersion:@"1.0" error:&error];
    
    if (aLib) {
        NSArray *tracks = aLib.allMediaItems;
        
        if (tracks.count >= 1) {
            
            for (int i = 0; i < [tracks count]; i++) {
                ITLibMediaItem *cur = [tracks objectAtIndex:i];
                if (cur.mediaKind == 2) {
                    Song *aSong = [self populateSong:cur];
                    //TODO: finish Song Initializers
                    //TODO: replace populateSong method
                    //TODO: implement Albums using Artistname & Album name in dictionary
                    //TODO: implement library that holds array of albums.
                    NSLog(@"%@ %@ %@", [aSong title], [aSong artist], [aSong album]);
                }
            }
            
        }
    } else {
        NSLog(@"%@", error);
    }
}

@end