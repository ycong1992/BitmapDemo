//
//  ViewController.m
//  BitmapDemo
//
//  Created by SZOeasy on 2020/3/11.
//  Copyright © 2020 ycong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}

- (void)initUI {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"test"];
    [self.view addSubview:self.imageView];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.addButton.frame = CGRectMake(50, 500, 100, 44);
    [self.addButton setTitle:@"click" forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
}

- (void)click:(UIButton*)btn {
    UIImage *image = [UIImage imageNamed:@"test"];
    NSLog(@"%@",NSStringFromCGSize(image.size));
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointMake(0, 0)];
    
    NSString *str = @"字符串水印测试";
    NSDictionary *attributed = @{NSFontAttributeName: [UIFont systemFontOfSize:50.0f], NSForegroundColorAttributeName: [UIColor redColor]};
    [str drawAtPoint:CGPointMake(150, 50) withAttributes:attributed];

    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();

    self.imageView.image = newImage;
}

@end
