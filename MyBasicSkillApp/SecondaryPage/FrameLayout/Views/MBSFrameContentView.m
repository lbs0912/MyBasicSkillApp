//
//  MBSFrameContentView.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSFrameContentView.h"


@interface  MBSFrameContentView ()

@property (nonatomic, strong) UIView *subView1;
@property (nonatomic, strong) UIView *subView2;
@property (nonatomic, strong) UIView *subView3;
@property (nonatomic, strong) UIView *subView4;

@end

@implementation MBSFrameContentView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
    
        _subView1 = [[UIView alloc] initWithFrame:CGRectZero];
        _subView1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.6];
        [self addSubview:_subView1];
        
        _subView2 = [[UIView alloc] initWithFrame:CGRectZero];
        _subView2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.6];
        [self addSubview:_subView2];
        
        _subView3 = [[UIView alloc] initWithFrame:CGRectZero];
        _subView3.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:.6];
        [self addSubview:_subView3];
        
        _subView4 = [[UIView alloc] initWithFrame:CGRectZero];
        _subView4.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.6];
        [self addSubview:_subView4];
    }
    
    return self;
}


- (void)layoutSubviews {
    
    NSLog(@"MBSFrameContentView-----%s", __FUNCTION__);
    
    [super layoutSubviews];
    
    CGFloat margin = 20.0;
    CGFloat padding = 20.0;
    CGFloat width = (self.bounds.size.width - margin * 2 - padding) / 2;
    CGFloat height = (self.bounds.size.height - margin * 2 - padding) / 2;
    
    _subView1.frame = CGRectMake(margin, margin, width, height);
    _subView2.frame = CGRectMake(margin + width + padding, margin, width, height);
    _subView3.frame = CGRectMake(margin, margin + height + padding, width, height);
    _subView4.frame = CGRectMake(margin + width + padding, margin + height + padding, width, height);

}

@end
