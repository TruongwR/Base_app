import 'package:Whispers/src/data/repositories/repository/chanrl_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_chanel_state.dart';

class DetailChanelCubit extends Cubit<DetailChanelState> {
  final ChanelRepository chanelRepository;
  DetailChanelCubit({required this.chanelRepository}) : super(const DetailChanelState.initial());
}
