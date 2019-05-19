//
//  SummaryViewController.m
//  EarthquakeDisplayApp
//
//  Created by Harpreet on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "SummaryViewController.h"
#import "GeoAPIServerManager.h"
#import "EarthquakeInfoTableViewCell.h"
#import "EarthquakeSummaryModel.h"

#define kCellHeight 60

@interface SummaryViewController () <UITableViewDataSource, UITableViewDelegate> {
    EarthquakeSummaryModel *summaryModel;
}

@property (strong, nonatomic) IBOutlet UITableView *earthquakeInfoTableView;
@property (strong, nonatomic) NSArray *earthquakeSummaryArray;
@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.earthquakeInfoTableView.delegate = self;
    self.earthquakeInfoTableView.dataSource  = self;
    self.earthquakeInfoTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.earthquakeInfoTableView.bounces = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [[GeoAPIServerManager sharedManager] getEarthquakeSummaryInfoFromGeoServerWithSuccessHandler:^(NSArray * _Nonnull earthquakeSummary) {
        self.earthquakeSummaryArray = earthquakeSummary;
        [self.earthquakeInfoTableView reloadData];
    } failureHandler:^(NSString * _Nonnull failureInfo) {
        [self displayAlertWithMessage:failureInfo];
    }];
}

#pragma mark Helper Methods
- (void)displayAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark UITableView Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.earthquakeSummaryArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    EarthquakeInfoTableViewCell *infoCell = [self.earthquakeInfoTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (infoCell == nil) {
        infoCell = [[EarthquakeInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSError *error;
    summaryModel = [[EarthquakeSummaryModel alloc] initWithDictionary:[self.earthquakeSummaryArray objectAtIndex:indexPath.row] error:&error];
    
    return infoCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"EarthquakeDetailMap" sender:nil];
    
}

@end
