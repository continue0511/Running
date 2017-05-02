//
//  TerritoryViewController.m
//  Running
//
//  Created by 贾玉斌 on 2017/5/2.
//  Copyright © 2017年 running. All rights reserved.
//

#import "TerritoryViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface TerritoryViewController ()<MAMapViewDelegate>
@property (nonatomic, strong) MAPolygonView *polygonView;

@end

@implementation TerritoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    
    CLLocationCoordinate2D coordinates[4];
    coordinates[0].latitude = 39.810892;
    coordinates[0].longitude = 116.233413;
    
    coordinates[1].latitude = 39.816600;
    coordinates[1].longitude = 116.331842;
    
    coordinates[2].latitude = 39.762187;
    coordinates[2].longitude = 116.357932;
    
    coordinates[3].latitude = 39.733653;
    coordinates[3].longitude = 116.278255;
    
    for (NSInteger i=0; i<100; i++) {
        
        
        CGPoint origin = CGPointMake(39.810892, 116.233413);
        CGPoint point = CGPointMake(origin.x+((float)(i/10))*0.01, origin.y+((float)(i%10))*0.01) ;
        CGFloat width = 0.01;
        CLLocationCoordinate2D coordinate[4];
        coordinate[0].latitude=point.x-width/2;
        coordinate[0].longitude=point.y-width/2;
        coordinate[1].latitude=point.x+width/2;
        coordinate[1].longitude=point.y-width/2;
        coordinate[2].latitude=point.x+width/2;
        coordinate[2].longitude=point.y+width/2;
        coordinate[3].latitude=point.x-width/2;
        coordinate[3].longitude=point.y+width/2;
        MAPolygon *polygon = [MAPolygon polygonWithCoordinates:coordinate count:4];
        //在地图上添加折线对象
        [_mapView addOverlay:polygon];
    }
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
}

#pragma mark delegate
- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolygon class]]) {
        _polygonView = [[MAPolygonView alloc] initWithPolygon:overlay];
        _polygonView.lineWidth = 1.f;
        _polygonView.strokeColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
        _polygonView.fillColor = [UIColor colorWithRed:0.77 green:0.88 blue:0.94 alpha:0.8];
        //连接类型
        _polygonView.lineJoin = kCGLineJoinMiter;
        return _polygonView;
    }    return nil;
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
