# CryptoMVVMRx - iOS (MVVM Architecture & RxSwift)

An advanced cryptocurrency tracker application built using **Swift** and **UIKit**. This project serves as a production-ready implementation of the **MVVM (Model-View-ViewModel)** design pattern combined with reactive data binding pipelines via **RxSwift** and **RxCocoa**.

## 🚀 Features & Technical Implementation

*   **Clean MVVM Architecture:** Strictly separated into decoupled modules—`Model`, `View`, `ViewModel`, and `Service`—to eliminate heavy view controllers and ensure maximum testability.
*   **Reactive UI Binding (RxSwift & RxCocoa):** Asynchronous application states are modeled entirely via streams. Engineered distinct `PublishSubject` pipelines within `CryptoViewModel` to observe live token data arrays (`cryptos`), screen loading toggles (`loading`), and explicit messaging pipelines (`error`).
*   **Explicit Error Pipelines:** Created a specialized `CryptoError` enum supporting localized debugging contexts (`serverError` and `parsingError`).
*   **Custom Network Layer (`Webservice`):** Developed an asynchronous URL dispatcher using `URLSession.shared.dataTask`. Network responses are encapsulated safely within Swift's standard `Result` generics before pushing data events down the reactive stream.
*   **Decodable JSON Parsing:** Leveraged native `JSONDecoder` mappings to cleanly ingest, unpack, and validate third-party dynamic web configurations directly into strongly-typed local schemas.
*   **Safe Resource Management:** Enforced explicit subscription lifecycle tracking using `DisposeBag` instances to completely safeguard the system against background retain cycles and memory leaks.

## 🛠️ Tech Stack & Concepts Covered

*   Language: **Swift**
*   Framework: **UIKit**
*   Reactive Components: **RxSwift**, **RxCocoa** (PublishSubject, DisposeBag)
*   Architecture: **MVVM (Model-View-ViewModel)**
*   Networking & Data: **URLSession**, **Result Types**, **Codable (JSONDecoder)**
