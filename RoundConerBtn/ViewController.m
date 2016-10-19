//
//  ViewController.m
//  RoundConerBtn
//
//  Created by liuwei on 16/10/18.
//  Copyright © 2016年 liuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#define  SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGSize radii = CGSizeMake(10, 10);
    UIRectCorner corners = UIRectCornerTopLeft|UIRectCornerTopRight;
    
    for (int i = 0; i<14; i++) {
        switch (i) {
            case 0:
                corners = UIRectCornerTopLeft;
                break;
            case 1:
                corners = UIRectCornerTopRight;
                break;
            case 2:
                corners = UIRectCornerBottomLeft;
                break;
            case 3:
                corners = UIRectCornerBottomRight;
                break;
            case 4:
                corners = UIRectCornerTopLeft|UIRectCornerTopRight;
                break;
            case 5:
                corners = UIRectCornerTopLeft|UIRectCornerBottomLeft;
                break;
            case 6:
                corners = UIRectCornerTopLeft|UIRectCornerBottomRight;
                break;
            case 7:
                corners = UIRectCornerBottomRight|UIRectCornerTopRight;
                break;
            case 8:
                 corners = UIRectCornerTopRight|UIRectCornerBottomLeft;
                break;
            case 9:
                corners = UIRectCornerBottomLeft|UIRectCornerBottomRight;
                break;
            case 10:
               corners = UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight;
                break;
            case 11:
                corners = UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft;
                break;
            case 12:
                corners = UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight;
                break;
            case 13:
                 corners = UIRectCornerAllCorners;
                break;
            
            default:
                break;
        }
    
            
            
            
             CGRect rect = CGRectMake(10+i%4*SCREEN_WIDTH/4,i/4*80+50, SCREEN_WIDTH/4-20, 35);
            UIButton * btn =[self setCustomBtnFrame:rect withRoundConers:corners withRadii:radii];
            [btn  setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
       
        
        
    }
    
}
-(UIButton *)setCustomBtnFrame:(CGRect)frame withRoundConers:(UIRectCorner)corners  withRadii:(CGSize)radii
{
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH/4-20, 35);
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.alpha = 0.8;
    btn.frame = frame;
    [self.view addSubview:btn];
    

    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer * shapLayer = [CAShapeLayer layer];
    shapLayer.lineCap = kCALineCapButt;
    shapLayer.fillColor =[UIColor yellowColor].CGColor;
    shapLayer.strokeColor = [UIColor redColor].CGColor;
    shapLayer.lineJoin = kCALineJoinRound;
    shapLayer.lineWidth = 0.5;
    shapLayer.path = path.CGPath;
    [btn.layer addSublayer:shapLayer];

    return btn;
}

-(void)btnAction:(UIButton *)btn
{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:btn.currentTitle message:@"Button has pressed！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
