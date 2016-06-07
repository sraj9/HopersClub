//
//  SplashScreen.m
//  HopersClub
//
//  Created by Raj iOS on 07/06/16.
//  Copyright © 2016 Parshwa iOS. All rights reserved.
//

#import "SplashScreen.h"

@interface SplashScreen ()
{
    
}
@end

@implementation SplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
     NSMutableArray *imageArray=[[NSMutableArray alloc]init];
    for(NSInteger i=1;i<=21;i++){
        NSString *strImage = [NSString stringWithFormat:@"Image-%ld",(long)i];
        UIImage *image = [UIImage imageNamed:strImage];
       
        [imageArray addObject:image];
        
    }


    _splshImage.animationImages = imageArray;
    _splshImage.animationDuration = 5;
    _splshImage.animationRepeatCount=0;
        [_splshImage startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(hideLabel) userInfo:nil repeats:NO];


    // Do any additional setup after loading the view.
}

- (void) hideLabel
{
    [self.splshImage stopAnimating];
    self.splshImage.image=[UIImage imageNamed:@"Image-21"];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hidelable2) userInfo:nil repeats:NO];
    //This assumes that your label is a property of your view controller
}
-(void)hidelable2{
    UIViewController *Home=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:Home animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
