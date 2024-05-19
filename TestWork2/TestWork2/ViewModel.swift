//
//  ViewModel.swift
//  TestWork2
//
//  Created by Aynur Nasybullin on 19.05.2024.
//

import SwiftUI
import Combine

final class ViewModel: ObservableObject {
    @Published var model: MediaResponseDto = .init(media: [])
    
    private var cancellables = Set<AnyCancellable>()
    
    func updateData() {
        getData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] responseDto in
                self?.model = responseDto
            }
            .store(in: &cancellables)
    }
    
    private func getImages(imageUrl: String) -> AnyPublisher<Data, NetworkError> {
        guard let url = URL(string: imageUrl) else {
            print("Invalid URL")
            return Fail(error: NetworkError.invalidUrl)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap { data, response in
                data
            }
            .mapError { error -> NetworkError in
                NetworkError.unknown
            }
            .eraseToAnyPublisher()
    }
    
    private func getData() -> AnyPublisher<MediaResponseDto, NetworkError> {
        guard let url = URL(string: "https://wall.appthe.club/") else {
            print("Invalid URL")
            return Fail(error: NetworkError.invalidUrl)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap { data, response in
                data
            }
            .decode(type: MediaResponseDto.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                NetworkError.unknown
            }
            .eraseToAnyPublisher()
    }
}
