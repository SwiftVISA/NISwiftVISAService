//
//  Processing.swift
//  NISwiftVISAService
//
//  Created by Connor Barnes on 12/29/20.
//

import Foundation
import NISwiftVISAServiceMessages

/// A class that processes received messages.
@objc(MessageProcessor) class MessageProcessor: NSObject, VISAXPCProtocol {
	func close(
		vi: ViSession,
		withReply reply: @escaping (ViStatus) -> Void
	) {
		let status = viClose(vi)
		reply(status)
	}
	
	func open(
		session: ViSession,
		resourceName: String,
		mode: ViAccessMode,
		timeout: ViUInt32,
		withReply reply: @escaping (ViStatus, ViSession) -> Void
	) {
		var newSession = ViSession()
		let status = viOpen(session, resourceName, mode, timeout, &newSession)
		reply(status, newSession)
	}
	
	func openDefaultRM(
		withReply reply: @escaping (ViStatus, ViSession) -> Void
	) {
		var newSession = ViSession()
		let status = viOpenDefaultRM(&newSession)
		reply(status, newSession)
	}
	
	func read(
		vi: ViSession,
		count: ViUInt32,
		withReply reply: @escaping (ViStatus, Data, ViUInt32) -> Void
	) {
		var returnCount = ViUInt32()
		var buffer = [ViByte](repeating: 0, count: Int(count))
		let status = viRead(vi, &buffer, count, &returnCount)
		reply(status, Data(buffer), returnCount)
	}
	
	func write(
		vi: ViSession,
		data: Data,
		withReply reply: @escaping (ViStatus, ViUInt32) -> Void
	) {
		var returnCount = ViUInt32()
		var buffer = Array<ViByte>(data)
		let status = viWrite(vi, &buffer, ViUInt32(buffer.count), &returnCount)
		reply(status, returnCount)
	}
}
