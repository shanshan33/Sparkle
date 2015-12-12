//
//  ViewController.m
//  Sparkle
//
//  Created by Shanshan ZHAO on 12/12/15.
//  Copyright © 2015 Shanshan ZHAO. All rights reserved.
//

#import "ViewController.h"
#import <Mapbox/Mapbox.h>


@interface ViewController ()

@property (nonatomic, strong) MGLMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // initialize the map view
  self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
  self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  // set the map's center coordinate
  [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(38.894368, -77.036487)
                          zoomLevel:15
                           animated:NO];
  [self.view addSubview:self.mapView];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
