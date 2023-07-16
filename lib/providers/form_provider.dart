import 'dart:developer';

import '/data/models/forrm_model.dart';

mixin class FormProvider<T extends FormModel> {

  late T formModel;
  bool isFormValid = false;

  void updateFormModel(
    T Function(T formModel) update
  ){
    formModel = update(formModel);
    isFormValid = formModel.isValid;
    log('[ModelUpdate🤠] ${formModel.toMap().toString()}');
  }

}