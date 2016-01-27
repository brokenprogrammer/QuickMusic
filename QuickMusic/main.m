//
//  main.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Importer.h"
#import "Library.h"
#import "Album.h"
#import <iTunesLibrary/ITLibrary.h>

int main(int argc, const char * argv[]) {
    Library *MyLib = [Importer importITLib];
    
    NSLog(@"%@", [[[MyLib getAlbums] objectAtIndex:0] title]);
    NSLog(@"%@", [MyLib getAlbums]);
    NSLog(@"%lu", (unsigned long)[[[[MyLib getAlbums] objectAtIndex:0] songs] count]);
    return NSApplicationMain(argc, argv);
}
