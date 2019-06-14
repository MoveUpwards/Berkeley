//
//  ClientIOHandler.swift
//  Berkeley
//
//  Created by Move Upwards on 14/06/2019.
//  Copyright © 2019 Move Upwards. All rights reserved.
//

// Include Foundation
@_exported import Foundation
import NIO

internal final class ClientIOHandler: ChannelInboundHandler {
    internal typealias InboundIn = ByteBuffer
    internal typealias OutboundOut = ByteBuffer

    private var readBlock: (([UInt8]) -> Void)?

    internal init(_ readBlock: (([UInt8]) -> Void)? = nil) {
        self.readBlock = readBlock
    }

    internal func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        var buffer = unwrapInboundIn(data)

        if let received = buffer.readBytes(length: buffer.readableBytes) {
            readBlock?(received)
        }
    }

    internal func errorCaught(context: ChannelHandlerContext, error: Error) {
        print("[Berkeley] \(error.localizedDescription)")
        context.close(promise: nil)
    }
}
