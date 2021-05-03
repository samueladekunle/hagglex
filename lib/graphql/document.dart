abstract class Document {
  static const login = """
mutation Login(
  \$input: String!, \$password: String!
  ) {
  login (data: {input: \$input, password: \$password}) {
    user {
      username,
      email,
      phonenumber,
      emailVerified,
    },
    token,
    twoFactorAuth,
  }
}
""";

  static const register = """
mutation Register(
  \$email: String!, \$username: String!, \$password: String!, \$country: String!,
  \$phonenumber: String!, \$currency: String!, \$referralCode: String
  ) {
  register(data: {
    email: \$email, username: \$username, password: \$password, country: \$country,
    phonenumber: \$phonenumber, currency: \$currency, referralCode: \$referralCode,
  }) {
    user {
      username,
      email,
      phonenumber,
      emailVerified,
    },
    token,
  }
}
""";

  static const resendVerificationCode = """
query ResendVerificationCode(\$email: String!) {
  resendVerificationCode(data: {email: \$email})
}
""";

  static const verifyUser = """
mutation VerifyUser(\$code: Int!) {
  verifyUser(data: {code: \$code}) {
    user {
      username,
      email,
      phonenumber,
      emailVerified,
    }
  }
}
""";
}
