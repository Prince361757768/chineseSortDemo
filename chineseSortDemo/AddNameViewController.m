//
//  AddNameViewController.m
//  chineseSortDemo
//
//  Created by Y杨定甲 on 16/3/16.
//  Copyright © 2016年 damai. All rights reserved.
//

#import "AddNameViewController.h"

@interface AddNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;

@end

@implementation AddNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addName:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addNameWithStr:)]) {
        [self.delegate addNameWithStr:self.textFieldName.text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
