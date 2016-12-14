//
//  ViewController.m
//  testGradientView
//
//  Created by wealon on 16/12/9.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Gradient.h"
#import "UIColor+Ext.h"
#import "Masonry.h"
#import "DemoView.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *tmpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor blueColor];
    
    NSArray *nib = nil;
    nib = [[NSBundle mainBundle] loadNibNamed:@"DemoView"
                                        owner:nil
                                      options:nil];
    DemoView *demoView =  [nib lastObject];
    
    [self.view addSubview:demoView];

    [demoView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    [self.view layoutIfNeeded];
    
//    [tmpView setGradientColorFromColor:fromColor ToColor:toColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



