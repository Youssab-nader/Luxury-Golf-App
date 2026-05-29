import 'package:luxury_golf_app/core/Enums/fixing_section_enum.dart';

class FixServiceRequestsModel {
  String? customerName;
  String? customerPhoneNum;
  String? carModel;
  String? reqDate;
  String? reqServiceLocation;
  String? problemsDesc;
  String? status;
  List <FixingProblemsEnum>? expProblems ;

    FixServiceRequestsModel({
      this.customerName,
     this.carModel,
     this.reqDate,
     this.expProblems  ,
     this.problemsDesc,
     this.reqServiceLocation,
     this.customerPhoneNum,
    this.status = 'Pending',
  }) {
   reqId =  genReqID();
  }

  int reqNum = 0;
  String reqId = 'FIX-';
  String genReqID() {
    reqNum++;
    return reqId + reqNum.toString();
  }
}
