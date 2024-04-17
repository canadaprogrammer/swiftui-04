
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
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "No Connection"
    } catch FileTransferError.lowBandWidth {
        return "Speed too low"
    } catch FileTransferError.fileNotFound {
        return "File Not Found"
    } catch {
        return "Unknown error"
    }
    return "Successful transfer"
}

sendFile()
