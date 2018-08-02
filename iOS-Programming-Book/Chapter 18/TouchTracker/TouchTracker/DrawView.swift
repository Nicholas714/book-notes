//
//  DrawView.swift
//  TouchTracker
//
//  Created by Nicholas Grana on 8/2/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class DrawView: UIView {

    @IBInspectable var finishedLineColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var finishedLines = [Line]()
    var currentLines = [UITouch: Line]()
    
    override func draw(_ rect: CGRect) {
        
        finishedLineColor.setStroke()
        for line in finishedLines {
            stroke(line: line)
        }
        
        currentLineColor.setStroke()
        for line in currentLines.values {
            stroke(line: line)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)
            let line = Line(start: position, end: position, angle: touch.altitudeAngle)
            
            currentLines[touch] = line
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)

            currentLines[touch]?.end = position
        }
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLines.removeAll()
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let finishedLine = currentLines.removeValue(forKey: touch) {
                finishedLines.append(finishedLine)
            }
        }
        setNeedsDisplay()
    }
    
    func stroke(line: Line) {
        let path = UIBezierPath()
        
        path.lineCapStyle = .round
        path.lineWidth = lineThickness
        
        path.move(to: line.start)
        path.addLine(to: line.end)
        path.stroke()
    }

}
