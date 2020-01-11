//
//  ANLiveHeaderView.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit
import FSPagerView
class ANLiveHeaderView: UIView {
    
    var dataArray:[ANLiveIconModel]? {
        didSet{
            var arr:[(String,String)] = Array()
            for item in self.dataArray! {
                arr.append((item.coverPath!, item.title!))
            }
            self.iconsView.dataArray = arr
        }
    }
    
    
    var bananerArray:[ANLiveBananerModel]? {
        didSet{
            self.pageView.reloadData()
        }
    }
    
    var rankArray:[ANLiveRankModel]? {
          didSet{
              self.rankPageView.reloadData()
          }
      }
    
    
    lazy var iconsView:ANIconsView = ANIconsView()
    
    lazy var pageView:FSPagerView = {
        let view = FSPagerView()
        view.automaticSlidingInterval = 3
        view.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        view.dataSource = self
        view.delegate = self
        view.itemSize = CGSize.init(width: YYScreenWidth, height: (YYScreenWidth) * 300/1200)
        
        return view
    }()
    
    lazy var rankPageView:FSPagerView = {
        let view = FSPagerView()
        view.automaticSlidingInterval = 3
        view.register(ANRankCell.self, forCellWithReuseIdentifier: "ANRankCell")
        view.dataSource = self
        view.delegate = self
        view.itemSize = CGSize.init(width: YYScreenWidth, height:40)
        view.backgroundColor = .white
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
        self.backgroundColor = FooterViewColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView()  {
        self.addSubview(iconsView)
        iconsView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(80)
        }
        
        self.addSubview(pageView)
        pageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(80)
            make.height.equalTo(bananerHeight())
        }
        self.addSubview(rankPageView)
        rankPageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-2)
            make.height.equalTo(40)
        }
        
        
    }
    
    func bananerHeight() -> CGFloat {
        return (YYScreenWidth) * 300/1200
    }
    
}

extension ANLiveHeaderView : FSPagerViewDelegate,FSPagerViewDataSource{
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        if pagerView == self.pageView {
           return self.bananerArray?.count ?? 0
        }
        
        return self.rankArray?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        
        if pagerView == self.rankPageView {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ANRankCell", at: index) as! ANRankCell
           
           let model = rankArray?[index]
            cell.titleLb.text = model?.dimensionName
            cell.img1.kf.setImage(with: URL.init(string: (model?.ranks?[0].coverSmall!)!))
             cell.img2.kf.setImage(with: URL.init(string: (model?.ranks?[1].coverSmall!)!))
             cell.img3.kf.setImage(with: URL.init(string: (model?.ranks?[2].coverSmall!)!))
           return cell
        }
        
        
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        let model = bananerArray?[index]
        cell.imageView?.kf.setImage(with: URL.init(string: model?.cover ?? ""))
        //  cell.imageView?.kf.setImage(with: URL.init(string: model?.cover! ?? ""))
        return cell
    }
    
    func height() -> CGFloat {
        return 80 + bananerHeight() + 40 + 4
    }
    
}



