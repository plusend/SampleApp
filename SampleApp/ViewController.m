//
//  ViewController.m
//  SampleApp
//
//  Created by plusend on 2019/5/12.
//  Copyright © 2019 plusend. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "DeleteCellView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSMutableArray *dataArray;
@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;

    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *controller = [[DetailViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCell];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton
{
    DeleteCellView *deleteView = [[DeleteCellView alloc] initWithFrame:self.view.bounds];

    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];

    __weak typeof(self)wself = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
