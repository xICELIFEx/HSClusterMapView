//
//  HSClusterMapViewDemoViewController.m
//  HSClusterMapView
//
//  Created by Alan Bouzek on 8/25/15.
//  Copyright (c) 2015 abouzek. All rights reserved.
//

#import "HSClusterMapViewDemoViewController.h"
#import "HSClusterMapView.h"
#import "HSDemoClusterRenderer.h"

@interface HSClusterMapViewDemoViewController () <GMSMapViewDelegate>

@property (strong, nonatomic) HSClusterMapView *clusterMapView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *reclusterButton;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;

@end


@implementation HSClusterMapViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HSDemoClusterRenderer *clusterRenderer = [HSDemoClusterRenderer new];
    self.clusterMapView = [[HSClusterMapView alloc] initWithFrame:self.view.bounds renderer:clusterRenderer];
    self.clusterMapView.delegate = self;
    
    [self.view addSubview:self.clusterMapView];
    [self.view sendSubviewToBack:self.clusterMapView];

    // Modify these for greater flexibility
//    self.clusterMapView.clusterSize = 0.5;
//    self.clusterMapView.minimumMarkerCountPerCluster = 2;
    
    CLLocationCoordinate2D austinCoordinates = CLLocationCoordinate2DMake(30.25, -97.75);
    GMSCameraPosition *cameraPosition = [GMSCameraPosition cameraWithTarget:austinCoordinates zoom:16];
    [self.clusterMapView setCamera:cameraPosition];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2 animations:^{
        self.instructionLabel.alpha = 0;
    }];
}


#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    GMSMarker *marker = [GMSMarker markerWithPosition:coordinate];
    marker.appearAnimation = kGMSMarkerAnimationPop;
    [self.clusterMapView addMarker:marker];
}


#pragma mark - actions

- (IBAction)reclusterButtonPressed:(UIBarButtonItem *)sender {
    [self.clusterMapView cluster];
}

- (IBAction)toggleClusteringButtonPressed:(UIBarButtonItem *)sender {
    self.clusterMapView.clusteringEnabled = !self.clusterMapView.clusteringEnabled;
    self.reclusterButton.enabled = self.clusterMapView.clusteringEnabled;
    [self.clusterMapView cluster];
}

- (IBAction)clearButtonPressed:(UIBarButtonItem *)sender {
    [self.clusterMapView clear];
}

@end
