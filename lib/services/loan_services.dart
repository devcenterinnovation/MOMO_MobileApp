import 'api_docs.dart';

class LoanServices {
  static getLoans(token, userId) async {
    return await ApiDocs.initialiseGetRequest(
      token,
      url: ApiDocs.GET_LOAN_URL + '/$userId',
    );
  }

  static userLoan(token, {amount, purpose, userId}) async {
    var data = {
      'amount': amount,
      'purpose': purpose,
    };
    return await ApiDocs.initialisePostRequest(
        url: ApiDocs.LOAN_URL + '/$userId', data: data, token: token);
  }
}
