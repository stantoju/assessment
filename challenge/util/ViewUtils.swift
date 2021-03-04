//
//  ViewUtils.swift
//  challenge
//
//  Created by Toju on 2/28/21.
//

import UIKit
import WebKit

extension UIView {
    
    // Add SubViews
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
    
     func makeCircleWith(size: CGSize, backgroundColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(backgroundColor.cgColor)
        context?.setStrokeColor(UIColor.clear.cgColor)
        let bounds = CGRect(origin: .zero, size: size)
        context?.addEllipse(in: bounds)
        context?.drawPath(using: .fill)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // Generate Textfield
    func generateTextField(title: String) -> UITextField {
        let tv = UITextField()
        tv.placeholder = title
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        tv.leftView = paddingView
        tv.leftViewMode = .always
        return tv
    }

    
    // Generate TextView
    func generateTextView(content: String, size: CGFloat) -> UITextView {
        let textView = UITextView()
        textView.text = content
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }
    
    //Generate Collectionview
    func generateCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }
    
    
    //Generate Collectionview
    func generateCollectionView2() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }
    
    // Generate Label
    func generateLabel(title: String, size: CGFloat) -> UILabel {
        let lb = UILabel()
        lb.text = title
        lb.font = UIFont(name: "Itim", size: size)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
    
    
    // Generate Label with Attributed text
    func generateLabelAttributed(attributedString: NSMutableAttributedString, size: CGFloat) -> UILabel {
        let lb = UILabel()
        lb.attributedText = attributedString
        lb.font = UIFont.systemFont(ofSize: size)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
    
    // Generate Button
    func generateButton (title: String, bgcolor: UIColor?, txtColor: UIColor?) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: UIControl.State.normal)
        if(bgcolor != nil){btn.backgroundColor = bgcolor}
        btn.setTitleColor(txtColor, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Itim", size: 18)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    // Generate Image Button
    func generateImageButton (image: String) -> UIButton {
        let image = UIImage(named: image)
        let btn   = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    // Generate Image
    func generateImage (src: String) -> UIImageView {
        let iv = UIImageView(image: UIImage(named: src))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv;
    }
    
    
    // Generate Image
    func generateSystemImage (src: String) -> UIImageView {
        let iv = UIImageView(image: UIImage(systemName: src))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv;
    }
    
    
    // Generate UIView
    func generateView () -> UIView {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv;
    }
    
    // Generate ProgressView
    func generateProgressView () -> UIProgressView {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv;
    }
    
    // Generate Progressbar
    func generateProgressbar(progress: Float, trackColor: UIColor, tintColor: UIColor) -> UIProgressView {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.setProgress(progress, animated: true)
        pv.trackTintColor = trackColor
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.tintColor = tintColor
        return pv
    }
    
    // Generate ScrollView
    func generateScrollView () -> UIScrollView {
        let pv = UIScrollView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv;
    }
    
    
    // Generate WebView
    func generateWebView () -> WKWebView {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv;
    }

    // Generate AtributedLabel
    func generateAtributtedLabel (title: String, content: String) -> UILabel {
        let ul = UILabel()
        ul.translatesAutoresizingMaskIntoConstraints = false
        ul.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "\(title) \n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: content, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        return ul;
    }
    
    // Generate ActivitySpinner
    func generateActivityIndicator() -> UIActivityIndicatorView{
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.medium
        spinner.startAnimating()
        return spinner
    }
    
    
    
    // Generate Blur Effect
    func generateBlurEffect () -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // Border Radius
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}




extension UICollectionViewCell {
    func gridCell() {
        self.layer.cornerRadius = 13
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0, height: 0.1)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension UIViewController {
    func setupNavBar(title: String){
        navigationItem.title = title
        navigationController?.navigationBar.backgroundColor = UIColor(named: "color-primary")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(named: "color-primary")
    }
    
    
    func setupNavBar2(title: String){
        navigationItem.title = title
        navigationController?.navigationBar.backgroundColor = UIColor(named: "color-primary")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(named: "color-primary")
    }
}

extension UIActivityIndicatorView {
    // Stop Indicator
    func stopIndicator(){
        self.stopAnimating()
        self.isHidden = true
    }
}

extension UITextField {
    
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        let height = 0.75
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
}

extension UIViewController {
    
    var appDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

var sceneDelegate: SceneDelegate? {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let delegate = windowScene.delegate as? SceneDelegate else { return nil }
     return delegate
}
    
    var window: UIWindow? {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                       return window
        }
    
    func switchRootVC(vc: UIViewController) {
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
}



