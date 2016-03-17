//
//  AddNameViewController.h
//  chineseSortDemo
//
//  Created by Y杨定甲 on 16/3/16.
//  Copyright © 2016年 damai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddNameViewController;
@protocol addNameToVC <NSObject>

- (void)addNameWithStr:(NSString *)str;

@end
@interface AddNameViewController : UIViewController

@property (weak, nonatomic)id<addNameToVC>delegate;
@end
