//
//  Importer.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#ifndef Importer_h
#define Importer_h

#import <Foundation/Foundation.h>
#import <iTunesLibrary/ITLibrary.h>
#import <iTunesLibrary/ITLibMediaItem.h>

#import "Library.h"
#import "Album.h"
#import "Song.h"


@interface Importer : NSObject {
    // Protected instance variables
}

//Import iTunes library
+ (Library *) importITLib;

@end

#endif /* Importer_h */
