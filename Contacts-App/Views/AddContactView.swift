//
//  AddContactView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

class AddContactView: UIView {
    
    lazy var someHeight = CGSize(width: self.frame.size.width, height: self.frame.size.height + 300)
    
    override func layoutSubviews() {
        
    }
    
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .purple
        scrollView.frame = self.bounds
        scrollView.contentSize = someHeight
        return scrollView
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.frame.size = someHeight
        return view
    }()
    
    public lazy var sampleView1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    public lazy var sampleView2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    public lazy var sampleView3: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupScrollViewConstraints()
        setupContainerViewConstraints()
        setupSampleView1Constraints()
        setupSampleView2Constraints()
        setupSampleView3Constraints()
    }
    
    private func setupScrollViewConstraints() {
       addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupContainerViewConstraints() {
        scrollView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 300)
        ])
    }
    
    private func setupSampleView1Constraints() {
        containerView.addSubview(sampleView1)
        
        sampleView1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            sampleView1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            sampleView1.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3),
            sampleView1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            sampleView1.heightAnchor.constraint(equalToConstant: 400)
        
        ])
    }
    
    private func setupSampleView2Constraints() {
        containerView.addSubview(sampleView2)
        
        sampleView2.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            sampleView2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            sampleView2.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3),
            sampleView2.topAnchor.constraint(equalTo: sampleView1.bottomAnchor, constant: 8),
            sampleView2.heightAnchor.constraint(equalToConstant: 400)
        
        ])
    }
    
    private func setupSampleView3Constraints() {
        containerView.addSubview(sampleView3)
        
        sampleView3.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            sampleView3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            sampleView3.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3),
            sampleView3.topAnchor.constraint(equalTo: sampleView2.bottomAnchor, constant: 8),
            sampleView3.heightAnchor.constraint(equalToConstant: 400),
            sampleView3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        
        ])
    }
    
}
