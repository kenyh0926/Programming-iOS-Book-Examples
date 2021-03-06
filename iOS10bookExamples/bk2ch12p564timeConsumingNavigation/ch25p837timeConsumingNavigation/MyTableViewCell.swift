

import UIKit

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
extension CGSize {
    init(_ width:CGFloat, _ height:CGFloat) {
        self.init(width:width, height:height)
    }
}
extension CGPoint {
    init(_ x:CGFloat, _ y:CGFloat) {
        self.init(x:x, y:y)
    }
}
extension CGVector {
    init (_ dx:CGFloat, _ dy:CGFloat) {
        self.init(dx:dx, dy:dy)
    }
}




class MyTableViewCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            let v = UIActivityIndicatorView(activityIndicatorStyle:.whiteLarge)
            v.color = .yellow
            DispatchQueue.main.async {
                v.backgroundColor = UIColor(white:0.2, alpha:0.6)
            }
            v.layer.cornerRadius = 10
            v.frame = v.frame.insetBy(dx: -10, dy: -10)
            let cf = self.contentView.convert(self.bounds, from:self)
            v.center = CGPoint(cf.midX, cf.midY);
            v.frame = v.frame.integral // ?
            v.tag = 1001
            self.contentView.addSubview(v)
            v.startAnimating()

        } else {
            if let v = self.viewWithTag(1001) {
                v.removeFromSuperview()
            }
        }
        super.setSelected(selected, animated: animated)

    }

}
