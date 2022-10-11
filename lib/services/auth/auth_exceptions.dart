// login exception
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exception
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class InvalidPhoneAuthException implements Exception {}

//generic exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
