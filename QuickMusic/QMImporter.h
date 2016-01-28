//
//  QMImporter.h
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iTunesLibrary/ITLibrary.h>
#import <iTunesLibrary/ITLibMediaItem.h>

#import "QMLibrary.h"
#import "QMAlbum.h"
#import "QMSong.h"


@interface QMImporter : NSObject {
    // Protected instance variables
}

//Import iTunes library
+ (QMLibrary *) importITLib;

@end