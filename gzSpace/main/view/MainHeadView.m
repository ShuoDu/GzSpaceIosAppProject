//
//  MainHeadView.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainHeadView.h"

@interface MainHeadView()
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;

@end
@implementation MainHeadView

+ (instancetype)ins {
    MainHeadView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.one.layer.borderWidth = 0.5;
    self.one.layer.borderColor = [UIColor whiteColor].CGColor;
    self.one.layer.masksToBounds = YES;
    self.one.layer.cornerRadius = 17;
    self.two.layer.borderWidth = 0.5;
    self.two.layer.borderColor = [UIColor whiteColor].CGColor;
    self.two.layer.masksToBounds = YES;
    self.two.layer.cornerRadius = 17;
    self.three.layer.borderWidth = 0.5;
    self.three.layer.borderColor = [UIColor whiteColor].CGColor;
    self.three.layer.masksToBounds = YES;
    self.three.layer.cornerRadius = 17;
    self.four.layer.borderWidth = 0.5;
    self.four.layer.borderColor = [UIColor whiteColor].CGColor;
    self.four.layer.masksToBounds = YES;
    self.four.layer.cornerRadius = 17;
    
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

@end
