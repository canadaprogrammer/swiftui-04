
let connectionOK = true
let connectionSpeed = 31.00
let fileFound = false

enum FileTransferError: Error {
    case noConnection
    case lowBandWidth
    case fileNotFound
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
        return "error: \(error)"
    }
    return "Successful transfer"
}

print(sendFile())
