//
//  InfoBlockView.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 13.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class InfoBlockView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        configureInfoBlockView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInfoBlockView() {
        self.backgroundColor = UIColor(red: 255 / 255, green: 154 / 255, blue: 96 / 255, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 15
        self.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
        titleInitialize()
        wetConditionLabelInitialize()
        dryConditionLabelInitialize()
        hardToSeeConditionLabelInitialize()
        cracksConditionLabelInitialize()
        snowConditionLabelInitialize()
        swingingConditionLabelInitialize()
        goneConditionLabelInitialize()
        makeButtonConstraints()
    }
    
    private func titleInitialize() {
        let titleLabel = UILabel()
        titleLabel.text = "INFO"
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(15)
        }
    }
    
    private func wetConditionLabelInitialize() {
        let wetConditionLabel = UILabel()
        wetConditionLabel.text = DataSource.BrickState.raining.rawValue
        wetConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(wetConditionLabel)
        wetConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(60)
        }
    }
    
    private func dryConditionLabelInitialize() {
        let dryConditionLabel = UILabel()
        dryConditionLabel.text = DataSource.BrickState.sunny.rawValue
        dryConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(dryConditionLabel)
        dryConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(90)
        }
    }
    
    private func hardToSeeConditionLabelInitialize() {
        let hardToSeeConditionLabel = UILabel()
        hardToSeeConditionLabel.text = DataSource.BrickState.fog.rawValue
        hardToSeeConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(hardToSeeConditionLabel)
        hardToSeeConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(120)
        }
    }
    
    private func cracksConditionLabelInitialize() {
        let cracksConditionLabel = UILabel()
        cracksConditionLabel.text = DataSource.BrickState.hot.rawValue
        cracksConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(cracksConditionLabel)
        cracksConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(150)
        }
    }
    
    private func snowConditionLabelInitialize() {
        let snowConditionLabel = UILabel()
        snowConditionLabel.text = DataSource.BrickState.snow.rawValue
        snowConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(snowConditionLabel)
        snowConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(180)
        }
    }
    
    private func swingingConditionLabelInitialize() {
        let swingingConditionLabel = UILabel()
        swingingConditionLabel.text = DataSource.BrickState.windy.rawValue
        swingingConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(swingingConditionLabel)
        swingingConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(210)
        }
    }
    
    private func goneConditionLabelInitialize() {
        let goneConditionLabel = UILabel()
        goneConditionLabel.text = DataSource.BrickState.undefined.rawValue
        goneConditionLabel.font = .systemFont(ofSize: Styles.Fonts.conditionLabelsDefaultSize)
        self.addSubview(goneConditionLabel)
        goneConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layot.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(240)
        }
    }
    
    let infoBlockHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hide", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = Styles.Layot.HideButton.buttonBorderWidth
        button.layer.cornerRadius = Styles.Layot.HideButton.buttonCornerRadius
        button.backgroundColor = .clear
        return button
    }()
    
    private func makeButtonConstraints() {
        self.addSubview(infoBlockHideButton)
        infoBlockHideButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(31)
            make.width.equalTo(115)
        }
    }
}
