//
//  EventsViewController.m
//  testApp
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "EventsViewController.h"
#import "LinesViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController {
    NSMutableArray* vcItems;
    NSString* vcTitle;
    NSString* vcName;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    vcTitle = @"VC_TITLE";
    vcName = @"VC_NAME";
    self.navigationItem.title = @"Event handling";
    vcItems = [NSMutableArray new];
    
    LinesViewController* lineVC = [[LinesViewController alloc]init];
    [vcItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Line Handling", vcTitle, lineVC, vcName, nil]];
    
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
