//
//  DrawView.swift
//  TouchTracker
//
//  Created by Nicholas Grana on 8/2/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class DrawView: UIView {

    // MARK: - IBInspectable
    
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
    
    // MARK: - Properties
    
    var finishedLines = [Line]()
    var currentLines = [UITouch: Line]()
    var selectedLineIndex: Int? {
        didSet {
            if selectedLineIndex == nil {
                UIMenuController.shared.setMenuVisible(false, animated: true)
            }
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTapClear(_:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delaysTouchesBegan = true
        addGestureRecognizer(doubleTap)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(DrawView.singleTapDelete(_:)))
        singleTap.delaysTouchesBegan = true
        singleTap.require(toFail: doubleTap)
        addGestureRecognizer(singleTap)
        
        let panMove = UIPanGestureRecognizer(target: self, action: #selector(DrawView.panMoveSelect(_:)))
        panMove.cancelsTouchesInView = false
        panMove.delegate = self
        addGestureRecognizer(panMove)
        
        let longSelect = UILongPressGestureRecognizer(target: self, action: #selector(DrawView.longPressSelect(_:)))
        addGestureRecognizer(longSelect)
    }
    
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        
        finishedLineColor.setStroke()
        for line in finishedLines {
            stroke(line: line)
        }
        
        currentLineColor.setStroke()
        for line in currentLines.values {
            stroke(line: line)
        }
        
        if let index = selectedLineIndex {
            UIColor.green.setStroke()
            stroke(line: finishedLines[index])
        }
        
    }
    
    func stroke(line: Line) {
        let path = UIBezierPath()
        
        path.lineCapStyle = .round
        path.lineWidth = lineThickness
        
        path.move(to: line.start)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    func moveLine(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let index = selectedLineIndex else {
            return
        }
        
        if gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self)
            
            finishedLines[index].start.x += translation.x
            finishedLines[index].start.y += translation.y
            finishedLines[index].end.x += translation.x
            finishedLines[index].end.y += translation.y
            
            gestureRecognizer.setTranslation(CGPoint.zero, in: self)
            
            setNeedsDisplay()
        }
    }
    
    // MARK: - UIResponder Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        
        print(#function)
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
    
    // MARK: - Gesture Recognizors
    
    @objc func doubleTapClear(_ gesture: UITapGestureRecognizer) {
        selectedLineIndex = nil
        currentLines.removeAll()
        finishedLines.removeAll()
        
        setNeedsDisplay()
    }
    
    @objc func singleTapDelete(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: self)
        selectedLineIndex = indexOfLine(at: point)
        
        let menu = UIMenuController.shared
        
        if selectedLineIndex != nil {
            
            becomeFirstResponder()
            
            let deleteItem = UIMenuItem(title: "Delete", action: #selector(DrawView.deleteLine(_:)))
            menu.menuItems = [deleteItem]
            
            let targetRect = CGRect(x: point.x, y: point.y, width: 2, height: 2)
            menu.setTargetRect(targetRect, in: self)
            menu.setMenuVisible(true, animated: true)
        } else {
            menu.setMenuVisible(false, animated: true)
        }
        
        setNeedsDisplay()
    }
    
    var longPressing = false
    
    @objc func longPressSelect(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            longPressing = true
            let point = gesture.location(in: self)
            selectedLineIndex = indexOfLine(at: point)
            
            if selectedLineIndex != nil {
                currentLines.removeAll()
            }
        } else if gesture.state == .ended {
            longPressing = false
            selectedLineIndex = nil
        }
        
        setNeedsDisplay()
    }
    
    @objc func panMoveSelect(_ gesture: UIPanGestureRecognizer) {
        if longPressing {
            moveLine(gesture)
        }
    }
    
    @objc func deleteLine(_ sender: UIMenuController) {
        guard let index = selectedLineIndex else {
            return
        }
        
        finishedLines.remove(at: index)
        selectedLineIndex = nil
        
        setNeedsDisplay()
    }
    
    // MARK: - Helper Functions
    
    func indexOfLine(at point: CGPoint) -> Int? {
        for (index, line) in finishedLines.enumerated() {
            let begin = line.start
            let end = line.end
            
            for scale in stride(from: CGFloat(0), to: 1.0, by: 0.05) {
                let xLength = (end.x - begin.x) * scale
                let yLength = (end.y - begin.y) * scale
                let x = begin.x + xLength
                let y = begin.y + yLength
                
                if hypot(x - point.x, y - point.y) < 20 {
                    return index
                }
            }
        }
        return nil
    }
    
    // MARK: - Overrides
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
}

// MARK: - UIGestureRecognizerDelegate

extension DrawView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
