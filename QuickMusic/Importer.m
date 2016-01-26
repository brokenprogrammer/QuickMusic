//
//  Importer.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import "Importer.h"

@implementation Importer

- (void) importLib {
    NSError *error = nil;
    ITLibrary *aLib = [ITLibrary libraryWithAPIVersion:@"1.0" error:&error];
    
    if (aLib) {
        NSArray *tracks = aLib.allMediaItems;
        
        if (tracks.count >= 1) {
            
            NSInteger count = [tracks count];
            
            for (int i = 0; i < count; i++) {
                ITLibMediaItem *cur = [tracks objectAtIndex:i];
                if (cur.mediaKind == 2) {
                    NSLog(@"%i %@", i, [cur title]);
                }
            }
            
        }
    } else {
        NSLog(@"%@", error);
    }
}


@end