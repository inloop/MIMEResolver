# MIMEResolver
µ framework for resolving MIME type from Data objects.

* [Usage](#usage)
* [Supported MIME types](#supported-mime-types)
* [Requirements](#requirements)
* [Installation](#installation)
* [Support](#support)
* [Contributing](#contributing)
* [License](#license)

## Usage

```swift
// Import module
import MIMEResolver

// create MIMEResolver instance
let resolver = MIMEResolver()

// register types that you are interested in
resolver.register(mimeType: Gif.self)
resolver.register(mimeType: Png.self)

// resolve MIME type
let mime = resolver.resolve(data) 

// do something
print(mime.signature)
print(mime.contentType)
print(mime.validExtensions)

if mime is Gif.Type {
  playGif(from: data)
}

```

## Supported MIME Types
- [x] `image/x-ms-bmp`
- [x] `image/gif`
- [x] `image/jpeg`
- [x] `image/png`

## Requirements
- iOS | watchOS | tvOS | macOS
- Xcode 8+
- Swift 3

## Installation
### Using [Carthage](https://github.com/Carthage/Carthage)
Specify `MIMEResolver` repo in your `Cartfile`:

```ogdl
github "inloop/MIMEResolver"
```
Run `carthage update --platform [your platform of choice]` 


## Support

Please [open an issue](https://github.com/fraction/readme-boilerplate/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).

## License

Copyright (c) Inloop, s.r.o.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

