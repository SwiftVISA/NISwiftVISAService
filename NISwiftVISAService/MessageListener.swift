//
//  MessageListener.swift
//  NISwiftVISAService
//
//  Created by Connor Barnes on 12/29/20.
//

import Foundation
import NISwiftVISAServiceMessages

private func messageCallback(
	port: CFMessagePort?,
	messageID: Int32,
	data: CFData?,
	info: UnsafeMutableRawPointer?
) -> Unmanaged<CFData>? {
	guard let data = data as Data? else { return nil }
	
	do {
		let message = try JSONDecoder().decode(Message.self, from: data)
		
		let returnMessage = message.process()
		let encodedMessage = try JSONEncoder().encode(returnMessage)
		
		return Unmanaged.passRetained(encodedMessage as CFData)
	} catch {
		return nil
	}
}

class MessageListener {
	static let machName = "com.swiftvisa.NISwiftVISAService"
	
	func listen() {
		let localPort = CFMessagePortCreateLocal(nil,
																						 Self.machName as CFString,
																						 messageCallback(port:messageID:data:info:),
																						 nil,
																						 nil)
		
		let runLoopSource = CFMessagePortCreateRunLoopSource(nil,
																												 localPort,
																												 0)
		
		CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
		CFRunLoopRun()
	}
}
