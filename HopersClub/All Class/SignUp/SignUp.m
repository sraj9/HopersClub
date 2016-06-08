//
//  SignUp.m
//  HopersClub
//
//  Created by Raj iOS on 07/06/16.
//  Copyright © 2016 Parshwa iOS. All rights reserved.
//

#import "SignUp.h"
#import "CKCalendarView.h"



#define TextPlaceholder( fieldText ,placeholderText)\
{\
UIColor *color=[UIColor colorWithRed:35.0/255.0 green:153.0/255 blue:218.0/255.0 alpha:0.5];\
fieldText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{NSForegroundColorAttributeName: color}];\
}




@interface SignUp (){
    NSString *selectedDate;

}
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDateFormatter *dateFormatterREGULAR;

@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSArray *disabledDates;

@end

@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    [_datePicker setValue:[UIColor colorWithRed:35.0/255.0 green:153.0/255 blue:218.0/255.0 alpha:1.0] forKey:@"textColor"];

    TextPlaceholder(_firstNameField, @"First Name");
    
    if (self) {
        CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
        self.calendar = calendar;
        calendar.delegate = self;
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"yyyy-MM-dd"];
        self.dateFormatterREGULAR =[[NSDateFormatter alloc]init];
        [self.dateFormatterREGULAR setDateFormat:@"dd MMMM yyyy"];
        self.minimumDate = [self.dateFormatter dateFromString:@"1900-05-21"];
        
        //        self.disabledDates = @[
        //                               [self.dateFormatter dateFromString:@"05/01/2013"],
        //                               [self.dateFormatter dateFromString:@"06/01/2013"],
        //                               [self.dateFormatter dateFromString:@"07/01/2013"]
        //                               ];
        
        calendar.onlyShowCurrentMonth = NO;
        calendar.adaptHeightToNumberOfWeeksInMonth = YES;
        
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone ){
            calendar.frame = CGRectMake(-5, 60, (self.view.frame.size.width)+10, 200);
        }else{
            calendar.frame = CGRectMake(-5, 70, (self.view.frame.size.width)+10, 0);
        }
        
        
        [self.view addSubview:calendar];
        calendar.hidden=YES;
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
        [self.view addSubview:self.dateLabel];
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    }
    
    // Do any additional setup after loading the view.
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

- (BOOL)dateIsDisabled:(NSDate *)date {
    for (NSDate *disabledDate in self.disabledDates) {
        if ([disabledDate isEqualToDate:date]) {
            return YES;
        }
    }
    return NO;
}
#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date {
    // TODO: play with the coloring if we want to...
    if ([self dateIsDisabled:date]) {
        dateItem.backgroundColor = [UIColor redColor];
        dateItem.textColor = [UIColor whiteColor];
    }
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date {
    return ![self dateIsDisabled:date];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    //    self.dateLabel.text = [self.dateFormatter stringFromDate:date];
    selectedDate=[self.dateFormatter stringFromDate:date];
    [[NSUserDefaults standardUserDefaults] setObject:selectedDate forKey:@"dateDas"];
    NSLog(@"Selected is %@",selectedDate);
    NSString *dash;
    dash=[self.dateFormatterREGULAR stringFromDate:date];
    [[NSUserDefaults standardUserDefaults]setObject:dash forKey:@"date"];
    
}

- (BOOL)calendar:(CKCalendarView *)calendar willChangeToMonth:(NSDate *)date {
    if ([date laterDate:self.minimumDate] == date) {
        self.calendar.backgroundColor = [UIColor colorWithRed:101.0/255.0 green:93.0/255.0 blue:87.0/255.0 alpha:1.0];
        return YES;
    } else {
        self.calendar.backgroundColor = [UIColor redColor];
        return NO;
    }
}

- (void)calendar:(CKCalendarView *)calendar didLayoutInRect:(CGRect)frame {
    NSLog(@"calendar layout: %@", NSStringFromCGRect(frame));
}


@end
