//
//  ViewController.m
//  EarthquakeDisplayApp
//
//  Created by Harpreet on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "ViewController.h"
#import "GeoAPIServerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[GeoAPIServerManager sharedManager] getEarthquakeSummaryInfoFromGeoServerWithSuccessHandler:^(NSArray * _Nonnull earthquakeSummary) {
        
    } failureHandler:^(NSString * _Nonnull failureInfo) {
        
    }];
}



@end
