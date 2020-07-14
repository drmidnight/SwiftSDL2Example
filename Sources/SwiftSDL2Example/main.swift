import SwiftSDL2
SDL.initialize([.video])
SDL.initialize(imageSupport: [.png])
// Initialize subsystems
class SDLExample {
    var renderer: Renderer
    let window: Window

    init(_ title: String = "SDL2") {
      

        self.window = Window(title: title, rect: Rect(x: 10, y: 10, w: 1024, h: 789), flags: [.openGL, .resizeable])
        self.renderer = Renderer(window: self.window, flags: [.vsync])
    }

    func render(_ closure: (Renderer)-> Void) {
        self.renderer.clear()
        closure(self.renderer)
        self.renderer.present()
    }

    func main(_ closure: () ->()) {
        defer{
            SDL.quit()
            Font.quit()
        }
        closure()
    }
}

let example = SDLExample("SDL2 Example")

example.main {
//    let imageTexture = Texture(renderer: example.renderer, image: "image.png")

//    let font = Font( "fontFile.ttf", size: 16 )
//    let fontTextTest = font.renderText("Hello, world!")
//    let fontTextTestTexture = Texture(renderer: example.renderer, surface: fontTextTest)
    var quit = false

    while !quit {
        // event polling
        SDL.pollEvents { event in
            switch event.kind {
                case .keyDown:
                    if event.isModDown(.leftCtrl) {
                        if event.isPressed(.Z) {
                           
                        }
                    }

                   if event.isPressed(.backspace, repeats: true) {
                       print("Backspace is held down")
                    }

                    if event.isPressed(.escape) {
                        quit = true
                    }

                case .window:
                    print("Window Event: \(event.window.eventID)")

                case .mouseBtnDown:
                    if event.clicked(mouseBtn: .left, clicks: 2) {
                        print("Mouse Clicked twice")
                    }

                case .quit:
                    quit = true

                case .textInput:
                    //TODO: make text input cleaner
                    let keyCode = event.text.text.0
                    if let scalar = UnicodeScalar(Int(keyCode)) {
                        let char = Character(scalar)
                            print(char)
                    }
                           
                default:
                    if let eventKind = event.kind {
                        print("Event not handled: \(eventKind)")
                    }
            }
        }

        example.render { renderer in
            renderer.drawColor = .red
            renderer.fillRect(Rect(x: 10, y: 10, w: 200, h: 200))
            // Hex color support
            renderer.drawColor = Color(hex: 0x1a1726)
        }
    }
}
