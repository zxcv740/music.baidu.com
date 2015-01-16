//
//  ViewController.m
//  music.baidu.com
//
//  Created by Austin on 15-1-9.
//  Copyright (c) 2015年 music.baidu.com. All rights reserved.
//

#import "ViewController.h"
#import "HuoDongVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touch:(id)sender {
    HuoDongVC *vc=[[HuoDongVC alloc]initWithNibName:@"HuoDongVC" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
