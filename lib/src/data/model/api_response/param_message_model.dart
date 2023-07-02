import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';

import '../../../cubit/chanel_list_all_cubit.dart';


class ParamMesage {
  Channel chanel;
  ChanelListAllCubit chanelListAllCubit;
  ParamMesage({
    required this.chanel,
   required this.chanelListAllCubit,
  });
}
