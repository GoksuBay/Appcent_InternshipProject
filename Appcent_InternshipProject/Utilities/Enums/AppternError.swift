//
//  AppternError.swift
//  Appcent_InternshipProject
//
//  Created by Yusuf Ali Cezik on 16.07.2021.
//

import Foundation

enum AppternError: Error {
    case requestError
    case decodeError
    case defaultError(Error)
    
    var errorMessage: String {
        switch self {
            case .requestError:
                return "Hata oluştu. Lütfen girdiğiniz bilgileri kontrol edin."
            case .decodeError:
                return "Veriler okunurken bir hata oluştu."
            default:
                return "Hata oluştu. Tekrar deneyin."
        }
    }
}
