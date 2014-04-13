//
//  GameViewController.h
//  appnama
//
//  Created by kixixixixi on 2014/04/13.
//  Copyright (c) 2014年 kixixixixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultViewController.h"

@interface GameViewController : UIViewController

{
    //UIImageView *hiyoImv;
    
    int userCount;
    UILabel *countLabel;
    
    int gameCount;
    
    int random;
    
    BOOL flg;
}

@end
