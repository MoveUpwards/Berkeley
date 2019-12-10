//
//  Berkeley.swift
//  Berkeley
//
//  Created by Move Upwards on 14 juin 2019.
//  Copyright © 2019 Move Upwards. All rights reserved.
//

// Include Foundation
@_exported import Foundation
import Network
import NIO

open class Berkeley {
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private var channel: Channel?
    private lazy var clientHandler: ClientIOHandler = {
        return ClientIOHandler(read)
    }()

    public init() { }

    public func start(host: String, port: Int, timeout: Int64 = 10, result: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            do {
                guard let strongSelf = self else {
                    return
                }

                strongSelf.channel = try strongSelf.bootstrap
                    .connectTimeout(TimeAmount.seconds(timeout))
                    .connect(host: host, port: port).wait()

                DispatchQueue.main.async {
                    result(.success(())) // If after the closeFutur, it won't be call sadly.
                }
                try strongSelf.channel?.closeFuture.wait()
            } catch let error {
                result(.failure(error))
                self?.stop()
            }
        }
    }

    public func stop() {
        group.shutdownGracefully(queue: DispatchQueue.global(qos: .utility)) { error in
            if let error = error {
                print("[Berkeley] Error shutting down \(error.localizedDescription)")
            }

            print("[Berkeley] Client connection closed")
        }
    }

    open func read(data: [UInt8]) {
        // OVERRIDE ME
    }

    public func rawWrite(data: [UInt8]) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard var buffer = self?.channel?.allocator.buffer(capacity: data.count) else {
                return
            }

            buffer.writeBytes(Data(data))
            do {
                try self?.channel?.writeAndFlush(buffer).wait()
            } catch let error {
                self?.stop()
                print("[Berkeley] Error write bytes \(error.localizedDescription)")
            }
        }
    }

    private var bootstrap: ClientBootstrap {
        return ClientBootstrap(group: group)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelInitializer { [weak self] channel in
                channel.pipeline.addHandler(self?.clientHandler ?? ClientIOHandler())
        }
    }
}
