import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/screens/change_number/change_number_repository.dart';
import 'package:meta/meta.dart';
import 'package:ecellapp/core/res/strings.dart';

part 'change_number_state.dart';

class ChangeNumberCubit extends Cubit<ChangeNumberState> {
  FakeChangeNumberRepository _changeNumberRepository = FakeChangeNumberRepository();

  ChangeNumberCubit() : super(ChangeNumberInitial());

  Future<void> getOtp(String number) async {
    try {
      emit(ChangeNumberOTP());
    } on NetworkException {
      emit(ChangeNumberError(S.unknownException));
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      int x = await _changeNumberRepository.verifyOtp(otp);
      if (x == 200) {
        emit(ChangeNumberOtpSuccessful());
      }
    } on ValidationException {
      emit(ChangeNumberError(S.wrongOtp));
    }
  }
}
