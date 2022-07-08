import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
       
        ZStack {
            BackgroundView(isNight : $isNight)
            
            VStack {
                
                CityTextView(cityName: "Kitchner, ON")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", temperature: isNight ? 66 : 76)
            
            HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.fill": "cloud.sun.fill",
                                   temperature: isNight ? 62 : 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.bolt.fill",
                                   temperature: isNight ? 64 : 72)
                    WeatherDayView(dayOfWeek: "THR",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.rain.fill",
                                   temperature: isNight ? 60 : 70)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "moon.fill" : "cloud.sun.fill",
                                   temperature: isNight ? 66 :78)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "cloud.moon.fill" : "sun.max.fill",
                                   temperature: isNight ? 64 : 80)
                }
                Spacer()
               
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "CHANGE DAY TIME", textColor: .blue, backgroundColor: .white)
                    
                }
             Spacer()
                        
                        
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue ,  isNight ? .gray : .white]),                  startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight:  .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10)  {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 40)
    }
}


