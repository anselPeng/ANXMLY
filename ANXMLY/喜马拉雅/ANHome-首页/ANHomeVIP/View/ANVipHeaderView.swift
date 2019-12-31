//
//  ANVipHeaderView.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/31.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import FSPagerView
class ANVipHeaderView: UIView {
        var dataArray:[ANVipFocusImagesModel]?{
            didSet{
                self.pageView.reloadData()
            }
        }
        lazy var pageView:FSPagerView = {
            let view = FSPagerView()
            view.automaticSlidingInterval = 3
            view.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            view.dataSource = self
            view.delegate = self
            view.interitemSpacing = 15.0
            view.transformer = FSPagerViewTransformer.init(type: .linear)
            view.itemSize = CGSize.init(width: YYScreenWidth-30, height: (YYScreenWidth - 30) * 480/1200)
    
            return view
        }()
        
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
        
    
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func creatSubView() {
            
            self.addSubview(pageView)
            pageView.snp.makeConstraints { (make) in
                make.edges.equalTo(0)
            }
            
    }
        
}


    extension ANVipHeaderView : FSPagerViewDelegate,FSPagerViewDataSource{
        
        func numberOfItems(in pagerView: FSPagerView) -> Int {
            return self.dataArray?.count ?? 0
        }
        
        func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            
            let model = dataArray?[index]
            
            cell.imageView?.kf.setImage(with: URL.init(string: model?.cover! ?? ""))
            return cell
            
        }
}

