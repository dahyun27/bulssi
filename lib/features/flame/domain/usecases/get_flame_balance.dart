import '../repositories/flame_repository.dart';

class GetFlameBalance {
  const GetFlameBalance(this._repository);
  final FlameRepository _repository;

  Future<int> call() => _repository.getFlameBalance();
}
