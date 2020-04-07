//
//  DetailTableViewController.m
//  FFmpegLearn
//
//  Created by gavin hu on 2020/4/4.
//  Copyright © 2020 gavin hu. All rights reserved.
//

#import "DetailTableViewController.h"
#import "KxMovieViewController.h"

@interface DetailTableViewController ()
@property (nonatomic,strong) NSArray *postfix;
@property (nonatomic,strong) KxMovieViewController *playerVC;
@end

@implementation DetailTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfix = @[@"mp4",@"hevc",@"webm"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%@",self.datailTitle,[self.postfix objectAtIndex:indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * videoPath = [[NSBundle mainBundle] pathForResource:self.datailTitle ofType:[self.postfix objectAtIndex:indexPath.row]];
    if (videoPath) {
        self.playerVC = [KxMovieViewController movieViewControllerWithContentPath:videoPath parameters:nil];
        [self presentViewController:self.playerVC animated:YES completion:nil];
       // [self.navigationController pushViewController:self.playerVC animated:YES];
    }
    
}



@end
