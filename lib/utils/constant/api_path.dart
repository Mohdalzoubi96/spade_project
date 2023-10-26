abstract class ApiPaths {
  static const base = "stg.spade.net";
  static const socketBase = "wss://stg.spade.net/";
  static const extAuth = "/v1/auth";
  static const extStock = "/v1/variants";

  static const loginPhone = "$extAuth/request-otp";
  static const loginEmail = "$extAuth/email-request-otp";
  static const verifyEmail = "$extAuth/login-with-email";
  static const verifyPhone = "$extAuth/login-with-otp";
  static const availableStocks = "$extStock/buyer/available";



}
