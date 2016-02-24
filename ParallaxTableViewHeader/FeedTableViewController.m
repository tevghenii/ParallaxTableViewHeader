//
//  FeedTableViewController.m
//  ParallaxTableViewHeader
//
//  Created by Evghenii Todorov on 2/24/16.
//  Copyright © 2016 Daston~Rhadnojnainva. All rights reserved.
//

#import "FeedTableViewController.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

@end
