//
//  FileManagerViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "FileManagerViewController.h"

@implementation FileManagerViewController

-(void)viewDidLoad {
    self.title = @"NSFileManager";
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self writeToTextFile];
    
}
-(void)writeToTextFile{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/filename.txt",
                          documentsDirectory];
    NSDate* date = [NSDate date];
    NSString* oldContent = [self getFileContent];
    NSString *content = [oldContent stringByAppendingString:[@"\nLast update time is " stringByAppendingString:[date description]]];
    BOOL success = [content writeToFile:fileName
              atomically:NO
                encoding:NSStringEncodingConversionAllowLossy
                   error:nil];
    NSLog(@"success = %d", success);
    [self getFileContent];
}

-(NSString*)getFileContent{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/filename.txt",
                          documentsDirectory];
    NSString *content = [[NSString alloc] initWithContentsOfFile:fileName
                                                    usedEncoding:nil
                                                           error:nil];
    NSLog(@"%@", content);
    return content;
}


@end
