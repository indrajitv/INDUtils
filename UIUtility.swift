

import UIKit
extension UIView{
    
    
    
    
    func addSubviews(views:[UIView]){
        views.forEach { (_view) in
            addSubview(_view)
        }
    }
    
    func setAnchors(top:NSLayoutYAxisAnchor?,bottom:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,right:NSLayoutXAxisAnchor?,topConstant:CGFloat,bottomConstant:CGFloat,leftConstant:CGFloat,rightConstant:CGFloat){
        if let value = left{
            setLeft(with: value, constant: leftConstant)
        }
        if let value = right{
            setRight(with: value, constant: rightConstant)
        }
        if let value = top{
            setTop(with: value, constant: topConstant)
        }
        if let value = bottom{
            setBottom(with: value, constant: bottomConstant)
        }
    }
    
    
    
    func setAnchors(top:NSLayoutYAxisAnchor?,bottom:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,right:NSLayoutXAxisAnchor?){
        if let value = left{
            setLeft(with: value, constant: 0)
        }
        if let value = right{
            setRight(with: value, constant: 0)
        }
        if let value = top{
            setTop(with: value, constant: 0)
        }
        if let value = bottom{
            setBottom(with: value, constant: 0)
        }
    }
    
    
    
    func setHeight(height:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setHeight(height:NSLayoutDimension){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: height, multiplier: 1).isActive = true
    }
    
    func setWidth(width:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setWidth(width:NSLayoutDimension){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: width, multiplier: 1).isActive = true
    }
    
    func setHeightAndWidth(height:CGFloat,width:CGFloat){
        setHeight(height: height)
        setWidth(width: width)
    }
    
    
    func setRight(with:NSLayoutXAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(equalTo: with).isActive = true
    }
    func setRight(with:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    func setLeft(with:NSLayoutXAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: with).isActive = true
    }
    func setLeft(with:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
   
    func setTop(with:NSLayoutYAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: with).isActive = true
    }
    func setTop(with:NSLayoutYAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    func setBottom(with:NSLayoutYAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: with).isActive = true
    }
    func setBottom(with:NSLayoutYAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
    
    func setFullOnSuperView(){
        if let superViewOfThis = superview{
            self.setTop(with: superViewOfThis.topAnchor)
            self.setBottom(with: superViewOfThis.bottomAnchor)
            self.setLeft(with: superViewOfThis.leftAnchor)
            self.setRight(with: superViewOfThis.rightAnchor)
        }
    }
    
    func setCenterY(){
        if let superViewOfThis = superview{
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerYAnchor.constraint(equalTo: superViewOfThis.centerYAnchor, constant: 0).isActive = true
        }
    }
    
    func setCenterY(constant:CGFloat){
        if let superViewOfThis = superview{
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerYAnchor.constraint(equalTo: superViewOfThis.centerYAnchor, constant: constant).isActive = true
        }
    }
    
    
    func setCenterX(){
        if let superViewOfThis = superview{
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerXAnchor.constraint(equalTo: superViewOfThis.centerXAnchor, constant: 0).isActive = true
        }
    }
    
    func setCenterX(constant:CGFloat){
        if let superViewOfThis = superview{
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerXAnchor.constraint(equalTo: superViewOfThis.centerXAnchor, constant: constant).isActive = true
        }
    }
    
    func setCenterXto(xAnachor:NSLayoutXAxisAnchor,constant:CGFloat = 0){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: xAnachor, constant: constant).isActive = true
    }
    
    func setCenterYto(yAnchor:NSLayoutYAxisAnchor,constant:CGFloat = 0){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: yAnchor, constant: constant).isActive = true
    }
    
    func setCenter(){
        setCenterX()
        setCenterY()
    }
    
    func setCenter(xConstant:CGFloat,yConstant:CGFloat){
        setCenterX(constant: xConstant)
        setCenterY(constant: yConstant)
    }
    
    
}

extension UIColor{
    static func rgb(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat = 1)->UIColor{
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}



extension String{
   
    func addAtributes(color:UIColor,underlined:Bool = false)->NSAttributedString{
        let atString = NSMutableAttributedString()
       
        if underlined{
            atString.append(NSAttributedString(string: self, attributes:
                [.underlineStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.foregroundColor:color]))
        }else{
            atString.append(NSAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor:color]))
        }
        return atString
    }
    
    func addAtributes(font:UIFont)->NSAttributedString{
        let atString = NSMutableAttributedString()
        atString.append(NSAttributedString(string: self, attributes: [NSAttributedString.Key.font:font]))
        return atString
    }
    
    func addAtributes(color:UIColor,font:UIFont)->NSAttributedString{
        let atString = NSMutableAttributedString()
        atString.append(NSAttributedString(string: self, attributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:color]))
        return atString
    }
    func addAtributes(color:UIColor,font:UIFont,paragraph:NSParagraphStyle)->NSAttributedString{
        let atString = NSMutableAttributedString()
        atString.append(NSAttributedString(string: self, attributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:color,NSAttributedString.Key.paragraphStyle:paragraph]))
        return atString
    }

    
    func withoutSpaces()->String{
        return self.replacingOccurrences(of: " ", with: "")
    }
}











class BaseCellForCV:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){}
    
}


class BaseCellForTV:UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpViews(){}
}

extension UILabel {
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
}


extension UIViewController{
 
    func push(dv:UIViewController){
        self.navigationController?.pushViewController(dv, animated: true)
    }

}

extension NSObject {
    func copyObject<T:NSObject>() throws -> T? {
        let data = try NSKeyedArchiver.archivedData(withRootObject:self, requiringSecureCoding:false)
        return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
    }
}


enum HudTheme{
    case theme1
    case theme2
    case theme3
    case theme4
    case theme5
    case theme6
}
class RoundProgress:NSObject{
    
    static var hudContainderSize:CGFloat = 110 // Size of container which holds all stuff
    
    static var hudType:HudTheme = .theme6 // Type of hud
    
    static var rotationLineWidth:CGFloat = 3 // line which is rotating
    
    static var rotaionGapPercentage:CGFloat = 92 // The gap which appears in round rotating line
    
    static var rotationSpeedTime:TimeInterval = 0.9 // Speed of rotation
    static var rotationSizeRatio:CGFloat = 2 // This is the size ration of round rotating line, By default it is half of total hud size that is hudContainderSize
    
    static var rotationLineColor:UIColor = .gray // Color of rotating line
    static var rotationLineGapColor:UIColor = .clear // Color of the gap which appears in round rotating line
    
    static var showNetworkIndicator:Bool = true // At the top or on the status bar there is default network indicator
    
    fileprivate static var isAnimating = false
    
    static let disablerView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    static let hudContainder:UIImageView={
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.init(white: 0.3, alpha: 0.5)
        return view
    }()
    static var loadingIndicator:UIActivityIndicatorView={
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.style = .whiteLarge
        loading.backgroundColor = .clear
        loading.layer.cornerRadius = 16
        loading.layer.masksToBounds = true
        return loading
    }()
    
    static var hudTextsLabel:UILabel={
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Please wait..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let rotationRoundBackground:UIView={ // This is the view which is containing the rotating line
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate static var timerToHideHud:Timer?
    fileprivate static var timerToShowHud:Timer?
    
    @objc class func hideHudAfterDelay(timeInterval:Double){
        
        RoundProgress.timerToShowHud?.invalidate()
        RoundProgress.timerToHideHud = Timer.scheduledTimer(timeInterval: timeInterval, target: RoundProgress.self, selector: #selector(RoundProgress.hide), userInfo: nil, repeats: false)
        
    }
    
    @objc class func hide(){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isAnimating = false
        RoundProgress.loadingIndicator.stopAnimating()
        RoundProgress.disablerView.removeFromSuperview()
        timerToHideHud?.invalidate()
        
    }
    
    
    class func showHudAfterDelay(timeInterval:Double,hudTexts:String = "Please wait...",conainerView:Any? = nil)
    {
        RoundProgress.hudTextsLabel.text = hudTexts
        RoundProgress.timerToHideHud?.invalidate()
        
        RoundProgress.timerToShowHud = Timer.scheduledTimer(timeInterval: timeInterval, target: RoundProgress.self, selector: #selector(RoundProgress.showHudAfterDelayWithPatameter), userInfo: ["hudTexts":hudTexts,"view":conainerView], repeats: false)
    }
    
    @objc fileprivate static func showHudAfterDelayWithPatameter(timer:Timer){
        if let userInfo = timer.userInfo as? [String:Any]{
            var conainerView:UIView?
            if let value = userInfo["view"] as? UIView{
                conainerView = value
            }
            if let value = userInfo["hudTexts"] as? String{
                showHud(hudTexts: value, hudConainerView: conainerView)
            }
        }
    }
    
    @objc static func showHud(hudTexts:String = "Please wait...",hudConainerView:UIView? = nil){
        
        RoundProgress.hudTextsLabel.text = hudTexts
        func setUpHudeViews(keyWindow:UIView){
            
            if !isAnimating
            {
                isAnimating = true
                UIApplication.shared.isNetworkActivityIndicatorVisible = showNetworkIndicator
                keyWindow.addSubview(disablerView)
                
                disablerView.rightAnchor.constraint(equalTo: keyWindow.rightAnchor).isActive = true
                disablerView.leftAnchor.constraint(equalTo: keyWindow.leftAnchor).isActive = true
                disablerView.topAnchor.constraint(equalTo: keyWindow.topAnchor).isActive = true
                disablerView.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor).isActive = true
                RoundProgress.loadingIndicator.startAnimating()
                
                disablerView.addSubview(hudContainder)
                hudContainder.addSubview(hudTextsLabel)
                
                hudContainder.centerXAnchor.constraint(equalTo: disablerView.centerXAnchor).isActive = true
                hudContainder.centerYAnchor.constraint(equalTo: disablerView.centerYAnchor).isActive = true
                hudContainder.widthAnchor.constraint(equalToConstant: hudContainderSize).isActive = true
                hudContainder.heightAnchor.constraint(equalToConstant: hudContainderSize).isActive = true
                
                func showRound(){
                    let roatationViewSize:CGFloat = hudContainderSize/rotationSizeRatio
                    hudContainder.addSubview(rotationRoundBackground)
                    rotationRoundBackground.heightAnchor.constraint(equalToConstant:roatationViewSize).isActive = true
                    rotationRoundBackground.widthAnchor.constraint(equalToConstant:roatationViewSize).isActive = true
                    rotationRoundBackground.layer.masksToBounds = true
                    let halfSize:CGFloat = roatationViewSize/2
                    rotationRoundBackground.layer.cornerRadius = halfSize
                    rotationRoundBackground.centerXAnchor.constraint(equalTo: hudContainder.centerXAnchor).isActive = true
                    rotationRoundBackground.centerYAnchor.constraint(equalTo: hudContainder.centerYAnchor).isActive = true
                    hudTextsLabel.topAnchor.constraint(equalTo: rotationRoundBackground.bottomAnchor, constant: 5).isActive = true
                    
                    func getShapeLayer(color:UIColor,view:UIView,gap:Double){
                        let circlePath = UIBezierPath(
                            arcCenter: CGPoint(x:halfSize,y:halfSize),
                            radius: CGFloat( halfSize - (rotationLineWidth/2)),
                            startAngle: CGFloat(0),
                            endAngle:CGFloat(Double.pi * gap),
                            clockwise: true)
                        let shapeLayer = CAShapeLayer()
                        shapeLayer.path = circlePath.cgPath
                        shapeLayer.fillColor = UIColor.clear.cgColor
                        shapeLayer.strokeColor = color.cgColor
                        shapeLayer.lineWidth = rotationLineWidth
                        view.layer.addSublayer(shapeLayer)
                    }
                    
                    getShapeLayer(color: rotationLineGapColor, view: rotationRoundBackground,gap: 2)
                    getShapeLayer(color: rotationLineColor, view: rotationRoundBackground,gap: (Double((rotaionGapPercentage * 2)/100)))
                    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
                    rotateAnimation.fromValue = 0.0
                    rotateAnimation.toValue = CGFloat(Double.pi * 2)
                    rotateAnimation.isRemovedOnCompletion = false
                    rotateAnimation.duration = rotationSpeedTime
                    rotateAnimation.repeatCount = Float.infinity
                    rotationRoundBackground.layer.add(rotateAnimation, forKey: nil)
                }
                
                switch hudType{
                case .theme1:
                    rotationLineColor = UIColor.blue.withAlphaComponent(0.5)
                    self.hudTextsLabel.isHidden = true
                    hudContainder.backgroundColor = .clear
                    self.disablerView.backgroundColor = .white
                    showRound()
                case .theme2:
                    rotationLineColor = UIColor.blue.withAlphaComponent(0.5)
                    self.hudTextsLabel.textColor = rotationLineColor.withAlphaComponent(1)
                    self.hudTextsLabel.isHidden = false
                    hudContainder.backgroundColor = .clear
                    showRound()
                case .theme3:
                    rotationLineColor = UIColor.blue.withAlphaComponent(0.5)
                    self.hudTextsLabel.textColor = rotationLineColor.withAlphaComponent(1)
                    self.hudTextsLabel.isHidden = false
                    hudContainder.backgroundColor = UIColor.lightGray
                    showRound()
                case .theme4:
                    rotationLineColor = UIColor.blue.withAlphaComponent(0.5)
                    self.hudTextsLabel.textColor = rotationLineColor.withAlphaComponent(1)
                    self.hudTextsLabel.isHidden = true
                    hudContainder.backgroundColor = UIColor.lightGray
                    showRound()
                case .theme5:
                    hudContainder.addSubview(loadingIndicator)
                    loadingIndicator.centerXAnchor.constraint(equalTo: hudContainder.centerXAnchor).isActive = true
                    loadingIndicator.centerYAnchor.constraint(equalTo: hudContainder.centerYAnchor).isActive = true
                    hudTextsLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 5).isActive = true
                case .theme6:
                    hudContainder.backgroundColor = .clear
                    self.hudTextsLabel.isHidden = true
                    hudContainder.addSubview(loadingIndicator)
                    loadingIndicator.centerXAnchor.constraint(equalTo: hudContainder.centerXAnchor).isActive = true
                    loadingIndicator.centerYAnchor.constraint(equalTo: hudContainder.centerYAnchor).isActive = true
                    hudTextsLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 5).isActive = true
                }
                
                
                
                hudTextsLabel.rightAnchor.constraint(equalTo: hudContainder.rightAnchor, constant: -3).isActive = true
                hudTextsLabel.leftAnchor.constraint(equalTo: hudContainder.leftAnchor, constant: 3).isActive = true
                hudTextsLabel.bottomAnchor.constraint(equalTo: hudContainder.bottomAnchor, constant: -5).isActive = true
                
            }
            
        }
        
        if let superView = hudConainerView{
            setUpHudeViews(keyWindow: superView)
        }else if let keyWindow = UIViewController.getVisibleViewController(nil) {
            setUpHudeViews(keyWindow: keyWindow.view)
        }
    }
    
}



class LineProgress{
    
    fileprivate static var isAnimating = false
    static var showNetworkIndicator = true
    static let lineView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    
    static let disablerView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return view
    }()
    static var topAnchorOfLineView:NSLayoutConstraint!
    static func show(onView:UIView? = nil){
        DispatchQueue.main.async {
            if !isAnimating{
                isAnimating = true
                
                if UIApplication.hasTopNotch{
                    RoundProgress.showHud()
                    return
                }
                
                let sizeOfLineView:CGFloat = 3
                if let view = onView{
                    view.addSubview(disablerView)
                    disablerView.setFullOnSuperView()
                    view.addSubview(lineView)
                    lineView.setHeight(height: sizeOfLineView)
                    lineView.setAnchors(top: view.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor)
                  
                    
                }else{
                    if let vc = UIViewController.getVisibleViewController(nil){
                        vc.view.addSubview(disablerView)
                        disablerView.setFullOnSuperView()
                        
                        if let navView = vc.navigationController?.navigationBar,!navView.isHidden{
                            navView.addSubview(lineView)
                            lineView.setAnchors(top: navView.bottomAnchor, bottom: nil, left: navView.leftAnchor, right: navView.rightAnchor, topConstant: -(sizeOfLineView/2), bottomConstant: 0, leftConstant: 0, rightConstant: 0)
                            
                        }else if let view = vc.view{
                            let pad = UIDevice.current.userInterfaceIdiom == .pad
                            if let statusBar = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow{
                                statusBar.addSubview(lineView)
                                let isLandscape = (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight)
                              
                                lineView.setAnchors(top: nil, bottom: nil, left: statusBar.leftAnchor, right: statusBar.rightAnchor, topConstant: -(sizeOfLineView/2), bottomConstant: 0, leftConstant: 0, rightConstant: 0)
                                
                                topAnchorOfLineView = lineView.topAnchor.constraint(equalTo: statusBar.topAnchor, constant: pad ? 20 : (isLandscape ? 0 : 20))
                                topAnchorOfLineView?.isActive = true
                                if !pad{
                                    NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
                                    NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
                                }
                            }else{
                                view.addSubview(lineView)
                                lineView.setAnchors(top:  view.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
                                
                            }
                        }
                        lineView.setHeight(height: sizeOfLineView)
                    }
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = showNetworkIndicator
                let color = CABasicAnimation(keyPath: "borderColor")
                let colorTopForMainView = UIColor(red: 31.0 / 255.0, green: 139.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
                let colorBottomForMainView = UIColor.white.cgColor//UIColor(red: 7.0 / 255.0, green: 106.0 / 255.0, blue: 200 / 255.0, alpha: 1.0).cgColor
                color.fromValue = colorTopForMainView
                color.toValue = colorBottomForMainView
                color.duration = 0.8
                color.repeatCount = Float.greatestFiniteMagnitude
                color.autoreverses = true
                lineView.layer.borderWidth = sizeOfLineView
                lineView.layer.borderColor = UIColor.blue.cgColor
                lineView.layer.add(color, forKey: "borderColor")
            }
        }
        
    }
    
    @objc static func rotated(){
        let isLandscape = (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight)
        topAnchorOfLineView?.constant = isLandscape ? 0 : 20
    }
    
    static func hide(){
        
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            isAnimating = false
            lineView.layer.removeAllAnimations()
            lineView.removeFromSuperview()
            disablerView.removeFromSuperview()
            topAnchorOfLineView = nil
            
            if UIApplication.hasTopNotch{
                RoundProgress.hide()
                return
            }
        }
        
    }
    
}



class CircularProgress: UIView {
    
    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var tracklayer = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    var progressColor:UIColor = UIColor.red {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor:UIColor = UIColor.white {
        didSet {
            tracklayer.strokeColor = trackColor.cgColor
        }
    }
    
    fileprivate func createCircularPath() {
        self.layer.cornerRadius = self.frame.size.width/2.0
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
                                      radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * Double.pi),
                                      endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
        
        tracklayer.path = circlePath.cgPath
        tracklayer.fillColor = UIColor.clear.cgColor
        tracklayer.strokeColor = trackColor.cgColor
        tracklayer.lineWidth = 2.0
        tracklayer.strokeEnd = 1.0
        layer.addSublayer(tracklayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 2.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
        
    }
    
    func setProgressWithAnimation(duration: TimeInterval, fromVal: CGFloat,toVal: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = fromVal
        animation.toValue = toVal
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = toVal
        progressLayer.add(animation, forKey: "animateCircle")
    }
    
}

class CustomPickerView:NSObject,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    //Theme colors
    var itemTextColor = UIColor.black
    var backgroundColor = UIColor.orange.withAlphaComponent(0.5)
    var toolBarColor = UIColor.blue
    var font = UIFont.systemFont(ofSize: 16)
    
    private static var shared:CustomPickerView!
    var bottomAnchorOfPickerView:NSLayoutConstraint!
    var heightOfPickerView:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 160 : 120
    var heightOfToolbar:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 50 : 40
    
    var dataSource:(items:[String]?,itemIds:[String]?)
    
    typealias CompletionBlock = (_ item:String?,_ id:String?) -> Void
    var didSelectCompletion:CompletionBlock?
    var doneBottonCompletion:CompletionBlock?
    var cancelBottonCompletion:CompletionBlock?
    
    
    lazy var pickerView:UIPickerView={
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.delegate = self
        pv.dataSource = self
        pv.showsSelectionIndicator = true
        pv.backgroundColor = self.backgroundColor
        return pv
    }()
    
    lazy var disablerView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    lazy var tooBar:UIView={
        let view = UIView()
        view.backgroundColor = self.toolBarColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonDone)
        buttonDone.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        buttonDone.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        buttonDone.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        buttonDone.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        view.addSubview(buttonCancel)
        buttonCancel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        buttonCancel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        buttonCancel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        buttonCancel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        return view
    }()
    
    
    lazy var buttonDone:UIButton={
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.tintColor = self.itemTextColor
        button.titleLabel?.font = self.font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(self.buttonDoneClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonCancel:UIButton={
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.tintColor = self.itemTextColor
        button.titleLabel?.font = self.font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(self.buttonCancelClicked), for: .touchUpInside)
        return button
    }()
    
    
    static func show(items:[String],itemIds:[String]? = nil,selectedValue:String? = nil,doneBottonCompletion:CompletionBlock?,didSelectCompletion:CompletionBlock?,cancelBottonCompletion:CompletionBlock?){
        
        if CustomPickerView.shared == nil{
            shared = CustomPickerView()
        }else{
            return
        }
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,let keyWindow = appDelegate.window {
            
            shared.cancelBottonCompletion = cancelBottonCompletion
            shared.didSelectCompletion = didSelectCompletion
            shared.doneBottonCompletion = doneBottonCompletion
            shared.dataSource.items = items
            
            if let idsVal = itemIds,items.count == idsVal.count{ //ids can not be less or more than items
                shared?.dataSource.itemIds  = itemIds
            }
            
            shared?.heightOfPickerView += shared.heightOfToolbar
            
            keyWindow.addSubview(shared.disablerView)
            shared.disablerView.leftAnchor.constraint(equalTo: keyWindow.leftAnchor, constant: 0).isActive = true
            shared.disablerView.rightAnchor.constraint(equalTo: keyWindow.rightAnchor, constant: 0).isActive = true
            shared.disablerView.topAnchor.constraint(equalTo: keyWindow.topAnchor, constant: 0).isActive = true
            shared.disablerView.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor, constant: 0).isActive = true
            
            
            shared.disablerView.addSubview(shared.pickerView)
            shared.pickerView.leftAnchor.constraint(equalTo: shared.disablerView.leftAnchor, constant: 0).isActive = true
            shared.pickerView.rightAnchor.constraint(equalTo: shared.disablerView.rightAnchor, constant: 0).isActive = true
            shared.pickerView.heightAnchor.constraint(equalToConstant: shared.heightOfPickerView).isActive = true
            shared.bottomAnchorOfPickerView = shared.pickerView.topAnchor.constraint(equalTo: shared.disablerView.bottomAnchor, constant: 0)
            shared.bottomAnchorOfPickerView.isActive = true
            
            
            shared.disablerView.addSubview(shared.tooBar)
            shared.tooBar.heightAnchor.constraint(equalToConstant: shared.heightOfToolbar).isActive = true
            shared.tooBar.leftAnchor.constraint(equalTo: shared.disablerView.leftAnchor, constant: 0).isActive = true
            shared.tooBar.rightAnchor.constraint(equalTo: shared.disablerView.rightAnchor, constant: 0).isActive = true
            shared.tooBar.bottomAnchor.constraint(equalTo: shared.pickerView.topAnchor, constant: 0).isActive = true
            
            keyWindow.layoutIfNeeded()
            
            
            if let selectedVal = selectedValue{
                for (index,itemName) in items.enumerated(){
                    if itemName.lowercased() == selectedVal.lowercased(){
                        shared.pickerView.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                }
            }
            
            shared.bottomAnchorOfPickerView.constant = -shared.heightOfPickerView
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                keyWindow.layoutIfNeeded()
                shared.disablerView.alpha = 1
            }) { (bool) in  }
            
        }
    }
    
    
    //MARK: Picker datasource delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let count = dataSource.items?.count{
            return count
        }
        return 0
    }
    
    
    
    //MARK: Picker delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if let names = dataSource.items{
            return names[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if let names = dataSource.items{
            let item = names[row]
            return NSAttributedString(string: item, attributes: [NSAttributedString.Key.foregroundColor : itemTextColor,NSAttributedString.Key.font : font])
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var itemName:String?
        var id:String?
        
        if let names = dataSource.items{
            itemName = names[row]
        }
        if let ids = dataSource.itemIds{
            id = ids[row]
        }
        self.didSelectCompletion?(itemName, id)
    }
    
    
    
    @objc func buttonDoneClicked(){
        self.hidePicker(handler: doneBottonCompletion)
    }
    
    @objc func buttonCancelClicked(){
        
        self.hidePicker(handler: cancelBottonCompletion)
    }
    
    func hidePicker(handler:CompletionBlock?){
        var itemName:String?
        var id:String?
        let row = self.pickerView.selectedRow(inComponent: 0)
        if let names = dataSource.items{
            itemName = names[row]
        }
        if let ids = dataSource.itemIds{
            id = ids[row]
        }
        handler?(itemName, id)
        
        bottomAnchorOfPickerView.constant = self.heightOfPickerView
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.disablerView.window!.layoutIfNeeded()
            self.disablerView.alpha = 0
        }) { (bool) in
            self.disablerView.removeFromSuperview()
            CustomPickerView.shared = nil
        }
    }
    
}


class AlertView{
    
    static func show(title:String? = nil,message:String?,preferredStyle: UIAlertController.Style = .alert,buttons:[String] = ["ok".localize],sourceRect:CGRect? = nil,completionHandler:@escaping (String)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for button in buttons{
            
            var style = UIAlertAction.Style.default
            let buttonText = button.lowercased().replacingOccurrences(of: " ", with: "")
            if (buttonText == "cancel".localize || buttonText == "cancel"),UIDevice.current.userInterfaceIdiom != .pad{
                style = .cancel
            }
            let action = UIAlertAction(title: button, style: style) { (_) in
                completionHandler(button)
            }
            alert.addAction(action)
        }
        
        DispatchQueue.main.async {
            if let rootViewController = UIViewController.getVisibleViewController(nil){
                LineProgress.hide()
                if UIDevice.current.userInterfaceIdiom == .pad,preferredStyle == .actionSheet {
                    if let rect = sourceRect{
                        alert.popoverPresentationController?.sourceRect = rect
                    }else{
                        alert.popoverPresentationController?.permittedArrowDirections = .init(rawValue: 0)
                        alert.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: UIScreen.main.bounds.height/2 - 300, width: 200, height: 600)
                    }
                    
                    alert.popoverPresentationController?.sourceView = rootViewController.view
                    rootViewController.present(alert, animated: true, completion: nil)
                }  else {
                    rootViewController.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
}


extension UIViewController{
    static func getVisibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        
        var rootVC = rootViewController
        if rootVC == nil {
            rootVC = UIApplication.shared.keyWindow?.rootViewController
        }
        
        var presented = rootVC?.presentedViewController
        if rootVC?.presentedViewController == nil {
            if let isTab = rootVC?.isKind(of: UITabBarController.self), let isNav = rootVC?.isKind(of: UINavigationController.self) {
                if !isTab && !isNav {
                    return rootVC
                }
                presented = rootVC
            } else {
                return rootVC
            }
        }
        
        if let presented = presented {
            if presented.isKind(of: UINavigationController.self) {
                if let navigationController = presented as? UINavigationController {
                    return navigationController.viewControllers.last!
                }
            }
            
            if presented.isKind(of: UITabBarController.self) {
                if let tabBarController = presented as? UITabBarController {
                    if let navigationController = tabBarController.selectedViewController! as? UINavigationController {
                        return navigationController.viewControllers.last!
                    } else {
                        return tabBarController.selectedViewController!
                    }
                }
            }
            
            return getVisibleViewController(presented)
        }
        return nil
    }
}



class ShowToast: NSObject {
    static var lastToastLabelReference:UILabel?
    static var initialYPos:CGFloat = 0
    class func show(toatMessage:String,feedBack:Bool = false)
    {
        
        LineProgress.hide()
        RoundProgress.hide()
        if toatMessage.replacingOccurrences(of: " ", with: "").count == 0{
            return
        }
        
        
        if let keyWindow = UIApplication.shared.keyWindow{
            
            if lastToastLabelReference != nil
            {
                let prevMessage = lastToastLabelReference!.text?.replacingOccurrences(of: " ", with: "").lowercased()
                let currentMessage = toatMessage.replacingOccurrences(of: " ", with: "").lowercased()
                if prevMessage == currentMessage
                {
                    return
                }
            }
            
            if feedBack{
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
            
            let cornerRadious:CGFloat = 12
            let toastContainerView:UIView={
                let view = UIView()
                view.layer.masksToBounds = true
                view.layer.cornerRadius = cornerRadious
                view.layer.borderColor = UIColor.white.cgColor
                view.layer.borderWidth = 0.4
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = UIColor.init(red: 31/255, green: 46/255, blue: 69/255, alpha: 1)
                return view
            }()
            let labelForMessage:UILabel={
                let label = UILabel()
                label.layer.cornerRadius = cornerRadious
                label.layer.masksToBounds = true
                label.textAlignment = .center
                label.numberOfLines = 0
                label.adjustsFontSizeToFitWidth = true
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = toatMessage
                label.textColor = .white
                label.backgroundColor = UIColor.init(white: 0, alpha: 0)
                return label
            }()
            
            keyWindow.addSubview(toastContainerView)
            let fontType = UIFont.systemFont(ofSize: UIDevice.current.userInterfaceIdiom == .pad ? 14 : 13)
            labelForMessage.font = fontType
            
            let sizeOfMessage = NSString(string: toatMessage).boundingRect(with: CGSize(width: keyWindow.frame.width, height: keyWindow.frame.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:fontType], context: nil)
            
            let topAnchor = toastContainerView.bottomAnchor.constraint(equalTo: keyWindow.topAnchor, constant: 0)
            keyWindow.addConstraint(topAnchor)
            
            toastContainerView.centerXAnchor.constraint(equalTo: keyWindow.centerXAnchor, constant: 0).isActive = true
            
            var extraHeight:CGFloat = 0
            if (keyWindow.frame.size.width) < (sizeOfMessage.width+20)
            {
                extraHeight = (sizeOfMessage.width+20) - (keyWindow.frame.size.width)
                toastContainerView.leftAnchor.constraint(equalTo: keyWindow.leftAnchor, constant: 5).isActive = true
                toastContainerView.rightAnchor.constraint(equalTo: keyWindow.rightAnchor, constant: -5).isActive = true
            }
            else
            {
                toastContainerView.widthAnchor.constraint(equalToConstant: sizeOfMessage.width+20).isActive = true
            }
            let totolHeight:CGFloat = sizeOfMessage.height+15+extraHeight
            toastContainerView.heightAnchor.constraint(equalToConstant:totolHeight).isActive = true
            toastContainerView.addSubview(labelForMessage)
            lastToastLabelReference = labelForMessage
            labelForMessage.topAnchor.constraint(equalTo: toastContainerView.topAnchor, constant: 0).isActive = true
            labelForMessage.bottomAnchor.constraint(equalTo: toastContainerView.bottomAnchor, constant: 0).isActive = true
            labelForMessage.leftAnchor.constraint(equalTo: toastContainerView.leftAnchor, constant: 5).isActive = true
            labelForMessage.rightAnchor.constraint(equalTo: toastContainerView.rightAnchor, constant: -5).isActive = true
            keyWindow.layoutIfNeeded()
            
            let padding:CGFloat = initialYPos == 0 ? 65 : 10 // starting position
            initialYPos += padding+totolHeight
            topAnchor.constant = initialYPos
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                keyWindow.layoutIfNeeded()
            }, completion: { (bool) in
                topAnchor.constant = 0
                UIView.animate(withDuration: 0.4, delay: 3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                    keyWindow.layoutIfNeeded()
                }, completion: { (bool) in
                    if let lastToastShown = lastToastLabelReference,labelForMessage == lastToastShown
                    {
                        lastToastLabelReference = nil
                    }
                    initialYPos -= (padding+totolHeight)
                    toastContainerView.removeFromSuperview()
                })
            })
        }
    }
}


extension UIApplication{
    static var hasTopNotch: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
}

extension UIImage {
    var isPortrait:  Bool    { return size.height > size.width }
    var isLandscape: Bool    { return size.width > size.height }
    var breadth:     CGFloat { return min(size.width, size.height) }
    var breadthSize: CGSize  { return CGSize(width: breadth, height: breadth) }
    var breadthRect: CGRect  { return CGRect(origin: .zero, size: breadthSize) }
    var circleMasked: UIImage? {
        UIGraphicsBeginImageContextWithOptions(breadthSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(x: isLandscape ? floor((size.width - size.height) / 2) : 0, y: isPortrait  ? floor((size.height - size.width) / 2) : 0), size: breadthSize)) else { return nil }
        UIBezierPath(ovalIn: breadthRect).addClip()
        UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation).draw(in: breadthRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
