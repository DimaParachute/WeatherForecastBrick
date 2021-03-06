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
        self.backgroundColor = Styles.Colors.infoBlockViewBackgroundColor
        self.layer.cornerRadius = Styles.Layout.InfoBlock.defaultCornerRadius
        self.layer.shadowColor = Styles.Colors.infoBlockShadowColor
        self.layer.shadowOffset = Styles.Layout.infoBlockShadowOffset
        self.layer.shadowRadius = Styles.Shadow.defaultShadowRadius
        self.snp.makeConstraints { make in
            make.width.equalTo(Styles.Layout.InfoBlock.width)
            make.height.equalTo(Styles.Layout.InfoBlock.height)
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
        titleLabel.font = Styles.Fonts.infoBlockTitleFont
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.title)
        }
    }
    
    private func wetConditionLabelInitialize() {
        let wetConditionLabel = UILabel()
        wetConditionLabel.text = DataSource.BrickState.raining.rawValue
        wetConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(wetConditionLabel)
        wetConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.wet)
        }
    }
    
    private func dryConditionLabelInitialize() {
        let dryConditionLabel = UILabel()
        dryConditionLabel.text = DataSource.BrickState.sunny.rawValue
        dryConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(dryConditionLabel)
        dryConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.dry)
        }
    }
    
    private func hardToSeeConditionLabelInitialize() {
        let hardToSeeConditionLabel = UILabel()
        hardToSeeConditionLabel.text = DataSource.BrickState.fog.rawValue
        hardToSeeConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(hardToSeeConditionLabel)
        hardToSeeConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.fog)
        }
    }
    
    private func cracksConditionLabelInitialize() {
        let cracksConditionLabel = UILabel()
        cracksConditionLabel.text = DataSource.BrickState.hot.rawValue
        cracksConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(cracksConditionLabel)
        cracksConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.cracks)
        }
    }
    
    private func snowConditionLabelInitialize() {
        let snowConditionLabel = UILabel()
        snowConditionLabel.text = DataSource.BrickState.snow.rawValue
        snowConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(snowConditionLabel)
        snowConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.snow)
        }
    }
    
    private func swingingConditionLabelInitialize() {
        let swingingConditionLabel = UILabel()
        swingingConditionLabel.text = DataSource.BrickState.windy.rawValue
        swingingConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(swingingConditionLabel)
        swingingConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.swinging)
        }
    }
    
    private func goneConditionLabelInitialize() {
        let goneConditionLabel = UILabel()
        goneConditionLabel.text = DataSource.BrickState.undefined.rawValue
        goneConditionLabel.font = Styles.Fonts.conditionLabelsFont
        self.addSubview(goneConditionLabel)
        goneConditionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Styles.Layout.Constraints.Left.defaultValue())
            make.top.equalToSuperview().inset(Styles.Layout.Constraints.Top.gone)
        }
    }
    
    let infoBlockHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hide", for: .normal)
        button.setTitleColor(Styles.Colors.infoBlockHideButtonTextColor, for: .normal)
        button.titleLabel?.font = Styles.Fonts.infoBlockHideButtonTitleFont
        button.layer.borderColor = Styles.Colors.infoBlockHideButtonBorderColor
        button.layer.borderWidth = Styles.Layout.InfoBlock.buttonBorderWidth
        button.layer.cornerRadius = Styles.Layout.InfoBlock.defaultCornerRadius
        button.backgroundColor = Styles.Colors.infoBlockHideButtonBackgroundColor
        return button
    }()
    
    private func makeButtonConstraints() {
        self.addSubview(infoBlockHideButton)
        infoBlockHideButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Styles.Layout.Constraints.Bottom.hideButton)
            make.height.equalTo(Styles.Layout.InfoBlock.buttonHeight)
            make.width.equalTo(Styles.Layout.InfoBlock.buttonWidth)
        }
    }
}
