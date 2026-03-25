enum CarsModelsEnum {
  clubCar(
    modelName: 'Club Car',
    modelLogoPath: 'assets/images/clubcar_logo.png',
  ),
 
  eCar(modelName: 'E-Car', modelLogoPath: 'assets/images/e-car_logo.png'),
 
  ezGo(modelName: 'E-Z Go', modelLogoPath: 'assets/images/ez-go-logo.png'),
  
  wind(modelName: 'Wind', modelLogoPath: 'assets/images/wind_logo.png'),
  
  yamaha(modelName: 'Yamaha', modelLogoPath: 'assets/images/Yamaha-logo.png'),
 
  other(
    modelName: 'Other',
    modelLogoPath: 'assets/images/other_model_image.png',
  );

  final String modelName;
  final String modelLogoPath;

  const CarsModelsEnum({required this.modelName, required this.modelLogoPath});
}
