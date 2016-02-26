//
//  ViewController.m
//  TWScrollView
//
//  Created by HaKim on 16/2/26.
//  Copyright © 2016年 haKim. All rights reserved.
//

#import "ViewController.h"

#import "TWScrollView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, weak) TWScrollView *scrollView;
@property (nonatomic, weak) UIView *view1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self test];
    
    TWScrollView *scrollView = [[TWScrollView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    scrollView.backgroundColor = [UIColor orangeColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectZero];
    view1.backgroundColor = [UIColor lightGrayColor];
    [scrollView.contentView addSubview:view1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.contentView);
        make.left.equalTo(scrollView.contentView);
        make.right.equalTo(scrollView.contentView);
        make.height.mas_equalTo(@500);
    }];
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectZero];
    view2.backgroundColor = [UIColor blueColor];
    [scrollView.contentView addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom);
        make.left.equalTo(scrollView.contentView);
        make.right.equalTo(scrollView.contentView);
        make.height.mas_equalTo(@500);
    }];
}
- (IBAction)itemBtnClicked:(UIBarButtonItem *)sender {
    NSLog(@"%@",NSStringFromCGSize(self.scrollView.contentSize));
//    [self.scrollView.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@1000);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //NSLog(@"%@",NSStringFromCGSize(self.scrollView.contentSize));
    [UIView animateWithDuration:1.0 animations:^{
        [self.view1 mas_updateConstraints:^(MASConstraintMaker *make) {
            static BOOL flag = YES;
            if(flag){
                 make.width.equalTo(@300);
                flag = NO;
            }else{
                make.width.equalTo(@100);
                flag = YES;
            }
           
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)test{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:view1];
    self.view1 = view1;
    
    view1.backgroundColor = [UIColor orangeColor];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
        make.center.equalTo(self.view);
    }];
}

@end
