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

#import <Cocoa/Cocoa.h>
#import "QMImporter.h"
#import "QMLibrary.h"
#import "QMAlbum.h"
#import <iTunesLibrary/ITLibrary.h>

int main(int argc, const char * argv[]) {
    QMLibrary *MyLib = [QMImporter importITLib];
    
    NSLog(@"%@", [[[MyLib getAlbums] objectAtIndex:0] title]);
    NSLog(@"%@", [MyLib getAlbums]);
    NSLog(@"%lu", (unsigned long)[[[[MyLib getAlbums] objectAtIndex:0] songs] count]);
    NSLog(@"%lu", (unsigned long)[MyLib valueForKeyPath:@"albums.@count"]);
    NSLog(@"%@", [[[[MyLib getAlbums] objectAtIndex:0] getSongByID:0] title]);
    
    NSLog(@"BEFORE SORT");
    for (int x = 0; x < [[[[MyLib getAlbums] objectAtIndex:0] songs] count]; x++) {
        NSLog(@"%@", [[[[[MyLib getAlbums] objectAtIndex:0] songs] objectAtIndex:x] title]);
    }
    
    [[[MyLib getAlbums] objectAtIndex:0] sortBySongLength];
    NSLog(@"AFTER SORT");
    for (int x = 0; x < [[[[MyLib getAlbums] objectAtIndex:0] songs] count]; x++) {
        NSLog(@"%@", [[[[[MyLib getAlbums] objectAtIndex:0] songs] objectAtIndex:x] title]);
    }
    
    for (int x = 0; x < 1000; x++) {
        for (int x = 0; x < [[MyLib albums] count]; x++) {
            [[[[MyLib getAlbums] objectAtIndex:x] songs] removeAllObjects];
        }
        [[MyLib albums] removeAllObjects];
        MyLib = nil;
        MyLib = [QMImporter importITLib];
    }
    
    for (int x = 0; x < 1000; x++) {
        for (int x = 0; x < [[MyLib albums] count]; x++) {
            [[[[MyLib getAlbums] objectAtIndex:x] songs] removeAllObjects];
        }
        [[MyLib albums] removeAllObjects];
        MyLib = nil;
        MyLib = [QMImporter importITLib];
    }
    
    return NSApplicationMain(argc, argv);
}
