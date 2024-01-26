

import 'package:eplayer_flutter_mobile/helper/app_exception.dart';
import 'package:eplayer_flutter_mobile/helper/dialog_helper.dart';

import '../view/widget/error_dialog.dart';

mixin class BaseController{

  void handleError(error){
    if(error is BadRequestException){
      var message = error.message;
      showmessage(message);

    } else if(error is FetchDataException){
      var message = error.message;
      showmessage(message);

    } else if(error is ApiNotRespondingException){

      showmessage("Opps It took longer to respond");

    }


  }
}