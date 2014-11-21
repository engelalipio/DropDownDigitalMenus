//
//  Constants.h
//
//  Created by Engel Alipio on 9/26/14.
//  Copyright (c) 2014 All rights reserved.
//
#import "UIColor+ColorWithHexString.h"
//Providers

#define kFaceBook       @ "facebook"
#define kTwitter        @ "twitter"
#define kStandard       @ "standard"

#define kOpenTableURL         @"http://opentable.herokuapp.com/api/"
#define kOpenTableStats       @"stats"
#define kOpenTableCities      @"cities"
#define kOpenTableRestaurants @"restaurants"
#define kOpenTableRestaurant  @"restaurants/{id}"

#define kYelpKey         @"vXAPturZx3xLLlpCVciD_g"
#define kYelpSecret      @"spys9MkxrkohQwdiQXCtOb5xQ_U"
#define kYelpToken       @"5d1pogQQXfVoSZik-qZQYYkTJldzNv_l"
#define kYelpTokenSecret @"TzC2IpKhRuRP5zKdGkoKFLr_XlAU"
#define kYelpAuthMethod  @"hmac-sha1"
#define kYelpBaseURL     @"api.yelp.com/v2/"
#define kYelpSearchURL   @"search"




/*
 
 Name	Data Type	Required / Optional	Description
 term	string	optional	Search term (e.g. "food", "restaurants"). If term isn’t included we search everything.
 limit	number	optional	Number of business results to return
 offset	number	optional	Offset the list of returned business results by this amount
 sort	number	optional	Sort mode: 0=Best matched (default), 1=Distance, 2=Highest Rated. If the mode is 1 or 2 a search may retrieve an additional 20 businesses past the initial limit of the first 20 results. This is done by specifying an offset and limit of 20. Sort by distance is only supported for a location or geographic search. The rating sort is not strictly sorted by the rating value, but by an adjusted rating value that takes into account the number of ratings, similar to a bayesian average. This is so a business with 1 rating of 5 stars doesn’t immediately jump to the top.
 category_filter	string	optional	Category to filter search results with. See the list of supported categories. The category filter can be a list of comma delimited categories. For example, 'bars,french' will filter by Bars and French. The category identifier should be used (for example 'discgolf', not 'Disc Golf').
 radius_filter	number	optional	Search radius in meters. If the value is too large, a AREA_TOO_LARGE error may be returned. The max value is 40000 meters (25 miles).
 deals_filter	bool	optional	Whether to exclusively search for businesses with deals
 
 */

#define kYelpBusinessURL @"business/{id}"

#define kParseAppId     @"LzfuRnNNgeAQOUwuo06pIEjPO60NaGbTV4Basl91"
#define kParseKey       @"yD7T6LWnsvww3Ttzt8QcSdvBHNJ5HaHBVaZn2C2o"
#define kParseAPIKey    @"qpomw7a8YWG0uiMqFc1WAY3JbfM6INIiImey7nnk"
#define kParseMasterKey @"cqfbbkJA02RuKgYIEoQhPSiH9Kv9fJfGyO4Fopi9"

#define kThorKey        @ "B90ueLiQUqaj2pmRUASMxBacZ3vivzr9"  
#define kThorSecret     @ "UIhRGUoeVlFzsA10"
#define kThorBaseURL    @ "https://ethor-test.apigee.net/v1/"
#define kChainFields    @ "id%2Cname%2Cwebsite%2Clogo%2Clink"

#define kThorGetChains         @ "chains"
#define kThorGetChainOrders    @ "chains/{id}/orders"
#define kThorGetChain          @ "chains/{id}"
#define kThorGetChainStores    @ "chains/{id}/stores"
#define kThorGetChainStore     @ "chains/{id}/stores/{store_id}"
#define kThorGetChainCustomers @ "chains/{id}/customers"
#define kThorGetChainCustomer  @ "chains/{id}/customers/{customer_id}"

#define kThorTestChain  @"YCJC0YLTNG"
#define kThorMaxCount   @"100"

#define kSpanDiameter 0.10f
#define kSpanRadius   1500
#define kDefaultTableCellHeight 44
#define kTableCellMapHeight 220
#define kTableCellImageHeight 220

#define kTableYStart 64.0f
#define kTabletWidth 768.0f
#define kTableHeight 1024.0f

#define kImageDimension @"50"
#define kImageStoreDimension @"32"
#define kUserPin        @"MePin.png"
#define kStorePin       @"Pin.png"

#define kFakeUserLocation NO
#define kFakeUserLongitude -114.062981
#define kFakeUserLatitude  51.054319

#define kMeter 1609.344f
#define kMile  0.000621371192f

#define kTintColor @"13658F"

#define kAllDigits      @ "0123456789"


// Width (or length before rotation) of the table view embedded within another table view's row
#define kTableLength                                768

// Width of the cells of the embedded table view (after rotation, which means it controls the rowHeight property)
#define kCellWidth                                  200
// Height of the cells of the embedded table view (after rotation, which would be the table's width)
#define kCellHeight                                 200

// Padding for the Cell containing the article image and title
#define kArticleCellVerticalInnerPadding            1
#define kArticleCellHorizontalInnerPadding          1

// Padding for the title label in an article's cell
#define kArticleTitleLabelPadding                   20

// Vertical padding for the embedded table view within the row
#define kRowVerticalPadding                         2
// Horizontal padding for the embedded table view within the row
#define kRowHorizontalPadding                       2

// The background color of the vertical table view
#define kVerticalTableBackgroundColor        [UIColor colorWithHexString: @"004080"]  //[UIColor colorWithRed:0.58823529 green:0.58823529 blue:0.58823529 alpha:1.0]
//004080
// Background color for the horizontal table view (the one embedded inside the rows of our vertical table)
#define kHorizontalTableBackgroundColor            [UIColor colorWithHexString:@"FF8000" ] //[UIColor colorWithRed:0.6745098 green:0.6745098 blue:0.6745098 alpha:1.0]

// The background color on the horizontal table view for when we select a particular cell
#define kHorizontalTableSelectedBackgroundColor    [UIColor whiteColor];
