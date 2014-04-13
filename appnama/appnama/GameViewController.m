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
    
    
    //プラスボタン
    UIImageView *plusImv = [[UIImageView alloc]init];
    plusImv.image = [UIImage imageNamed:@"plus.png"];
    plusImv.frame = CGRectMake(40, 480, 80, 80);
    plusImv.tag = 101;
    plusImv.userInteractionEnabled = YES;
    [plusImv addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
    [self.view addSubview:plusImv];

    
    //マイナスボタン
    UIImageView *minusImv = [[UIImageView alloc]init];
    minusImv.image = [UIImage imageNamed:@"minus.png"];
    minusImv.frame = CGRectMake(200, 480, 80, 80);
    minusImv.tag = 102;
    minusImv.userInteractionEnabled = YES;
    [minusImv addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
    [self.view addSubview:minusImv];
    
    userCount = 0;
    
    countLabel = [[UILabel alloc]init];
    countLabel.frame = CGRectMake(0, 20, 320, 40);
    countLabel.font = [UIFont boldSystemFontOfSize:40];//フォント指定
    countLabel.backgroundColor = [UIColor clearColor];//背景色の指定
    countLabel.textColor = [UIColor redColor];//文字色指定
    countLabel.textAlignment = NSTextAlignmentCenter;//よこそろえ
    countLabel.text = [NSString stringWithFormat:@"%dひき", userCount];//文字を指定
    [self.view addSubview:countLabel];

    
}

- (void)tapAction:(UITapGestureRecognizer*)gesture
{
    if (gesture.view.tag == 101) {
        
        //プラスをおしたとき
        if(userCount < 999){
            userCount++;
        }
        
        //userCount += 1;
        //userCount = userCount + 1;
        
        countLabel.text = [NSString stringWithFormat:@"%dひき", userCount];
        //文字を指定
        
    }else if (gesture.view.tag == 102){
        
        //マイナスを押したとき
        
        if(userCount > 0){
            userCount--;
        }
        
        countLabel.text = [NSString stringWithFormat:@"%dひき", userCount];
        //文字を指定
    }
    
}

//- (void)viewWillAppear:(BOOL)animated{
//    
//    
//    
//}

- (void)viewDidAppear:(BOOL)animated{
    
    //画面が表示されたときの処理
    
    if(flg){
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    
    
    //乱数をつくる
    random = (arc4random() % 10) + 10;//何匹ながれるか
    
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
    
    gameCount = 0;
    //ゲーム終了のタイマーを宣言
    NSTimer *mainTimer = [NSTimer
                          scheduledTimerWithTimeInterval:1.0 //一秒
                          target:self
                          selector:@selector(gameEnd:) //これよぶ
                          userInfo:nil
                          repeats:YES]; //くりかえす
    
    [mainTimer fire]; //開始
    //ここまではdidAppear
}

- (void)gameEnd:(NSTimer*)timer
{
    if (gameCount == 10) {
        //１０秒たったらここ
        ResultViewController *resultView = [[ResultViewController alloc]init];
        resultView.rightCount = random;
        resultView.userCount = userCount;
        
        flg = YES;
        [self presentViewController:resultView animated:YES completion:nil];

        
        [timer invalidate];//タイマーをとめる
        
    }
    gameCount ++;
    
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
