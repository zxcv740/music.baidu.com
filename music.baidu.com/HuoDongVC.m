//
//  HuoDongVC.m
//  快秀
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 快秀. All rights reserved.
//

#import "HuoDongVC.h"

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
@interface HuoDongVC ()

@end

@implementation HuoDongVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

       if([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0){
        self.navigationController.navigationBar.frame = CGRectMake(0.0, 20.0, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height);
    }
}

- (void)viewDidLoad
{
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //[leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"自动预览_返回_默认"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"自动预览_返回_点击"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setFrame:CGRectMake(0, 0, 44, 44)];
    UIBarButtonItem *leftButton= [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];;
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion >= 7.0)
    {
        spaceItem.width=-9;
    }else{
        spaceItem.width=0;
    }
    self.navigationItem.leftBarButtonItems = @[spaceItem,leftButton];//[[UIBarButtonItem
    [self.navigationController.navigationBar setTranslucent:NO];
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame=CGRectMake(0, 0, 37, 37);
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:activityView];
    
    userSPWebView =[[UIWebView alloc]init];
    userSPWebView.delegate=self;
    
    NSString *ua =@"Mozilla/5.0 (SymbianOS/9.4; U; Series60/5.0 Nokia5800d-1/21.0.025; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/413 (KHTML, like Gecko) Safari/413";
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:ua, @"UserAgent", nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    
    userSPWebView.frame=CGRectMake(0, 0, 320,[[UIScreen mainScreen] applicationFrame].size.height-44);
    [userSPWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://music.baidu.com"]]];//urlString
    [userSPWebView setScalesPageToFit:YES];
    [self.view addSubview:userSPWebView];
    userSPWebView.scrollView.delegate=self;
    [super viewDidLoad];
}

-(void)cancel{
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
