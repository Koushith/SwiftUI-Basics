# SwiftUI-Basics. -- Raw and unedited notes. ignore the typos and grammatical errors!!

Playing around SwiftUI by exploring common components

# SwiftUI Notes

- Future of IOS development. UIKit is pretty old.


Whenver you create a new project it comes with 2 files. ```contentView``` and ```Appname.swift``` 

second one has @main method which serves as a entry point.

```swift
import SwiftUI

@main
struct swiftuibasicsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView() // name of the view, screen
        }
    }
}

```

Note- look at folder structure. Accets.xxxx -- this is where all of your images, color lies just add in here, you can use it anywhere without importing like js.


### Texts

- pretty basic stuffs. explore and play around.
- order of modifiers matters.

```
kerning - letterspacing- just the naming difference

```

```swift=
import SwiftUI

struct TextView: View {
    var body: some View {
        Text("koushith")
            .foregroundColor(.red)
            .bold()
            .underline()
    }
}

// this is not required- it is used for preview purposes
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

```

### Shapes - 

- Read the docs helps us to create any shapes like circles, rectangles or even custom

```swift=
RoundedRectange().frame(x x)
Circles - etc
```

### Colors

- used with modifiers. 

```swift=
.fill(Color.grey)
```

you can use colors from swiftUI's ```Colors``` or uiKits ```UIColor```

add all assets and you can use it directly

### Frames

- every single image you add it to the screen, it has a frame. (control height and width)

control height, width and alignments.

### Inits and enums

init()  ---> fn that runs to initilize your views.

lets say we have multiple screens using same view, we want to add different foreground color, we can do it with init()

kinda state and props concept.

```swift=
import SwiftUI

struct InitilizerView: View {
    
    let backgroundColor : Color // you can asign a value here or pass it as peops
    let text : String
    
    var body: some View {
        VStack(spacing:20){
            Text("\(text)")
                .underline()
                .font(.headline)
                .foregroundColor(.white)
            

            Text("Koushith")
        }.frame(width: 250, height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
        
    }
}

struct InitilizerView_Previews: PreviewProvider {
    static var previews: some View {
        InitilizerView(backgroundColor: .red, text: "Hellooooooooooo") // this is how you use screens and pass props
    }
}

```

##### This is nothing but the constructor.

under the hood - - - 

```swift
import SwiftUI

struct InitilizerView: View {
    
    let backgroundColor : Color
    let text : String
    
    init(backgroundColor: Color, text: String) {
        self.backgroundColor = backgroundColor
        self.text = text
    }
    
    var body: some View {
        VStack(spacing:20){
            Text("\(text)")
                .underline()
                .font(.headline)
                .foregroundColor(.white)
            

            Text("Koushith")
        }.frame(width: 250, height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
        
    }
}

struct InitilizerView_Previews: PreviewProvider {
    static var previews: some View {
        InitilizerView(backgroundColor: .red, text: "Hellooooooooooo")
    }
}

```

### ```self.xxx``` - ```self``` is ```this``` herre

you can put conditions inside constructors


### ForEach- helps in looping through arrays

```swift
import SwiftUI

struct ForEachView: View {
    
    let data : [String] = ["hii", "hello", "how are you"]
    
   
    
    var body: some View {
        VStack{
            ForEach(data.indices){
                index in Text("\(data[index]) : \(index)")
            }
        }
    }
}

struct ForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachView()
    }
}

```

- you can use dataset, arrays, range to loop. -read more

if data souce is huge, you need to use it with ```scrollview```



```swift
struct ForEachView: View {
    
    let data : [String] = ["hii", "hello", "how are you"]
    
   
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(data.indices){
                    index in Text("\(data[index]) : \(index)")
                }
                
                ForEach(0..<100){ index in
                    Circle().frame(height:20).foregroundColor(.red)
                    
                }
            }
        }
       
    }
}

```

you can add horizontal or vertical scrolls.

while using foreach inside views, it will load all at once which is not good for performance.

indstead of callin ```vstack or hstack``` use ```LazyVStach```

- this will create only which are visible to view port

### LazyGrid  -read more
### SafeAreas - i.e notch areas
 - .edgesIgnoringSafeAreas()  ---> this modifier does that.



### Buttons 

- check docs for more. 

```swift
//pseudo code

Button("Title"){
    //actions - code
}

```
