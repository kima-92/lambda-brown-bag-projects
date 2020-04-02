//
//  MyNotes.swift
//  Auto Layout Testing
//
//  Created by macbook on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

/*
 
 MARK: - Constraint
 
A rule that governs the size and position of an element or multiple elements in a view
 
 Think of it as an equation:
 
    item1.attribute1 = multiplier * item2.attribute2 + contant
 
 */
 /*
 
 MARK: - Auto Layout
 
 A system that dynamically calculates the size and position of all views in the view herarchy based on the constraints placed on those views.
 
    - Need to know where this item should be positioned (x, y) and what it's size will be (width & hight)
 
    - Assuming we know the coordinate space of the super view, we can contrain the subView relative to that superView
 
 */
 /*
 
 MARK: - Autoresizing Masks
 
 Before Auto Layout, there were Autoresizing Masks.
 
 Autoresizing Masks are limited to a parent-child relationship, from a superView to it's subView
 
 Because of this limitation, Auto Layout is a better chioce since it defines how one View relates to other Views.
 
 * AVOID using Auto Layout where Autoresizing Masks are defines cause it can lead to conflicting constraints
 
 */
 /*
 
 MARK: NSLayoutAnchor
 
 Adding Constraints in Code
 
    - A factory class for creating layout contraint objects using a fluent API
 
    - Anchor properties are apart of UIView
 
    - Correspond to NSLayoutContraint.Attribute values used in Auto Layout and provide appropriate NSLayoutAnchor subclass for creating constraints to that attribute
 
 TODO: Example
 
 * using topAnchor, centerXAnchor, widthAnchor, ect...
 
 */
 /*
 
 MARK: Intrinsic Content Size
 
 The natural size for the receiving View, considering only properties of the View itself
 
 Like a switch, toggle switch, button, textField, label ect..
 
 label - the size of it's text
 segment control - based on the amount of segments it has
 
 */
 /*
 
 MARK: Layout Priorities
 
 When setting layout priorities, the main question to answer:
    
    When a View grows / shrinks, how should the subViews adjust their size to accommodate extra / less space??
 
 1. Content Compression Resistance Priority
 
    The HIGHER the value, the MORE RESISTANT the View will be to SHRINKING
 
 2. Content Huggung Priority
 
    The HIGHER the value, the MORE RESISTANT the View will be to GROWING
 
 */
 /*
 
 MARK: Stack Views ( Distribution )
 
 A streamlined interface for laying out a collection of Views in either a column or a row
 
 Attributes to consider when using Auto Layout:
 
 1. Distribution
 
        Defines the size and position of the arranged views along the Stack View's axis
 
 2. Alignment
 
        Determines how the Stack View lays out it's arranged Views prependicularly to it's axis
 
 */
 /*
 
 MARK: Safe Area
 
 Safe portion View that's not covered by any navigation bar, tool bar, and any other ancester Views
 
 */
 /*
 
 MARK: Conflicting Constraints
 
 The debug console will display what constraints have issues. Note that each View will have an address to where it's stored in memory. You can see which constraint is conflicting when you notice which adress is beaing repeaded
 
 */
