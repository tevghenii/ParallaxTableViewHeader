//
//  ViewController.m
//  ParallaxTableViewHeader
//
//  Created by Vinodh  on 26/10/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "StoryViewController.h"
#import "ParallaxHeaderView.h"
#import "StoryCommentCell.h"

@interface StoryViewController ()
@property (nonatomic) UIView *tabsView;
@property (nonatomic) NSDictionary *story;
@end

@implementation StoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create ParallaxHeaderView with specified size, and set it as uitableView Header, that's it
    ParallaxHeaderView *headerView = [ParallaxHeaderView parallaxHeaderViewWithImage:[UIImage imageNamed:@"HeaderImage"] forSize:CGSizeMake(self.tableView.frame.size.width, 300)];
    headerView.headerTitleLabel.text = self.story[@"story"];
    
    [self.tableView setTableHeaderView:headerView];
    
    self.tabsView = [self createTabsView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [(ParallaxHeaderView *)self.tableView.tableHeaderView refreshBlurViewForNewImage];
    [super viewDidAppear:animated];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -
#pragma mark Helpers

- (UIView *)createTabsView {
    UIView *tabsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 45)];
    tabsView.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *tabsSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[ @"Feed", @"Photos", @"Video" ]];
    tabsSegmentedControl.center = CGPointMake(CGRectGetMidX(tabsView.bounds), CGRectGetMidY(tabsView.bounds));
    [tabsView addSubview:tabsSegmentedControl];
    
    return tabsView;
}

#pragma mark -
#pragma mark UITableViewDatasource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _tabsView;
}

#pragma mark -
#pragma mark UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView)
    {
        // pass the current offset of the UITableView so that the ParallaxHeaderView layouts the subViews.
        [(ParallaxHeaderView *)self.tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
    }
}

@end
