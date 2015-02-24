//
//  SpaceImage.swift
//  cassini
//
//  Created by Vanh Phom on 2/23/15.
//  Copyright (c) 2015 VSP inc. All rights reserved.
//

import Foundation

struct MyImageURL {
    static let myImage = NSURL(string:"http://photojournal.jpl.nasa.gov/figures/PIA19141_fig1.jpg")
        //"http://www.jpl.nasa.gov/spaceimages/details.php?id=PIA19141")
    //http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA19056_hires.jpg")
    //http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA19056_hires.jpg")
    // http://apod.nasa.gov/apod/image/1502/ToadSky_Lane_2400.jpg
   // static let myImage = NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
    //    static let myImage = NSURL(string: "http://com.standford.edu/wp-content/uploads/2013/01/stanford-campus.png")
    struct NASA {
        static let Cassini = NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
        static let Earth = NSURL (string: "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg")
        static let Saturn = NSURL(string: "http://www.nasa.gov/sites/default/files/saturn_collage.jpg")
    }
}