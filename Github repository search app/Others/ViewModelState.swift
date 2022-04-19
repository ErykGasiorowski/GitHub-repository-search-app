//
//  ViewModelState.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 12/04/2022.
//

import Foundation

enum ViewModelState: Equatable {
  case loading
  case error(String)
  case idle
}
