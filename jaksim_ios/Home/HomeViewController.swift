//
//  ViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //***개수 고정하고 스크롤 잠궈야함
    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    @IBOutlet weak var recommendedMeetingListCollectionView: UICollectionView!
    
    @IBOutlet weak var sayingOfTodayLabel: UILabel!
    @IBOutlet weak var sayingOfToday: UILabel!
    @IBOutlet weak var sayingOfTodayView: UIView!
    
    @IBOutlet weak var recommendedMeetingLabel: UILabel!
    @IBOutlet weak var recommendedMeetingButton: UIButton!
    
    @IBOutlet weak var introductionButton: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    
    var meetingList: [String] =
        ["참여모임1", "참여모임2", "참여모임3", "참여모임4", "참여모임5", "참여모임6"]
    var categoryList: [String] =
        ["미라클모닝", "공부", "시험", "글쓰기", "건강", "독서", "다이어트", "달리기"]
    var categoryImage: [String] =
    ["test_icon_miraclemorning", "test_icon_study", "test_icon_writing", "test_icon_book", "test_icon_diet", "test_icon_exam", "test_icon_health", "test_icon_running"]
    var recommendedMeetingList: [String] =
        ["추천모임1", "추천모임2", "추천모임3", "추천모임4", "추천모임5", "추천모임6"]
    var recommendedMeetingImage: [String] =
        ["test_recommendedMeetingimg1", "test_recommendedMeetingimg2", "test_recommendedMeetingimg3", "test_recommendedMeetingimg4", "test_recommendedMeetingimg5", "test_recommendedMeetingimg6" ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sayingOfToday.layer.shadowColor = UIColor.black.cgColor
        sayingOfToday.layer.shadowRadius = 5
        sayingOfToday.layer.masksToBounds = false
        sayingOfToday.layer.shadowOpacity = 0.1
        
        meetingListCollectionView.dataSource = self
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: K.Id.meetingListCollectionViewCellId, bundle: nil), forCellWithReuseIdentifier: K.Id.meetingListCollectionViewCellId)
        
        sayingOfTodayLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        sayingOfTodayLabel.font = UIFont(name: K.Font.font_Pretendard_SemiBold, size: 14)
    
        
        sayingOfToday.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
        sayingOfToday.font = UIFont(name: K.Font.font_SCDream_Regular, size: 16)
        sayingOfToday.numberOfLines = 0
        
        sayingOfTodayView.layer.cornerRadius = 12
        sayingOfTodayView.layer.shadowOpacity = 0.08
        sayingOfTodayView.layer.shadowOffset = CGSize(width: 0, height: 0)
        sayingOfTodayView.layer.shadowRadius = 12
        sayingOfTodayView.layer.masksToBounds = false

        
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.delegate = self
        categoryListCollectionView.register(UINib(nibName: K.Id.categoryListCollectionViewCellId, bundle: nil), forCellWithReuseIdentifier: K.Id.categoryListCollectionViewCellId)
        
        recommendedMeetingLabel.font = UIFont(name: K.Font.font_Pretendard_SemiBold, size: 16)
        recommendedMeetingLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        recommendedMeetingButton.titleLabel!.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 14)
        recommendedMeetingButton.setTitleColor(UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1), for: .normal) 
        
        recommendedMeetingListCollectionView.dataSource = self
        recommendedMeetingListCollectionView.delegate = self
        recommendedMeetingListCollectionView.register(UINib(nibName: K.Id.recommendedMeetingListCollectionViewCellId, bundle: nil), forCellWithReuseIdentifier: K.Id.recommendedMeetingListCollectionViewCellId)
        
        introductionButton.setTitle("작심 소개", for: .normal)
        introductionButton.layer.cornerRadius = 5
        introductionButton.backgroundColor = UIColor(red: (242/255.0), green: (245/255.0), blue: (255/255.0), alpha: 1.0)
        introductionButton.setTitleColor(UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1), for: .normal)
        introductionButton.titleLabel!.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 14)
        
        faqButton.setTitle("자주 묻는 질문", for: .normal)
        faqButton.layer.cornerRadius = 5
        faqButton.titleLabel?.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 14)
        faqButton.setTitleColor(UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1), for: .normal)
        faqButton.backgroundColor = UIColor(red: (242/255.0), green: (245/255.0), blue: (255/255.0), alpha: 1.0)
    }
}

//MARK:- CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == meetingListCollectionView{
            return meetingList.count
        }
        else if collectionView == categoryListCollectionView{
            return categoryList.count
        }
        else if collectionView == recommendedMeetingListCollectionView{
            return recommendedMeetingList.count
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
        
    }
    
    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == meetingListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Id.meetingListCollectionViewCellId, for: indexPath) as? MeetingListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.goal.text = meetingList[indexPath.row]
            
            return cell
        }
        else if collectionView == categoryListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Id.categoryListCollectionViewCellId, for: indexPath) as? CategoryListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.name.text = categoryList[indexPath.row]
            cell.imageView.image = UIImage(named: categoryImage[indexPath.row])
            
            return cell
        }
        else if collectionView == recommendedMeetingListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Id.recommendedMeetingListCollectionViewCellId, for: indexPath) as? RecommendedMeetingListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.introduction.text = recommendedMeetingList[indexPath.row]
            cell.imageView.image = UIImage(named: recommendedMeetingImage[indexPath.row])
            cell.personNumber.text = "11"
            
            return cell
        }
        else {
            print("CollectionView Delegate error - 셀 뷰")
            return UICollectionViewCell()
        }
        
        
    }
    
    // 터치업 액션
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
    //        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
    //        let item = trackManager.tracks[indexPath.item]
    //        playerVC.simplePlayer.replaceCurrentItem(with: item)
    //        present(playerVC, animated: true, completion: nil)
    //    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == meetingListCollectionView{
            let width: CGFloat = 335
            let height: CGFloat = 180
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == categoryListCollectionView{
            let width: CGFloat = 69
            let height: CGFloat = 97
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == recommendedMeetingListCollectionView{
            let width: CGFloat = 150
            let height: CGFloat = 220
            
            return CGSize(width: width, height: height)
        }
        else {
            print("CollectionView Delegate error - 셀 사이즈")
            return CGSize(width: 0, height: 0)
        }
    }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == meetingListCollectionView{
            return 6
        }
        else if collectionView == categoryListCollectionView{
            return 16/2
        }
        else if collectionView == recommendedMeetingListCollectionView{
            return 20/2
        }
        else {
            print("CollectionView Delegate error - 셀 상하 간격")
            return 0
        }
    }
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == meetingListCollectionView{
            return 12/2
        }
        else if collectionView == categoryListCollectionView{
            return 20/2
        }
        else if collectionView == recommendedMeetingListCollectionView{
            return 12/2
        }
        else {
            print("CollectionCiew Delegate error - 셀 좌우 간격  ")
            return 0
        }
    }
}
