//
//  GameViewController.m
//  appnama
//
//  Created by kixixixixi on 2014/04/13.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //画像を描画します
    
    //背景
    UIImageView *bgImv = [[UIImageView alloc]init];
    bgImv.image = [UIImage imageNamed:@"bg.png"];
    bgImv.frame = CGRectMake(0, 0, 320, 568);
    [self.view addSubview:bgImv];
    
    //ひよこ
    hiyoImv = [[UIImageView alloc]init];
    hiyoImv.image = [UIImage imageNamed:@"hiyo.png"];
    hiyoImv.frame = CGRectMake(320, 160, 60, 60);
    [self.view addSubview:hiyoImv];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:0
                     animations:^{
                         hiyoImv.frame = CGRectMake(0, 160, 60, 60);
                     } completion:^(BOOL finished) {
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
