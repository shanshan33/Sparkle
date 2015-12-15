//
//  ViewController.m
//  Sparkle
//
//  Created by Shanshan ZHAO on 12/12/15.
//  Copyright © 2015 Shanshan ZHAO. All rights reserved.
//

#import "ViewController.h"
#import <Mapbox/Mapbox.h>


@interface ViewController () <MGLMapViewDelegate>

@property (nonatomic, strong) MGLMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *transparentView;

@property (weak, nonatomic) IBOutlet UIButton *zone18;

@property (weak, nonatomic) IBOutlet UIView *menuPaneView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *transparentViewRightMargin;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configureMapView];
  
  self.transparentView.backgroundColor = [UIColor clearColor];
  self.transparentView.opaque = NO;
  self.menuPaneView.hidden = YES;
}


- (IBAction)CloseButtonClicked:(id)sender
{
  [self.transparentView removeFromSuperview];
}


- (IBAction)openRightPaneWithZoneInfo:(id)sender
{
  
  [UIView animateWithDuration:1
                        delay:0.5
                      options: UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     self.menuPaneView.hidden = NO;
                     self.transparentViewRightMargin.constant = 270;

                   }
                   completion:^(BOOL finished){
                     NSLog(@"Done!");
                   }];
  
  
}

#pragma mark - map

- (void)configureMapView
{
  // TODO: custom map style could be done by :
  //  NSURL *styleURL = [NSURL URLWithString:@"mapbox://styles/userName/styleHash"];
  //  MGLMapView *mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds
  //                                                 styleURL:styleURL];
  
  
  self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds
                                          styleURL:[MGLStyle darkStyleURL]];
  
  self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  // give center of paris as map's center coordinate
  [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(48.8567, 2.3508)
                          zoomLevel:11.5
                           animated:NO];
  
  [self.view addSubview:self.mapView];
  [self.view insertSubview:self.transparentView aboveSubview:self.mapView];
  
  // Declare the annotation `point` and set its coordinates, title, and subtitle
  MGLPointAnnotation *point = [[MGLPointAnnotation alloc] init];
  point.coordinate = CLLocationCoordinate2DMake(48.8567, 2.3508);
  point.title = @"Bar";
  point.subtitle = @"Hot place's name";
  
  // Add annotation `point` to the map
  [self.mapView addAnnotation:point];
  
  self.mapView.delegate = self;
  
  // Prevent panning outside the bounds of Paris
  //  CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(48.8567, 2.3508);
  //  CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(49.357147,3.793182);
  //
  //  [self.mapView setConstraintsSouthWest:southWest northEast:northEast];

}


// Always show a callout when an annotation is tapped.
- (BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id <MGLAnnotation>)annotation {
  return YES;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
