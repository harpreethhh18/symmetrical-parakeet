//
//  MapDetailViewController.m
//  EarthquakeDisplayApp
//
//  Created by Harpreet on 19/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "MapDetailViewController.h"
#import <MapKit/MapKit.h>
#import "SummaryViewController.h"

@interface MapDetailViewController () {
    CLLocationCoordinate2D zoomLocation;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateMapViewBasedOnCoordinates];

}


#pragma mark - Support Methods
- (void)updateMapViewBasedOnCoordinates {
    if (self.coordinatesArray.count != 0) {
        NSDecimalNumber *longitude = [self.coordinatesArray objectAtIndex:0];
        NSDecimalNumber *latitude = [self.coordinatesArray objectAtIndex:1];
        zoomLocation.longitude = longitude.doubleValue;
        zoomLocation.latitude = latitude.doubleValue;

//        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(
                                           zoomLocation, 2000, 2000);

        [_mapView setRegion:[self.mapView regionThatFits:viewRegion] animated:YES];
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = zoomLocation;
        point.title = @"EarthQuake Location";
        
        [self.mapView addAnnotation:point];
    }
}

@end
