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

```swift
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

```swift
RoundedRectange().frame(x x)
Circles - etc
```

### Colors

- used with modifiers. 

```swift
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

```swift
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


in above example- it is just a string. you can do more than that.

```swift

   Button(action:{
                self.title = "Button 2 was Pressed"
            },
            label: {
                Text("Press Button 2")
            }
        )
```

use modifiers to control the look and feel.


### State

- when you declare the variable with ```swift @state ``` , you are telling the view to watch out for changes.

if this variable changes, we might need to update the view.

```swift

import SwiftUI

struct ButtonView: View {
    
   @State var title: String = "This is my Title" //this is the state variable and we are telling View to watch out for changes
    
    var body: some View {
        VStack{
            Text(title)
           
            
            Button("Press Me"){
              // you can create a seperate function and 
                self.title = "Button was pressed"
            }
            
            Button(action:{
                self.title = "Button 2 was Pressed"
            },
            label: {
                Text("Press Button 2")
            }
            )

        }
    }
}
```

you can also do this for views.


#### @binding property

- This is used to connect a state variable from parent view to child view.

aka- state is declared somewhere else and we are connecting it. 

```swift!
import SwiftUI

struct BindingExample: View {
    
    // state variabe- if we dont initilize we have to pass the value just like passing porps in react
    @State var backgroundColor : Color = Color.red
    
    var body: some View {
        
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            ExtractedButtonView(backgroundColor:  $backgroundColor)  //we are passing the binding reference
            
        }
    }
}



struct ExtractedButtonView: View {
    //this will bind to parents background color
    @Binding  var backgroundColor : Color
    
    var body: some View {
        Button(action:{
            self.backgroundColor = Color.green;
        }, label:{
            Text("Hello")
        }
        ).background(.blue)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(.blue)
            .cornerRadius(10)
    }
}

```

- concept is very simple. state variable is declared in parent component and you are passing a state variable as a binding to child view. here you use ```@bind``` 

this variabe is binding to state variable declared in the parent view.

we have ```.toggle()``` function abalible on boolean variables.


### .sheets() && .fullScreenSheets() - refer docs.





### @stateObjects and @observeableObjects()


#### List 
- list has few handy methods such as ```onLoad()``` ```onDelete``` , native swipe options

read about onAppear and onDisappear.


note while crateing a view you are using ```struct```

you can use @state only inside view. i.e struct.

if you want to use the state outside- use ```@published```

just like @state alerts the view, @published alerts the class to look for changes.


```The @Published attribute is class constrained. Use it with properties of classes, not with non-class types like structures.```

initilize the class and use it.

```swift!

import SwiftUI


struct FruitModel:Identifiable{
    let id : String = UUID().uuidString
    let name : String
    let count : Int
}



class FruitsViewModel: ObservableObject {
    
    @Published var fruitArray : [FruitModel] = []
    @Published var isLoading : Bool = false
    
    func getFruits(){
        let fruit1 = FruitModel(name: "Apple", count: 5)
        let fruit2 = FruitModel(name: "Apple", count: 5)
        let fruit3 = FruitModel(name: "Apple", count: 5)
        let fruit4 = FruitModel(name: "Apple", count: 5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoading = true
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit3)
            self.fruitArray.append(fruit4)
            self.isLoading = false
        }
    }
    
    func Delete(index: IndexSet){
        print(index)
        fruitArray.remove(atOffsets: index)
    }
}



struct ViewModel: View {
    
    @ObservedObject var fruitsViewModel : FruitsViewModel = FruitsViewModel() //initilizing the class
    
//    @State var fruitArray : [FruitModel] = []
    
 var body: some View {
        
        
        NavigationView {
            
            List{
                ForEach(fruitsViewModel.fruitArray) { fruit in
                    
                    if(fruitsViewModel.isLoading){
                       ProgressView()
                    }else{
                        HStack{
                            Text("\(fruit.count)").foregroundColor(.red)
                            Text("\(fruit.name)").bold()
                            
                        }
                    }
                   
                }.onDelete(perform: fruitsViewModel.Delete)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Fruits List")
        .onAppear{
            fruitsViewModel.getFruits()
        }
        
    }
    
    
}

```

- basically this is for code clean up- put any data logic outside and seperate the ui.

- in views we use ```struct```  and local state are avaliable only on views- i.e struct.

- in order to use the state variable outside and update the view based on this object -

    -    Create a class which is ```obserableOjbct``` and declare thd state variable as ```@published```
    -    initilize the class inside view and use it. while initilizing make use of ```@ObservedObject``` .
    -    basically with this we are telling the class to watchout for changes and update the value accordingly.
    -    note that- when ever something changes in the ui- it will update the whole class and data wont be persisted. 

use ```@stateObject``` to persist the data. it is same as ```@observedObject``` in initilizer. 


Stateobject -- to persist data
obesterved object- wont persist the data while rerendering.



### environment object -> kinda global state 
- in above example we are passing data from screen to screen. but here we are defining it in global level and we can access it anywhere in the app. 

basically a prop drilling issue in reacts context.

refer docs


#### @AppStorage- kind of local storage
#### @AsyncImage - load image from internet- url loading.
#### @focused - just like useref for focus

- use case - focus text field and popup keyboard.



#### Haptics aka vibrations

instanciate with static keyword .

```HapticsManager()``` takes care of everything

static keywords can accessed without instanciating.



#### identiable and hashable -

- while using for each loop we need to add an id. by default arrays -string array, we use .self. --> basically this hashes the string and produce unique id.




### CoreData - kind of mini data base in phone that can be used to persist the data. more of a local storage



### Encodealbe, Decodable and Codable

when you download a data from internet, most of the time its raw and we cant use it directly. we need to either encode or decode the data into the data structure we have in our app.

kind of ```json.parse() and json.stringify()``` and making it accordng to the interface we defined.



##### Codeable

- when you dowload omething from internet-> raw json has to be parsed to something usable. you cant directly use it on app.


if you log the raw data, it shows in bytes, we need to decode it.


```swift 

//this is main-> Decodable, encoadable protocol
struct CustomerModel : Identifiable, Decodable, Encodable  {
    let id : String
    let name : String
    let point : Int
    let isPremium : Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case point
        case isPremium
    }
    

    
}


class CodeableViewModle : ObservableObject {
    //just like state- > this alerts class to watchout for changes
    @Published var customer : CustomerModel? = nil
    
    init(){
        getData()
    }
    
    func getData(){
        
       guard let data = getJSONData() else {return}
    
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
        
    }
    
    //simulate downloading from internet
    func getJSONData()->Data?{
       
        let newCustomer = CustomerModel(id:"123", name: "koush", point: 5, isPremium: true)
        
        let jsonData = try? JSONEncoder().encode(newCustomer)
        
        return jsonData
        
    }
    
    
    
 
}

```

https://www.youtube.com/watch?v=mG9BVAs8AIo&list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar&index=12


https://www.youtube.com/watch?v=ddr3E0l4gIQ&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=29 
