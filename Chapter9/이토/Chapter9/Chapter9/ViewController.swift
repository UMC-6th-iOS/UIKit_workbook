import UIKit
import Alamofire

class ViewController: UIViewController {
    // UI 컴포넌트 선언 (예: UILabels, UIImageViews)

    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var weather: UILabel!

    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var rainAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData()
        
    }
    
    func fetchWeatherData() { //현재 35.1550677, 128.1088914의 지역값만 받은 것임
        //우리 집 구글 지도에서 긁어온거임
        let apiKey = "f3b27d303a14f23ff3c072d028f4906f"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=35.1550677&lon=128.1088914&appid=\(apiKey)&units=metric"

        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    // JSON 데이터를 WeatherData 구조체로 디코딩
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    // 메인 스레드에서 UI 업데이트
                    DispatchQueue.main.async {
                        // 여기서 UI 업데이트
                        // 예: self.temperatureLabel.text = "\(weatherData.main.temp)°C"
                        self.location.text = weatherData.name ?? "Where"
                        self.weather.text = weatherData.weather.first?.description.capitalized ?? "Not Available"
                                                
                                                // 풍속 업데이트
                                                self.windSpeed.text = "Wind Speed: \(weatherData.wind.speed) m/s"
                                                
                                                // 강수량 업데이트 (1시간 단위)
                                                if let rain = weatherData.rain?.the1H {
                                                    self.rainAmount.text = "Rain: \(rain) mm/h"
                                                } else {
                                                    self.rainAmount.text = "Rain: None"
                                                }
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
