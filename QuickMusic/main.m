//
//  main.m
//  QuickMusic
//
//  Created by Oskar Mendel on 1/25/16.
//  Copyright © 2016 Oskar Mendel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Importer.h"
#import <iTunesLibrary/ITLibrary.h>

int main(int argc, const char * argv[]) {
    [Importer importLib];
    
    return NSApplicationMain(argc, argv);
}
