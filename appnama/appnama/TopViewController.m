//
//  TopViewController.m
//  appnama
//
//  Created by kixixixixi on 2014/04/13.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

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
    UIImageView *hiyoImv = [[UIImageView alloc]init];
    hiyoImv.image = [UIImage imageNamed:@"hiyo.png"];
    hiyoImv.frame = CGRectMake(60, 160, 200, 200);
    [self.view addSubview:hiyoImv];
    
    //タイトル
    UIImageView *titleImv = [[UIImageView alloc]init];
    titleImv.image = [UIImage imageNamed:@"titlt.png"];
    titleImv.frame = CGRectMake(0, 80, 320, 45);
    [self.view addSubview:titleImv];
    
    //すたーとぼたん
    UIImageView *btnImv = [[UIImageView alloc]init];
    btnImv.image = [UIImage imageNamed:@"btn.png"];
    btnImv.frame = CGRectMake(0, 420, 320, 80);
    btnImv.tag = 101;
    btnImv.userInteractionEnabled = YES;
    [btnImv addGestureRecognizer:
     [[UITapGestureRecognizer alloc]initWithTarget:self
                                            action:@selector(tapAction:)]];
    [self.view addSubview:btnImv];
}

- (void)tapAction:(UITapGestureRecognizer*)gesture
{
    //画像がおされたときの処理
    if(gesture.view.tag == 101){
        //スタートボタンが押されたときの処理
        GameViewController *gameView = [[GameViewController alloc]init];
        [self presentViewController:gameView animated:YES completion:nil];
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
