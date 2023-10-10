import { Then } from "cypress-cucumber-preprocessor/steps";
import { Selectors } from '../../pages/selectors'
import { Constants } from "../../fixtures/constants";


Then('I should visit the Application Form Page', () => {
    cy.visit('https://qa-task.redvike.rocks/');
    cy.viewport(1000, 660);
});

Then ('I should move slider and unlock captcha', () => {
    cy.get(Selectors.slider).contains('Slide to Submit')
    cy.get(Selectors.slider).click()
        .trigger("mousedown")
        .trigger("mousemove", { which: 1, pageX: 700 })
    cy.get(Selectors.slider).contains('Unlocked')
});

Then ('I should move slider, but not unlock captcha', () => {
    cy.get(Selectors.slider).contains('Slide to Submit')
    cy.get(Selectors.slider).click()
        .trigger("mousedown")
        .trigger("mousemove", { which: 1, pageX: 669 })
});

Then (/^I should upload "([^"]*)" file$/, (fileFormat) => {
    switch (fileFormat) {
        case 'jpeg':
            cy.get(Selectors.avatarInput).selectFile(Constants.JPEG_FILE);
            break;
        case 'jpg':
            cy.get(Selectors.avatarInput).selectFile(Constants.JPG_FILE);
            break;
        case 'png':
            cy.get(Selectors.avatarInput).selectFile(Constants.PNG_FILE);
            break;
        case 'gif':
            cy.get(Selectors.avatarInput).selectFile(Constants.GIF_FILE);
            break;
        case 'bmp':
            cy.get(Selectors.avatarInput).selectFile(Constants.BMP_FILE);
            break;
        case 'large file':
            cy.get(Selectors.avatarInput).selectFile(Constants.LARGE_FILE);
            break;
    }
});

Then('I should click on Submit button', () => {
    cy.get(Selectors.submitButton).click();
});

Then('I should check that form is submitted and the data is presented', () => {
    cy.get('h1').should('be.visible').should('have.text', 'Successful Form Submissions');
    cy.get('ul').should('include.text', Constants.VALID_FIRST_NAME + ' ' + Constants.VALID_LAST_NAME);
    cy.get('ul').should('include.text', Constants.VALID_EMAIL);
});

Then('I should check that uploaded image exists in Successful page', () => {
    cy.get('img').should('be.visible');
});

Then ('I should go back to the Form', () => {
    cy.get(Selectors.backToFormButton).click();
});

Then('I should check that form submission is blocked when captcha is not unlocked', () => {
    cy.get('li').should('be.visible').should('have.text', 'Please solve the captcha!');
});

Then('I should check that form has not been submitted with large file > 2MB', () => {
    cy.get('li').should('be.visible').should('have.text', 'File size must be less than 2 MB.');
});

Then (/^I should check that error message has appeared when required "([^"]*)" text field is empty$/, (textField) => {
    switch (textField) {
        case 'first name':
            cy.get('input[name="first_name"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('equal', 'Please fill out this field.')
            break;
        case 'last name':
            cy.get('input[name="last_name"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('equal', 'Please fill out this field.')
            break;
        case 'password':
            cy.get('input[name="password"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('equal', 'Please fill out this field.')
            break;
        case 'confirm password':
            cy.get('input[name="confirm_password"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('equal', 'Please fill out this field.')
            break;
        case 'email':
            cy.get('input[name="email"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('equal', 'Please fill out this field.')
            break;
    }
});

Then (/^I should clear "([^"]*)" text field$/, (textField) => {
    switch (textField) {
        case 'first name':
            cy.get('input[name="first_name"]').click().clear()
            break;
        case 'last name':
            cy.get('input[name="last_name"]').click().clear()
            break;
        case 'password':
            cy.get('input[name="password"]').click().clear()
            break;
        case 'confirm password':
            cy.get('input[name="confirm_password"]').click().clear()
            break;
        case 'email':
            cy.get('input[name="email"]').click().clear()
            break;
    }
});

Then(/^I should check that error message "([^"]*)" is presenting for passwords$/, (text) => {
    cy.get('li').should('be.visible').should('have.text', text);
});

Then(/^I should enter "([^"]*)" text in "([^"]*)" field$/, (validity, fieldName) => {
    if (validity === 'valid' && fieldName === 'first name') {
        cy.get(Selectors.firstNameInput).click().type(Constants.VALID_FIRST_NAME);
    } else if (validity === 'invalid' && fieldName === 'first name') {
        cy.get(Selectors.firstNameInput).click().type(Constants.WHITESPACE);
    } else if (validity === 'valid' && fieldName === 'last name') {
        cy.get(Selectors.lastNameInput).click().type(Constants.VALID_LAST_NAME);
    } else if (validity === 'invalid' && fieldName === 'last name') {
        cy.get(Selectors.lastNameInput).click().type(Constants.WHITESPACE);
    } else if (validity === 'valid' && fieldName === 'password') {
        cy.get(Selectors.passwordInput).click().type(Constants.VALID_PASSWORD);
    } else if (validity === 'invalid' && fieldName === 'password') {
        cy.get(Selectors.passwordInput).click().type(Constants.INVALID_PASSWORD);
    } else if (validity === 'valid' && fieldName === 'confirm password') {
        cy.get(Selectors.confirmPasswordInput).click().type(Constants.VALID_PASSWORD);
    } else if (validity === 'invalid' && fieldName === 'confirm password') {
        cy.get(Selectors.confirmPasswordInput).click().type(Constants.INVALID_PASSWORD);
    } else if (validity === 'mismatched confirm password' && fieldName === 'confirm password') {
        cy.get(Selectors.confirmPasswordInput).click().type(Constants.CONFIRM_PASSWORD);
    } else if (validity === 'valid' && fieldName === 'email') {
        cy.get(Selectors.emailInput).click().type(Constants.VALID_EMAIL);
    } else if (validity === 'invalid email without domain and .tld' && fieldName === 'email') {
        cy.get(Selectors.emailInput).click().type(Constants.INVALID_EMAIL_NO_DOMAIN_AND_TLD);
    } else if (validity === 'invalid email without username' && fieldName === 'email') {
        cy.get(Selectors.emailInput).click().type(Constants.INVALID_EMAIL_NO_USERNAME);
    } else if (validity === 'invalid email without .tld' && fieldName === 'email') {
        cy.get(Selectors.emailInput).click().type(Constants.INVALID_EMAIL_NO_TLD);
    }
});

Then (/^I should check that error message has appeared when invalid email value without "([^"]*)" part is populated$/, (text) => {
    switch (text) {
        case 'domain and .tld':
            cy.get('input[name="email"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('include', `Please enter a part following '@'. '${Constants.INVALID_EMAIL_NO_DOMAIN_AND_TLD}' is incomplete.`)
            break;
        case 'username':
            cy.get('input[name="email"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('include', `Please enter a part followed by '@'. '${Constants.INVALID_EMAIL_NO_USERNAME}' is incomplete.`)
            break;
        case '.tld':
            cy.get('input[name="email"]:invalid')
                .invoke('prop', 'validationMessage')
                .should('include', `Please enter a part following '@'. '${Constants.INVALID_EMAIL_NO_TLD}' is incomplete.`)
            break;
    }
});
