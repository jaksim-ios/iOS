//
//  RateViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/25.
//

import Foundation
import RxSwift

class MyRateViewModel {
    let disposeBag = DisposeBag()
    var rateSubject = PublishSubject<MyRate>()
    var url = ""
    
    func updateMeetingId(meetingId: String) {
        self.url = "https://jaksim.app/api/meeting/\(meetingId)/my/rate"
    }
    
    func fetchProgress() {
        MyRecordService.getRate(from: url)
            .subscribe(onNext: {
                self.rateSubject.onNext(MyRate($0))
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
