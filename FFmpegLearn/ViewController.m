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
@interface ViewController ()
@property (nonatomic,strong)KxMovieViewController *vc;
@property (nonatomic,strong)NSString *h264_videoPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.h264_videoPath = [[NSBundle mainBundle] pathForResource:@"test_1" ofType:@"webm"];
    //    [DecodeClass getAllDecoderEncoder];
    //    [DecodeClass ffmpegOpenFile:h264_videoPath];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.vc = [KxMovieViewController movieViewControllerWithContentPath:self.h264_videoPath parameters:nil];
    [self presentViewController:self.vc animated:YES completion:nil];
}


@end
