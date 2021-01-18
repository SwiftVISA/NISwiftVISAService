//
//  MessageListener.swift
//  NISwiftVISAService
//
//  Created by Connor Barnes on 12/29/20.
//

import Foundation
import NISwiftVISAServiceMessages

/// A class that is responsible for listening to messages from other applications.
@objc(XPCMessageListener) class XPCMessageListener: NSObject {
	/// The name of the mach service.
	static let machName = "com.swiftvisa.NISwiftVISAService"
	/// Listens for messages from other applications.
	func listen() {
		let delegate = ServiceDelegate()
		let listener = NSXPCListener(machServiceName: Self.machName)
		listener.delegate = delegate
		listener.resume()
		// Keep listening forever by running a run loop
		RunLoop.main.run()
	}
}

/// A class that is a delegate for the XPC service.
@objc(ServiceDelegate) class ServiceDelegate: NSObject, NSXPCListenerDelegate {
	func listener(
		_ listener: NSXPCListener,
		shouldAcceptNewConnection newConnection: NSXPCConnection
	) -> Bool {
		let exportedObject = MessageProcessor()
		newConnection.exportedInterface = NSXPCInterface(with: VISAXPCProtocol.self)
		newConnection.exportedObject = exportedObject
		newConnection.resume()
		// All connections are accepted
		return true
	}
}
