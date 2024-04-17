import Foundation

let connectionOK = true
let connectionSpeed = 31.00
let fileFound = false

// 다른 파일로 선언
// Localizable.string(Korean)
// "noConnection" = "연결이 없습니다."
// "lowBandWidth" = "인터넷 속도가 느립니다"
// "fileNotFound" = "파일을 찾을 수 없습니다."
enum FileTransferError: Error, LocalizedError {
    case noConnection
    case lowBandWidth
    case fileNotFound
    
    // 소비자에게 에러 메세지를 진철하게 전달하고 싶을 때 LocalizedError 사용
    var errorDescription: String? {
        switch self {
        case .noConnection:
            return NSLocalizedString("noConnection", comment: "No Connection")
        case .lowBandWidth:
            return NSLocalizedString("lowBandWidth", comment: "Speed too low")
        case .fileNotFound:
            return NSLocalizedString("fileNotFound", comment: "File Not Found")
        }
    }
}

func fileTransfer() throws {
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandWidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

func sendFile() -> String {
    defer {
        // 파일 닫기 등 종료 준비
        print("end of sendfile")
    }
    do {
        try fileTransfer()
//    } catch FileTransferError.noConnection {
//        return "No Connection"
//    } catch FileTransferError.lowBandWidth {
//        return "Speed too low"
    } catch FileTransferError.noConnection, FileTransferError.lowBandWidth {
        return "Connection Problems"
//    } catch FileTransferError.fileNotFound {
//        return "File Not Found"
    } catch let error {
        return "error: \(error.localizedDescription)"
    }
    return "Successful transfer"
}

print(sendFile())
