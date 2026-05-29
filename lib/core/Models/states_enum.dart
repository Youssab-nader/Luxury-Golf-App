enum ServStatus {
  disabled,
   pendingCustomerRequest,   
  suspended,                
  waitingEmployeeApproval,  
  acceptedInProgress,       
  working,                  
  completedSuccessfully,  
  rejectedByEmployee,       
  invoiceRequested,  
}

enum RequestStatus {
  approved (statusName: 'Approved'),
  pinding (statusName: 'Pinding'),
  rejected (statusName: 'Rejected');
  final String statusName;

  const RequestStatus({required this.statusName});
}
