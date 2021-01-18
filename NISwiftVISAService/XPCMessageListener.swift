//
//  MessageListener.swift
//  NISwiftVISAService
//
//  Created by Connor Barnes on 12/29/20.
//

import Foundation
import NISwiftVISAServiceMessages

class XPCMessageListener {
	static let machName = "com.swiftvisa.NISwiftVISAService"
	
	func listen() {
		let delegate = ServiceDelegate()
		let listener = NSXPCListener(machServiceName: Self.machName)
		listener.delegate = delegate
		listener.resume()
		
		RunLoop.main.run()
	}
}

@objc(ServiceDelegate) class ServiceDelegate: NSObject, NSXPCListenerDelegate {
	func listener(
		_ listener: NSXPCListener,
		shouldAcceptNewConnection newConnection: NSXPCConnection
	) -> Bool {
		let exportedObject = XPCMessageListener()
		newConnection.exportedInterface = NSXPCInterface(with: VISAXPCProtocol.self)
		newConnection.exportedObject = exportedObject
		newConnection.resume()
		return true
	}
}
