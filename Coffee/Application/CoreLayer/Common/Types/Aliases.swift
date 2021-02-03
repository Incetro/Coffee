//
//  Aliases.swift
//  SwiftyKit
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

// MARK: - Aliases

/// Request/Response parameters
typealias Parameters = [String: Any]

/// Request/Response headers
typealias Headers = [String: String]

/// Base identifiers type
typealias ID = String

/// Simple swift result block
typealias ResultBlock<T> = (Result<T, Error>) -> Void

/// Block with some error
typealias ErrorBlock = (Error) -> Void

/// Block with some errors
typealias ErrorsBlock = ([Error]) -> Void

/// Block with some error message
typealias ErrorMessageBlock = (String) -> Void

/// Services success block for `ObtainAll` operation
typealias ServiceObtainAllSuccessBlock<T> = ([T]) -> Void

/// Services failure block for `ObtainAll` operation
typealias ServiceObtainAllFailureBlock = ErrorBlock

/// Services success block for `Obtain` operation
typealias ServiceObtainSuccessBlock<T> = (T) -> Void

/// Services failure block for `Obtain` operation
typealias ServiceObtainFailureBlock = ErrorBlock

/// Services success block for `Update` operation
typealias ServiceUpdateSuccessBlock<T> = (T) -> Void

/// Services failure block for `Update` operation
typealias ServiceUpdateFailureBlock = ErrorBlock

/// Services success block for `Create` operation
typealias ServiceCreateSuccessBlock<T> = (T) -> Void

/// Services failure block for `Create` operation
typealias ServiceCreateFailureBlock = ErrorBlock

/// Services success block for `Remove` operation
typealias ServiceRemoveSuccessBlock = () -> Void

/// Services failure block for `Remove` operation
typealias ServiceRemoveFailureBlock = ErrorBlock

/// Simple void closure alias
typealias VoidClosure = () -> Void
