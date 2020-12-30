//
//  Processing.swift
//  NISwiftVISAService
//
//  Created by Connor Barnes on 12/29/20.
//

import NISwiftVISAServiceMessages


extension Message {
	func process() -> ReturnMessage {
		switch self {
		case .viOpenMessage(var message):
			let status = viOpen(message.session, message.resourceName, message.mode, message.timeout, &message.vi)
			return Message.viOpenMessage(message).returnMessage(withStatus: status)
		case .viCloseMessage(let message):
			let status = viClose(message.vi)
			return Message.viCloseMessage(message).returnMessage(withStatus: status)
		case .viOpenDefaultRMMessage(var message):
			let status = viOpenDefaultRM(&message.vi)
			return Message.viOpenDefaultRMMessage(message).returnMessage(withStatus: status)
		}
	}
}

