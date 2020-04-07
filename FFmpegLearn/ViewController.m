//
//  ViewController.m
//  FFMpegLearn
//
//  Created by gavin hu on 2020/3/29.
//  Copyright © 2020 gavin hu. All rights reserved.
//

#import "ViewController.h"
#import "DecodeClass.h"
#import "KxMovieViewController.h"
#import "DetailTableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)KxMovieViewController *vc;
@property (nonatomic,strong)NSString *h264_videoPath;
@property (nonatomic,strong)NSMutableArray *titleArrays;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDatas];
    [self initUI];
    
     self.h264_videoPath = [[NSBundle mainBundle] pathForResource:@"test_1" ofType:@"webm"];
        [DecodeClass getAllDecoderEncoder];
    //    [DecodeClass ffmpegOpenFile:h264_videoPath];
}

- (void)initUI {
    self.title = @"码率列表";
    _tableView = [UITableView new];
    _tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (void)initDatas {
    if (!self.titleArrays) {
        self.titleArrays = [NSMutableArray array];
        for (int i  =0; i<20; i++) {
            NSString *titles =  [NSString stringWithFormat:@"绝地求生-持枪奔跑_1080P_CRF20_VBVMaxRate%d",500+i*500];
            [self.titleArrays addObject:titles];
            NSLog(@"%@",titles);
        }
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.vc = [KxMovieViewController movieViewControllerWithContentPath:self.h264_videoPath parameters:nil];
//    [self presentViewController:self.vc animated:YES completion:nil];
//}

#pragma --mark tableview delegate datesource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    cell.textLabel.text = [self.titleArrays objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewController *detailVC = [DetailTableViewController new];
    detailVC.datailTitle = [self.titleArrays objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
