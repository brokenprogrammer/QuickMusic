//
//  main.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QMImporter.h"
#import "QMLibrary.h"
#import "QMAlbum.h"
#import <iTunesLibrary/ITLibrary.h>

int main(int argc, const char * argv[]) {
    QMLibrary *MyLib = [QMImporter importITLib];
    
    NSLog(@"%@", [[[MyLib getAlbums] objectAtIndex:0] albumTitle]);
    NSLog(@"%@", [MyLib getAlbums]);
    NSLog(@"%lu", (unsigned long)[[[[MyLib getAlbums] objectAtIndex:0] albumSongs] count]);
    return NSApplicationMain(argc, argv);
}
