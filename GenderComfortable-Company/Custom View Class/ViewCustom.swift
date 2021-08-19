

import UIKit

@IBDesignable
class ViewCustom: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var shadowWidth:CGFloat = 0{
        
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
            layer.shadowOpacity = shadowOpacity
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
        
    }
    @IBInspectable var shadowHeight:CGFloat = 0{
        
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
            layer.shadowOpacity = shadowOpacity
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOpacity:Float = 0.0{
        
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
            layer.shadowOpacity = shadowOpacity
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowColor:UIColor = UIColor.clear{
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
            layer.shadowOpacity = shadowOpacity
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
        
    }
    
    @IBInspectable var isShadow:Bool = false{
        didSet {
            if(!isShadow){
                
                layer.shadowColor = UIColor.clear.cgColor
                layer.shadowOffset = .zero
                layer.shadowOpacity = 0
                layer.masksToBounds = false
                layer.shadowRadius = 0
            }
            else{
                layer.shadowColor = shadowColor.cgColor
                layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
                layer.shadowOpacity = shadowOpacity
                layer.masksToBounds = false
                layer.shadowRadius = shadowRadius
                
            }
        }
    }
    
    @IBInspectable var shadowRadius:CGFloat = 0.0{
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
            layer.shadowOpacity = shadowOpacity
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
        
    }
    
    @IBInspectable var isRound: Bool = false {
        didSet {
            if(isRound){
                layer.cornerRadius = self.frame.height/2
                layer.masksToBounds = true
            }
        }
    }
    
   
       @IBInspectable var dashWidth: CGFloat = 0
       @IBInspectable var dashColor: UIColor = .clear
       @IBInspectable var dashLength: CGFloat = 0
       @IBInspectable var betweenDashesSpace: CGFloat = 0
       
       var dashBorder: CAShapeLayer?
       
       override func layoutSubviews() {
           super.layoutSubviews()
           dashBorder?.removeFromSuperlayer()
           let dashBorder = CAShapeLayer()
           dashBorder.lineWidth = dashWidth
           dashBorder.strokeColor = dashColor.cgColor
           dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
           dashBorder.frame = bounds
           dashBorder.fillColor = nil
           if cornerRadius > 0 {
               dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
           } else {
               dashBorder.path = UIBezierPath(rect: bounds).cgPath
           }
           layer.addSublayer(dashBorder)
           self.dashBorder = dashBorder
       }

}
