Feature: Test application form

  Scenario: Test form submission with valid data and verify that the submission is successful and the data is correctly displayed on the success page.
    # Check form submission with valid data + uploaded avatar.
    Then I should visit the Application Form Page
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "jpeg" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that form is submitted and the data is presented
    Then I should check that uploaded image exists in Successful page
    # Check form submission with valid data without avatar
    Then I should visit the Application Form Page
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that form is submitted and the data is presented

  Scenario: Test form submission with invalid data (e.g.,mismatched passwords, invalid email format) and verify that the submission fails and appropriate validation messages are displayed.
    Then I should visit the Application Form Page
    # Check form submission with locked captcha.
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should click on Submit button
    Then I should check that form submission is blocked when captcha is not unlocked
    # Check form submission with empty First name text field
    Then I should clear "first name" text field
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that error message has appeared when required "first name" text field is empty
#  TODO FAILING - Check form submission with whitespace populated to the First name text field - to be uncommented when the issue is fixed
#    Then I should enter "invalid" text in "first name" field
#    Then I should click on Submit button
#    Then I should check that error message has appeared when required "first name" text field is empty
    # Check form submission with empty Last name text field
    Then I should enter "valid" text in "first name" field
    Then I should clear "last name" text field
    Then I should click on Submit button
    Then I should check that error message has appeared when required "last name" text field is empty
# TODO FAILING - Check form submission with whitespace populated to the Last name text field - to be uncommented when the issue is fixed
#    Then I should enter "invalid" text in "last name" field
#    Then I should click on Submit button
#    Then I should check that error message has appeared when required "last name" text field is empty
    # Check form submission with empty Email text field
    Then I should enter "valid" text in "last name" field
    Then I should clear "email" text field
    Then I should click on Submit button
    Then I should check that error message has appeared when required "email" text field is empty
    # Check form submission with invalid email without domain and .tld parts
    Then I should enter "invalid email without domain and .tld" text in "email" field
    Then I should click on Submit button
    Then I should check that error message has appeared when invalid email value without "domain and .tld" part is populated
    # Check form submission with invalid email without username part
    Then I should clear "email" text field
    Then I should enter "invalid email without username" text in "email" field
    Then I should click on Submit button
    Then I should check that error message has appeared when invalid email value without "username" part is populated
# TODO FAILING - Check form submission with invalid email without .tld part - to be uncommented when the issue is fixed
#    Then I should clear "email" text field
#    Then I should enter "invalid email without .tld" text in "email" field
#    Then I should click on Submit button
#    Then I should check that error message has appeared when invalid email value without ".tld" part is populated
    # Check form submission with empty Password text field
    Then I should clear "email" text field
    Then I should enter "valid" text in "email" field
    Then I should clear "password" text field
    Then I should click on Submit button
    Then I should check that error message has appeared when required "password" text field is empty
    # Check form submission with empty Confirm Password text field
    Then I should enter "valid" text in "password" field
    Then I should clear "confirm password" text field
    Then I should click on Submit button
    Then I should check that error message has appeared when required "confirm password" text field is empty
    # Check form submission when Confirm password value does not match Password value
    Then I should enter "mismatched confirm password" text in "confirm password" field
    Then I should click on Submit button
    Then I should check that error message "Passwords do not match!" is presenting for passwords
    # Check form submission when Password value is less than 8 symbols
    Then I should clear "password" text field
    Then I should enter "invalid" text in "password" field
    Then I should clear "confirm password" text field
    Then I should enter "invalid" text in "confirm password" field
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that error message "Password must be at least 8 characters long!" is presenting for passwords

  Scenario: Test the form with various types of images for the avatar and verify that the uploaded image is correctly displayed on the success page.
    Then I should visit the Application Form Page
    # Uploading of jpeg image
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "jpeg" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that uploaded image exists in Successful page
    # Uploading of jpg image
    Then I should go back to the Form
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "jpg" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that uploaded image exists in Successful page
    # Uploading of png image
    Then I should go back to the Form
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "png" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that uploaded image exists in Successful page
     # Uploading of bmp image
    Then I should go back to the Form
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "bmp" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that uploaded image exists in Successful page
# TODO FAILING - Uploading of gif image - to be uncommented when the issue is fixed
#    Then I should go back to the Form
#    Then I should enter "valid" text in "first name" field
#    Then I should enter "valid" text in "last name" field
#    Then I should enter "valid" text in "email" field
#    Then I should enter "valid" text in "password" field
#    Then I should enter "valid" text in "confirm password" field
#    Then I should upload "gif" file
#    Then I should move slider and unlock captcha
#    Then I should click on Submit button
#    Then I should check that uploaded image exists in Successful page
    # Uploading of large file > 2MB
    Then I should go back to the Form
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "large file" file
    Then I should move slider and unlock captcha
    Then I should click on Submit button
    Then I should check that form has not been submitted with large file > 2MB

  Scenario: Test that form submission is blocked when attempting to submit the form without sliding the captcha to the end
    Then I should visit the Application Form Page
    Then I should enter "valid" text in "first name" field
    Then I should enter "valid" text in "last name" field
    Then I should enter "valid" text in "email" field
    Then I should enter "valid" text in "password" field
    Then I should enter "valid" text in "confirm password" field
    Then I should upload "jpeg" file
    Then I should move slider, but not unlock captcha
    Then I should click on Submit button
    Then I should check that form submission is blocked when captcha is not unlocked
