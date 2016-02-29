//
//  RootTableViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "RootTableViewController.h"
#import "ButtonsViewController.h"
#import "FileManagerViewController.h"
#import "CoreTextViewController.h"
#import "UITextViewController.h"
#import "UIFontViewController.h"
#import "CoreGraphicsViewController.h"

@implementation RootTableViewController {
    NSMutableArray* vcItems;
    NSString* vcTitle;
    NSString* vcName;
    
}
-(id) init {
    self = [super init];
    [self setTitle:@"Test App"];
    
    vcTitle = @"VC_TITLE";
    vcName = @"VC_NAME";
    
    vcItems = [[NSMutableArray alloc]init];
    ButtonsViewController* viewController = [[ButtonsViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ButtonsViewController", vcTitle, viewController, vcName, nil]];
    
    FileManagerViewController* fileVC = [[FileManagerViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"File Handling", vcTitle, fileVC, vcName, nil]];
    
    UITextViewController* tvVC = [[UITextViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"UITextView", vcTitle, tvVC, vcName, nil]];
    
    CoreTextViewController* ctVC = [[CoreTextViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"CoreText", vcTitle, ctVC, vcName, nil]];
    
    UIFontViewController* uifontVC = [[UIFontViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"UIFont", vcTitle, uifontVC, vcName, nil]];
    
    CoreGraphicsViewController* cgVC = [[CoreGraphicsViewController alloc] init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Core Graphics", vcTitle, cgVC, vcName, nil]];
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return vcItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    }
    
    NSString* title = [[vcItems objectAtIndex:indexPath.row] objectForKey:vcTitle];
    cell.textLabel.text = title;
    return cell;
}


- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    UIViewController* viewController = [[vcItems objectAtIndex:indexPath.row] objectForKey:vcName];
    [[self navigationController] pushViewController:viewController animated:YES];
}

@end
