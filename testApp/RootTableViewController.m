//
//  RootTableViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "RootTableViewController.h"
#import "ButtonsViewController.h"

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
