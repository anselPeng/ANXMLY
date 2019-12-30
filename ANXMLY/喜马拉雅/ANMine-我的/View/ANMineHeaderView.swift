//
//  ANMineHeaderView.swift
//  ANXMLY
//
//  Created by 彭安忠 on 2019/12/17.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

protocol ANMineHeaderDelegate:NSObjectProtocol {
    func iconBtnClicked(idx:Int);
}

class ANMineHeaderView: UIView {
    
    var delegate : ANMineHeaderDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
        self.backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var icon:UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage.init(named: "tom")
        return icon
    }()
    
    private lazy var nameLb:UILabel = {
        let lb = UILabel()
        lb.text = "汤姆"
        lb.font = UIFont.systemFont(ofSize: 15.0)
        return lb
    }()
    
    private lazy var fansLb:UILabel = {
        let lb = UILabel()
        lb.text = "粉丝:1000    关注:500"
        lb.font = UIFont.systemFont(ofSize: 13.0)
        lb.textColor = .lightGray
        return lb
    }()
    
    private lazy var unLockBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("已听30分钟，满三小时解锁>", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        btn.setTitleColor(.gray, for: .normal)
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 0.5
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 13
        btn.addTarget(self, action: #selector(unLockBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    private  lazy var shopView:UIView = {
        let view = UIView()
        return view;
    }()
    
    private  lazy var line:UIView = {
           let view = UIView()
        view.backgroundColor = .lightGray
           return view;
       }()
    
    private  lazy var vipView:ANMineVipView = {
             let view = ANMineVipView()
             return view;
         }()
    

    func creatSubView(){
        self.addSubview(icon)
        self.icon.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.top.equalTo(10)
            make.left.equalTo(10)
        }
        
        self.addSubview(nameLb)
        self.nameLb.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp_rightMargin).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(25)
            make.top.equalTo(icon).offset(10)
        }
        
        self.addSubview(fansLb)
        self.fansLb.snp.makeConstraints { (make) in
            make.left.equalTo(nameLb)
            make.bottom.equalTo(icon.snp_bottomMargin).offset(-10)
            make.height.equalTo(20)
            make.right.equalTo(0)
        }
        
        self.addSubview(unLockBtn)
        self.unLockBtn.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp_bottomMargin).offset(4)
            make.left.equalTo(icon)
            make.width.equalTo(200)
            make.height.equalTo(26)
        }
        
        self.addSubview(vipView)
        self.vipView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.width.equalTo(100)
            make.height.equalTo(60)
            make.top.equalTo(nameLb.snp_bottomMargin).offset(-5)
        }
        vipView.transform = CGAffineTransform.init(rotationAngle: 3.14/10.0)
        
        
        
        self.addSubview(shopView)
        self.shopView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(unLockBtn.snp_bottomMargin).offset(15)
        }
        
        self.shopView.addSubview(line)
        self.line.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        creatShopSubView()
    }
    

    
    
    func creatShopSubView(){
        let titleArray = ["已购","优惠券","喜点","直播喜钻","我的钱包"]
        let dataArray = ["100","12","28","23","钱包"]
        let width = YYScreenWidth/5.0
        for idx in 0..<5 {
            let frame = CGRect.init(x: CGFloat(idx) * width, y: 5, width: width, height: 85.0)
            let btn = UIButton.init(frame: frame)
            shopView.addSubview(btn)
            if idx == 4{
                btn.setImage(UIImage.init(named: dataArray[idx]), for: .normal)
            }else{
                btn.setTitle(dataArray[idx], for: .normal)
                btn.setTitleColor(.black, for: .normal)
            }
            btn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 40, right: 0)
            btn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 40, right: 0)
            
            btn.tag = idx
            btn.addTarget(self, action: #selector(iconBtnClicked(btn:)), for: .touchUpInside)
            
            let lbFrame = CGRect.init(x: CGFloat(idx) * width, y: 45.0, width: width, height: 30)
            let lb = UILabel.init(frame: lbFrame)
            lb.text = titleArray[idx]
            lb.textColor = .gray
            lb.textAlignment = .center
            lb.font = UIFont.systemFont(ofSize: 13)
            shopView.addSubview(lb)

        }
        
    }
    
    
    func vipViewAnimation() {
        let y = vipView.center.y
        let option:UIView.AnimationOptions = [.autoreverse,.repeat]
        UIView.animate(withDuration: 1, delay: 1, options: option, animations: {
            self.vipView.center.y -= 20
        }) { _ in
            self.vipView.center.y = y
        }
        
    }
    
    func vipViewStopAnimation() {
        self.vipView.layer.removeAllAnimations()
    }
    
    
    
       @objc func iconBtnClicked(btn:UIButton) {
        delegate?.iconBtnClicked(idx: btn.tag)
    }
    
    @objc func unLockBtnClicked() {
        print("已听30分钟，满三小时解锁")
    }
    
}
