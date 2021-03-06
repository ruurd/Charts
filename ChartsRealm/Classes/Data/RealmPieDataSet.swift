//
//  RealmPieDataSet.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 23/2/15.

//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

import Charts
import Realm
import Realm.Dynamic

public class RealmPieDataSet: RealmBaseDataSet, IPieChartDataSet
{
    public override func initialize()
    {
        self.valueTextColor = NSUIColor.whiteColor()
        self.valueFont = NSUIFont.systemFontOfSize(13.0)
    }
    
    // MARK: - Styling functions and accessors
    
    private var _sliceSpace = CGFloat(0.0)
    
    /// the space in pixels between the pie-slices
    /// **default**: 0
    /// **maximum**: 20
    public var sliceSpace: CGFloat
    {
        get
        {
            return _sliceSpace
        }
        set
        {
            var space = newValue
            if (space > 20.0)
            {
                space = 20.0
            }
            if (space < 0.0)
            {
                space = 0.0
            }
            _sliceSpace = space
        }
    }
    
    /// indicates the selection distance of a pie slice
    public var selectionShift = CGFloat(18.0)
    
    public var xValuePosition: PieChartValuePosition = .InsideSlice
    public var yValuePosition: PieChartValuePosition = .InsideSlice
    
    /// When valuePosition is OutsideSlice, indicates line color
    public var valueLineColor: NSUIColor? = UIColor.blackColor()
    
    /// When valuePosition is OutsideSlice, indicates line width
    public var valueLineWidth: CGFloat = 1.0
    
    /// When valuePosition is OutsideSlice, indicates offset as percentage out of the slice size
    public var valueLinePart1OffsetPercentage: CGFloat = 0.0
    
    /// When valuePosition is OutsideSlice, indicates length of first half of the line
    public var valueLinePart1Length: CGFloat = 0.1
    
    /// When valuePosition is OutsideSlice, indicates length of second half of the line
    public var valueLinePart2Length: CGFloat = 0.2
    
    /// When valuePosition is OutsideSlice, this allows variable line length
    public var valueLineVariableLength: Bool = true
    
    // MARK: - NSCopying
    
    public override func copyWithZone(zone: NSZone) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! RealmPieDataSet
        copy._sliceSpace = _sliceSpace
        copy.selectionShift = selectionShift
        return copy
    }
}