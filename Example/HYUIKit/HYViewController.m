//
//  HYViewController.m
//  HYUIKit
//
//  Created by yclzone on 02/16/2016.
//  Copyright (c) 2016 yclzone. All rights reserved.
//

#import "HYViewController.h"
#import "HYUIKit.h"
#import "HYTest1TableViewCell.h"

@interface HYViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerCellsWithClasses:@[[UITableViewCell class],
                                               [HYTest1TableViewCell class]]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])
                                                                forIndexPath:indexPath];
        cell.textLabel.text = @"Class";
        return cell;
    } else if (indexPath.row == 1) {
        HYTest1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HYTest1TableViewCell class])
                                                                forIndexPath:indexPath];
        cell.aSwitch.on = YES;
        return cell;
    }
    
    
    return nil;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //
}

@end
