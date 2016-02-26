//
//  TWScrollView.m
//  TWScrollView
//
//  Created by HaKim on 16/2/26.
//  Copyright © 2016年 haKim. All rights reserved.
//

#import "TWScrollView.h"
#import "Masonry.h"

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface TWScrollView ()


@end

@implementation TWScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self commonInit];
    }
    return self;
}

- (void)setScrollViewType:(TWScrollViewType)scrollViewType{
    _scrollViewType = scrollViewType;
    WeakSelf(weakSelf);
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        if(scrollViewType == TWScrollViewType_Vertical){
            make.width.equalTo(weakSelf);
        }else{
            make.height.equalTo(weakSelf);
        }
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WeakSelf(weakSelf);
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        if(self.scrollViewType == TWScrollViewType_Vertical){
            UIView *view = [[self.contentView subviews] lastObject];
            CGFloat max_y = CGRectGetMaxY(view.frame);
            make.height.mas_equalTo(max_y);
            weakSelf.contentSize = CGSizeMake(weakSelf.frame.size.width, max_y);
        }else{
            
        }
    }];
}

#pragma mark - UI
- (void)commonInit{
    
    [self setupContentView];
    
    // 设置默认type为横向方向
    self.scrollViewType = TWScrollViewType_Vertical;
}

- (void)setupContentView{
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectZero];
    [self addSubview:contentView];
    self.contentView = contentView;
    
    contentView.backgroundColor = [UIColor clearColor];
    
    WeakSelf(weakSelf);
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
