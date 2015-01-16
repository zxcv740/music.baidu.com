//
//  HuoDongVC.h
//  快秀
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 快秀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuoDongVC : UIViewController<UIWebViewDelegate,UIScrollViewDelegate>{
    UIWebView               *userSPWebView;
    UIActivityIndicatorView *activityView;
}
@property (nonatomic,strong)NSString    *jumpUrlString;
@end
