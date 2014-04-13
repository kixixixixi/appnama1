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
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    //画面が表示されたときの処理
    
    
    //乱数をつくる
    int random = (arc4random() % 10) + 10;//何匹ながれるか
    
    //乱数の数だけひよこをつくって移動される
    for(int i = 0; i < random; i++){
        
        //はじめのひよこの位置
        int randomX = (arc4random() % 10);//0-9
        int randomY = (arc4random() % 10);//0-9
        
        //ひよこを描画
        UIImageView *hiyoImv = [[UIImageView alloc]init];
        hiyoImv.image = [UIImage imageNamed:@"hiyo.png"];
        //開始位置
        hiyoImv.frame = CGRectMake(320 + randomX*20 /* 320~520 */,
                                   20 + randomY*40 /* 20~420 */,
                                   60,
                                   60);
        
        [self.view addSubview:hiyoImv];
        
        //アニメーション
        [UIView animateWithDuration:3.0
                              delay:i/10.0
                            options:0
                         animations:^{
                             hiyoImv.frame = CGRectMake(-200,
                                                        20 + randomY*40/* 20~420 */,
                                                        60,
                                                        60);
                         } completion:^(BOOL finished) {
                         }];
    }
    
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
