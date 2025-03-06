class Validators {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    // check if password is at least 8 latin characters long, has at least one lowercase letter, one uppercase letter, one number and one special character
    if (password.length < 8 ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#\$%\^&\*]'))) {
      return 'Password must be at least 8 latin characters long, contain at least one lowercase letter, one uppercase letter, one number and one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (password != confirmPassword) {
      return 'Confirmation password does not match password';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
      return 'Phone number must be 11 digits long';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) return 'First name is required';
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'First name must be alphabetic';
    }
    return null;
  }

  String? validateString(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    if (value.length < 2) {
      return 'This field must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'This field must be alphabetic';
    }
    return null;
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) return 'Weight is required';

    // Assuming your weight range should be between '0' and '1000' (adjust as needed)
    if (double.tryParse(value) == null) {
      return 'Please enter a valid numeric weight';
    }

    double weight = double.parse(value);

    if (weight <= 0 || weight > 1000) {
      return 'Weight must be a positive value less than or equal to 1000';
    }

    return null;
  }

  String? validateGender(String? value) {
    if (value == null || value.isEmpty) return 'Gender is required';

    // Assuming your valid gender values are 'male' or 'female' (case-insensitive)
    if (value.toLowerCase() != 'male' && value.toLowerCase() != 'female') {
      return 'Please select a valid gender';
    }

    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) return 'Message is required';

    // Split the message into words and count them
    List<String> words = value.split(' ');
    int wordCount = words.length;

    // Assuming the minimum word count is 5 (adjust as needed)
    if (wordCount < 5) {
      return 'Message must be at least five words long';
    }

    return null;
  }

  String? validateHeight(String? value) {
    if (value == null || value.isEmpty) return 'Height is required';

    // Assuming the height should be a positive numeric value less than or equal to 300 (adjust as needed)
    try {
      double height = double.parse(value);

      if (height <= 0 || height > 300) {
        return 'Please enter a valid height between 1 and 300';
      }
    } catch (e) {
      return 'Please enter a valid numeric height';
    }

    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) return 'Age is required';

    // Assuming the age should be a positive integer less than or equal to 120 (adjust as needed)
    try {
      int age = int.parse(value);

      if (age <= 0 || age > 120) {
        return 'Please enter a valid age between 1 and 120';
      }
    } catch (e) {
      return 'Please enter a valid numeric age';
    }

    return null;
  }

  String? validateNumbers(String? value) {
    if (value == null || value.isEmpty) return 'This Field is required';

    // Assuming the house number should be a positive integer
    try {
      int houseNumber = int.parse(value);

      if (houseNumber <= 0) {
        return 'Please enter a valid positive number';
      }
    } catch (e) {
      return 'Please enter a valid numeric number';
    }

    return null;
  }
}
