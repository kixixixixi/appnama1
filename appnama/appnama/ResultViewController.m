//
//  ResultViewController.m
//  appnama
//
//  Created by kixixixixi on 2014/04/13.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

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
    
    //背景
    UIImageView *bgImv = [[UIImageView alloc]init];
    bgImv.image = [UIImage imageNamed:@"bg.png"];
    bgImv.frame = CGRectMake(0, 0, 320, 568);
    [self.view addSubview:bgImv];
    
    UILabel *userCountLabel = [[UILabel alloc]init];
    userCountLabel.frame = CGRectMake(0, 40, 320, 40);
    userCountLabel.font = [UIFont boldSystemFontOfSize:20];//フォント指定
    userCountLabel.backgroundColor = [UIColor clearColor];//背景色の指定
    userCountLabel.textColor = [UIColor whiteColor];//文字色指定
    userCountLabel.textAlignment = NSTextAlignmentRight;//よこそろえ
    userCountLabel.text = [NSString stringWithFormat:@"あなたは%dひきをかぞえました。", self.userCount];//文字を指定
    [self.view addSubview:userCountLabel];
    
    UILabel *rightCountLabel = [[UILabel alloc]init];
    rightCountLabel.frame = CGRectMake(0, 100, 320, 40);
    rightCountLabel.font = [UIFont boldSystemFontOfSize:20];//フォント指定
    rightCountLabel.backgroundColor = [UIColor clearColor];//背景色の指定
    rightCountLabel.textColor = [UIColor grayColor];//文字色指定
    rightCountLabel.textAlignment = NSTextAlignmentRight;//よこそろえ
    rightCountLabel.text = [NSString stringWithFormat:@"ほんとうは%dひきでした。", self.rightCount];//文字を指定
    [self.view addSubview:rightCountLabel];
    
    UILabel *resultLabel = [[UILabel alloc]init];
    resultLabel.frame = CGRectMake(0, 200, 320, 60);
    resultLabel.font = [UIFont boldSystemFontOfSize:60];//フォント指定
    resultLabel.backgroundColor = [UIColor clearColor];//背景色の指定
    resultLabel.textColor = [UIColor blueColor];//文字色指定
    resultLabel.textAlignment = NSTextAlignmentCenter;//よこそろえ
    
    [self.view addSubview:resultLabel];
    
    if(self.userCount == self.rightCount){
        resultLabel.text = @"正解";//文字を指定
    }else{
        resultLabel.text = @"不正解";//文字を指定
    }
    
    //ばっくぼたん
    UIImageView *btnImv = [[UIImageView alloc]init];
    btnImv.image = [UIImage imageNamed:@"back.png"];
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
        //バックボタンが押されたときの処理
        [self dismissViewControllerAnimated:YES completion:nil];//とじる
        
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
