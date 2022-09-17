import 'package:movies_app/features/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", 
      id: json['id'],
    );
  }
}
