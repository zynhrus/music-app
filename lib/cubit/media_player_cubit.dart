import 'package:bloc/bloc.dart';

class MediaPlayerCubit extends Cubit<bool> {
  MediaPlayerCubit() : super(false);

  void setShow(bool show) {
    if (show) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
