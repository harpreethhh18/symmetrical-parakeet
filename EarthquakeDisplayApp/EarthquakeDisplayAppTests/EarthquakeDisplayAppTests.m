//
//  EarthquakeDisplayAppTests.m
//  EarthquakeDisplayAppTests
//
//  Created by Harpreet on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GeoAPIBaseResponseModel.h"

@interface GeoAPIBaseResponseTestModel : NSObject

@property (strong, nonatomic) NSArray *features;
+ (GeoAPIBaseResponseTestModel *)generateModelWithFeaturesArray:(NSArray *)FeaturesArray;

@end

@implementation GeoAPIBaseResponseTestModel

+ (GeoAPIBaseResponseTestModel *)generateModelWithFeaturesArray:(NSArray *)FeaturesArray {
    GeoAPIBaseResponseTestModel *testModel = [GeoAPIBaseResponseTestModel new];
    testModel.features = FeaturesArray;
    return testModel;
}

@end


@interface EarthquakeDisplayAppTests : XCTestCase
@end

@implementation EarthquakeDisplayAppTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGeoAPIModel {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    GeoAPIBaseResponseTestModel *modelOne = [GeoAPIBaseResponseTestModel generateModelWithFeaturesArray:[NSArray arrayWithObject:@"Testing"]];
    GeoAPIBaseResponseTestModel *modelTwo = [GeoAPIBaseResponseTestModel generateModelWithFeaturesArray:nil];
    
    // scope for further optimization
    GeoAPIBaseResponseModel *originalViewModel = [GeoAPIBaseResponseModel new];
    originalViewModel.features = modelOne.features;
    if (!originalViewModel.isSuccess) {
        [self recordFailureWithDescription:@"\n____Logic is wrong: \n____Description"
                                    inFile:nil
                                    atLine:__LINE__
                                  expected:YES];
    }
    
    originalViewModel = [GeoAPIBaseResponseModel new];
    originalViewModel.features = modelTwo.features;
    if (originalViewModel.isSuccess) {
        [self recordFailureWithDescription:@"\n____Logic is wrong: \n____Description"
                                    inFile:nil
                                    atLine:__LINE__
                                  expected:YES];
    }
    
                                             
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
@end
