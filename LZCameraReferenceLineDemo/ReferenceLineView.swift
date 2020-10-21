//
//  ReferenceLineView.swift
//  LZCameraReferenceLineDemo
//
//  Created by lzw on 2020/10/21.
//

import UIKit

class ReferenceLineView: UIView {
    
    var row:Int = 2
    var colum:Int = 2
    let lineW:CGFloat = 1.8
    let boderW:CGFloat = 0.4
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    init(frame: CGRect, row: Int, colum: Int) {
        super.init(frame: frame)
        self.row = row
        self.colum = colum
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit - referenceLineView")
    }
    
    func buildUI() {
        
        let referenceLineView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        self.isUserInteractionEnabled = false
        self.addSubview(referenceLineView)
        
        let padX:CGFloat = CGFloat(colum) //横线colum等分点
        let padY:CGFloat = self.height/CGFloat(row) //横线Y等分点
        for index in 0..<row-1 {
            //画row-1根横线
            let line1 = UIView()
            line1.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            line1.setBorder(color: UIColor.black.withAlphaComponent(0.2), width: 0.4)
            referenceLineView.addSubview(line1)
            line1.frame = CGRect(x: 0, y: padY+CGFloat(index)*padY-(lineW)*0.5, width: self.width, height: lineW)
            let path1 = UIBezierPath.init(rect: CGRect(x: 0, y:0, width: line1.width, height: lineW))
            for columIndex in 0..<colum-1 {
                let rect = CGRect(x: line1.width/padX+CGFloat(columIndex)*(line1.width/padX)-(lineW-2*boderW)*0.5, y: 0, width: (lineW-2*boderW), height: lineW)
                path1.append(UIBezierPath.init(roundedRect: rect, cornerRadius: 0).reversing())
                let line11 = UIView()
                line11.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                referenceLineView.insertSubview(line11, at: 0)
                line11.frame = CGRect(x: rect.origin.x, y: padY+CGFloat(index)*padY-(lineW*0.5), width: rect.width+0.02, height: rect.height)
                
            }
            let shapelayer1 = CAShapeLayer()
            shapelayer1.path = path1.cgPath
            line1.layer.mask = shapelayer1
            
        }
        
        let padX1:CGFloat = CGFloat(row) //竖线row等分点
        let padY1:CGFloat = self.width/CGFloat(colum) //竖线X等分点
        for index in 0..<colum-1 {
            //画colum-1根竖线
            
            let line2 = UIView()
            line2.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            line2.setBorder(color: UIColor.black.withAlphaComponent(0.2), width: 0.4)
            referenceLineView.addSubview(line2)
            line2.frame = CGRect(x: padY1+CGFloat(index)*padY1-(lineW)*0.5, y: 0, width: lineW, height: self.height)
            
            let path = UIBezierPath.init(rect: CGRect(x: 0, y:0, width: lineW, height:  self.height))
            
            for rowIndex in 0..<row-1 {
                path.append(UIBezierPath.init(roundedRect: CGRect(x: 0, y: line2.height/padX1+CGFloat(rowIndex)*(line2.height/padX1)-(lineW)*0.5, width: lineW, height: lineW), cornerRadius: 0).reversing())
            }
            let shapelayer = CAShapeLayer()
            shapelayer.path = path.cgPath
            line2.layer.mask = shapelayer
            
        }
        
//        referenceLineView.layer.shouldRasterize = true;
//        referenceLineView.layer.rasterizationScale = UIScreen.main.scale;
    
        
    }
    
}

extension UIView {
    
    // 设置边框线颜色
    func setBorder(color: UIColor, width: CGFloat = 1.0) {
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    var x : CGFloat {
        get {
            return frame.origin.x
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var height : CGFloat {
        get {
            return frame.size.height
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var left : CGFloat {
        get {
            return x
        }
        set(newVal) {
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        get {
            return x + width
        }
        set(newVal) {
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        get {
            return y
        }
        set(newVal) {
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        get {
            return y + height
        }
        set(newVal) {
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        get {
            return center.x
        }
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        get {
            return center.y
        }
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        get {
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        get {
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        get {
            return CGPoint(x: middleX, y: middleY)
        }
    }
 
}
