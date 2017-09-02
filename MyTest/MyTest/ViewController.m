//
//  ViewController.m
//  MyTest
//
//  Created by 伯驹网络 on 2017/9/2.
//  Copyright © 2017年 Nicholas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL _isOpen;
    NSMutableArray * _btnArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

-(void)initUI
{
    _btnArray = [[NSMutableArray alloc]init];
    for (int i=0; i<4; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.frame = CGRectMake(260, 420, 40, 40);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"c_setting%d",(i+1)%4]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btnArray addObject:btn];
        
    }
}

-(void)btnClick:(UIButton *)btn
{
    //如果没有打开
    if (!_isOpen)
    {
        //打开九宫格
        for (int i = 0; i < _btnArray.count; i++)
        {
            UIButton * myBtn = [_btnArray objectAtIndex:i];
            [UIView animateWithDuration:0.3
                             animations:^{
                                 myBtn.frame = CGRectMake(190+(i%2)*70, 350+70*(i/2), 40, 40);
                             }
                             completion:^(BOOL finished) {
                                 [UIView animateWithDuration:0.3
                                                  animations:^{
                                                      myBtn.frame = CGRectMake(200+(i%2)*60, 360+(i/2)*60, 40, 40);
                                                  }];
                             }];
        }
        
    }
    else
    {
        //关闭九宫格
        for (int i = 0; i < _btnArray.count; i++)
        {
            UIButton * myBtn = [_btnArray objectAtIndex:i];
            [UIView animateWithDuration:0.3
                             animations:^{
                                 myBtn.frame = CGRectMake(190+(i%2)*70, 350+70*(i/2), 40, 40);
                             }
                             completion:^(BOOL finished) {
                                 [UIView animateWithDuration:0.3
                                                  animations:^{
                                                      myBtn.frame = CGRectMake(260, 420, 40, 40);
                                                      
                                                  }];
                             }];
        }
        
        
    }
    _isOpen = !_isOpen;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
