//
//  ViewController.m
//  ZBJCalendar
//
//  Created by 王刚 on 15/12/8.
//  Copyright © 2015年 ZBJ. All rights reserved.
//

#import "ViewController.h"
#import "ZBJCalendarRangeViewController.h"
#import "ZBJCalendarShowViewController.h"
#import "ZBJCalendarAdvanceViewController.h"

static NSString * const ZBJCellIdentifier = @"cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *tableData;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZBJCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.tableData[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            ZBJCalendarShowViewController *calendarViewController = [ZBJCalendarShowViewController new];
            calendarViewController.title = self.tableData[indexPath.row];
            [self.navigationController pushViewController:calendarViewController animated:YES];
            break;
        }
        case 1: {
            ZBJCalendarRangeViewController *calendarViewController = [ZBJCalendarRangeViewController new];
            calendarViewController.title = self.tableData[indexPath.row];
            [self.navigationController pushViewController:calendarViewController animated:YES];
            break;
        }
        case 2: {
            ZBJCalendarAdvanceViewController *calendarViewController = [ZBJCalendarAdvanceViewController new];
            calendarViewController.title = self.tableData[indexPath.row];
            [self.navigationController pushViewController:calendarViewController animated:YES];
            break;
        }
        default:
            break;
    }
    
    
 
}

#pragma mark - getter
- (NSArray *)tableData {
    if (!_tableData) {
        _tableData = @[@"ShowOnly", @"RangeSelection", @"Advance"];
    }
    return _tableData;
}

@end
