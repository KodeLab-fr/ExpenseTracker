import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:get/get.dart';

/// Translations for the app
class ExpenseTrackerTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          Adresses.APP_NAME: 'Expense Tracker',
          Adresses.APP_NAME_WITH_APP: 'Expense Tracker App',
          Adresses.FAILURES_CLASS_TITLE: 'Error occurred',
          Adresses.OK: 'OK',
          Adresses.NETWORK_VIEW_TITLE: 'Offline',
          Adresses.NETWORK_VIEW_CONTENT:
              'You don\'t seem to be connected to the internet. '
                  'Please check your connection.',
          Adresses.NETWORK_VIEW_BUTTON: 'Try again',
          Adresses.NETWORK_CONT_ERROR_TITLE:
              'Please check your connection and try again.',
          Adresses.UNKNOWN_VIEW_TITLE: 'Address not found',
          Adresses.UNKNOWN_VIEW_CONTENT:
              'The page you are looking for does not exist',
          Adresses.UNKNOWN_VIEW_BUTTON: 'Go back',
          Adresses.SERV_DOWN_VIEW_TITLE: 'Server is down',
          Adresses.SERV_DOWN_VIEW_CONTENT:
              'The server is currently unavailable. We are trying our best '
                  'to put it back on. Please try again later.',
          Adresses.SERV_DOWN_VIEW_BUTTON: 'Try again',
          Adresses.SERV_DOWN_CONT_ERROR_TITLE: 'Server down',
          Adresses.INTRO_VIEW_1_TITLE: 'A student project',
          Adresses.INTRO_VIEW_1_CONTENT:
              'Expense Tracker is first and foremost a student '
                  'project, any feedback is welcome!',
          Adresses.INTRO_VIEW_2_TITLE: 'Activity tracking',
          Adresses.INTRO_VIEW_2_CONTENT:
              'Simply track your expenses and establish schedules '
                  'and dashboards',
          Adresses.INTRO_VIEW_3_TITLE: 'Personal account',
          Adresses.INTRO_VIEW_3_CONTENT:
              'You just have to authenticate yourself!',
          Adresses.INTRO_VIEW_SKIP: 'Skip',
          Adresses.INTRO_VIEW_NEXT: 'Next',
          Adresses.LOGIN_FORM_VIEW_TITLE: 'Welcome!\nPlease log in.',
          Adresses.LOGIN_FORM_VIEW_ID: 'Enter your ID',
          Adresses.LOGIN_FORM_VIEW_ID_VALIDATOR: 'ID needs to be longer',
          Adresses.LOGIN_FORM_VIEW_PASSWORD: 'Enter a password',
          Adresses.LOGIN_FORM_VIEW_PASSWORD_VALIDATOR:
              'Password needs to be longer',
          Adresses.LOGIN_FORM_VIEW_NO_ACCOUNT: 'No account yet? ',
          Adresses.LOGIN_FORM_VIEW_SWITCH: 'Register',
          Adresses.LOGIN_FORM_VIEW_BUTTON: 'Submit',
          Adresses.LOGIN_CONT_ERROR_TITLE: 'Login failed',
          Adresses.LOGIN_CONT_ERROR_CONTENT:
              'Invalid credentials, please try again.',
          Adresses.REGISTER_FORM_VIEW_TITLE: 'Welcome!\nCreate your profile.',
          Adresses.REGISTER_FORM_VIEW_NAME: 'Enter a name',
          Adresses.REGISTER_FORM_VIEW_NAME_VALIDATOR: 'Name needs to be longer',
          Adresses.REGISTER_FORM_VIEW_EMAIL: 'Enter an email',
          Adresses.REGISTER_FORM_VIEW_EMAIL_VALIDATOR:
              'Email needs to be longer',
          Adresses.REGISTER_FORM_VIEW_PASSWORD: 'Enter a password',
          Adresses.REGISTER_FORM_VIEW_PASSWORD_VALIDATOR:
              'Password needs to be longer',
          Adresses.REGISTER_FORM_VIEW_ALREADY_ACCOUNT:
              'Already have an account? ',
          Adresses.REGISTER_FORM_VIEW_SWITCH: 'Log in',
          Adresses.REGISTER_FORM_VIEW_BUTTON: 'Submit',
          Adresses.REGISTER_CONT_ERROR_TITLE: 'Registration failed',
          Adresses.REGISTER_CONT_ERROR_CONTENT:
              'Name or email already used, please try again.',
          Adresses.OTP_VIEW_TITLE: 'Email verification',
          Adresses.OTP_VIEW_CONTENT:
              'Enter the 6-digit code sent to your address',
          Adresses.OTP_VIEW_BUTTON: 'Submit',
          Adresses.OTP_VIEW_RESEND: 'Didn\'t receive the code? ',
          Adresses.OTP_CONT_SEND_TITLE: 'Account created successfully!',
          Adresses.OTP_CONT_SEND_CONTENT: 'You can now use these credentials.',
          'no_response_server': 'No response from the server',
          Adresses.OTP_CONT_SEND_401: 'Invalid code, please try again.',
          Adresses.OTP_CONT_SEND_402: 'Code expired, please try again.',
          Adresses.OTP_CONT_SEND_404: 'User not found, please register again.',
          Adresses.OTP_CONT_RESEND_TITLE: 'Code sent!',
          Adresses.OTP_CONT_RESEND_CONTENT:
              'Please check your mailbox and your spams.',
          Adresses.OTP_CONT_RESEND_401:
              'User has been deleted, please register again.',
          Adresses.OTP_CONT_RESEND_404:
              'User not found, please register again.',
          Adresses.NAVIGATION_VIEW_HOME: 'Home',
          Adresses.NAVIGATION_VIEW_CALENDAR: 'Calendar',
          Adresses.NAVIGATION_VIEW_FORMS: 'Forms',
          Adresses.NAVIGATION_VIEW_SETTINGS: 'Settings',
          Adresses.DRAWER_VIEW_HOME: 'Home',
          Adresses.DRAWER_VIEW_ABOUT: 'About',
          Adresses.DRAWER_VIEW_CONTACT: 'Contact',
          Adresses.DRAWER_VIEW_LANG: 'Language',
          Adresses.DRAWER_VIEW_SETTINGS: 'Settings',
          Adresses.DRAWER_VIEW_LOGOUT: 'Log out',
          Adresses.HOME_VIEW_TITLE: 'Home page is working (debug)',
          Adresses.SETTINGS_VIEW_TITLE: 'Settings page is working (debug)',
        },
        'fr': {
          Adresses.APP_NAME: 'Expense Tracker',
          Adresses.APP_NAME_WITH_APP: 'Expense Tracker App',
          Adresses.FAILURES_CLASS_TITLE: 'Une erreur est survenue',
          Adresses.OK: 'OK',
          Adresses.NETWORK_VIEW_TITLE: 'Hors ligne',
          Adresses.NETWORK_VIEW_CONTENT:
              'Vous ne semblez pas être connecté à internet. '
                  'Veuillez vérifier votre connexion.',
          Adresses.NETWORK_VIEW_BUTTON: 'Réessayer',
          Adresses.NETWORK_CONT_ERROR_TITLE:
              'Veuillez vérifier votre connexion et réessayer.',
          Adresses.UNKNOWN_VIEW_TITLE: 'Adresse introuvable',
          Adresses.UNKNOWN_VIEW_CONTENT:
              'La page que vous recherchez n\'existe pas',
          Adresses.UNKNOWN_VIEW_BUTTON: 'Retour',
          Adresses.SERV_DOWN_VIEW_TITLE: 'Serveur indisponible',
          Adresses.SERV_DOWN_VIEW_CONTENT:
              'Le serveur est actuellement indisponible. Nous faisons de notre '
                  'mieux pour le remettre en état.'
                  ' Veuillez réessayer plus tard.',
          Adresses.SERV_DOWN_VIEW_BUTTON: 'Réessayer',
          Adresses.SERV_DOWN_CONT_ERROR_TITLE: 'Serveur indisponible',
          Adresses.INTRO_VIEW_1_TITLE: 'Un projet étudiant',
          Adresses.INTRO_VIEW_1_CONTENT:
              'Expense Tracker est avant tout un projet étudiant, tout retour '
                  'est le bienvenu !',
          Adresses.INTRO_VIEW_2_TITLE: 'Suivi d\'activité',
          Adresses.INTRO_VIEW_2_CONTENT:
              'Suivez simplement vos dépenses et établissez des plannings et '
                  'des tableaux de bord',
          Adresses.INTRO_VIEW_3_TITLE: 'Compte personnel',
          Adresses.INTRO_VIEW_3_CONTENT:
              'Il vous suffit de vous authentifier !',
          Adresses.INTRO_VIEW_SKIP: 'Passer',
          Adresses.INTRO_VIEW_NEXT: 'Suivant',
          Adresses.LOGIN_FORM_VIEW_TITLE:
              'Bienvenue !\nVeuillez vous connecter.',
          Adresses.LOGIN_FORM_VIEW_ID: 'Entrez votre identifiant',
          Adresses.LOGIN_FORM_VIEW_ID_VALIDATOR:
              'L\'identifiant doit être plus long',
          Adresses.LOGIN_FORM_VIEW_PASSWORD: 'Entrez un mot de passe',
          Adresses.LOGIN_FORM_VIEW_PASSWORD_VALIDATOR:
              'Le mot de passe doit être plus long',
          Adresses.LOGIN_FORM_VIEW_NO_ACCOUNT: 'Pas encore de compte ? ',
          Adresses.LOGIN_FORM_VIEW_SWITCH: 'S\'inscrire',
          Adresses.LOGIN_FORM_VIEW_BUTTON: 'Soumettre',
          Adresses.LOGIN_CONT_ERROR_TITLE: 'Connexion échouée',
          Adresses.LOGIN_CONT_ERROR_CONTENT:
              'Identifiants invalides, veuillez réessayer.',
          Adresses.REGISTER_FORM_VIEW_TITLE: 'Bienvenue !\nCréez votre profil.',
          Adresses.REGISTER_FORM_VIEW_NAME: 'Entrez un nom',
          Adresses.REGISTER_FORM_VIEW_NAME_VALIDATOR:
              'Le nom doit être plus long',
          Adresses.REGISTER_FORM_VIEW_EMAIL: 'Entrez un email',
          Adresses.REGISTER_FORM_VIEW_EMAIL_VALIDATOR:
              'L\'email doit être plus long',
          Adresses.REGISTER_FORM_VIEW_PASSWORD: 'Entrez un mot de passe',
          Adresses.REGISTER_FORM_VIEW_PASSWORD_VALIDATOR:
              'Le mot de passe doit être plus long',
          Adresses.REGISTER_FORM_VIEW_ALREADY_ACCOUNT: 'Déjà un compte ? ',
          Adresses.REGISTER_FORM_VIEW_SWITCH: 'Se connecter',
          Adresses.REGISTER_FORM_VIEW_BUTTON: 'Soumettre',
          Adresses.REGISTER_CONT_ERROR_TITLE: 'Inscription échouée',
          Adresses.REGISTER_CONT_ERROR_CONTENT:
              'Nom ou email déjà utilisé, veuillez réessayer.',
          Adresses.OTP_VIEW_TITLE: 'Vérification de l\'email',
          Adresses.OTP_VIEW_CONTENT:
              'Entrez le code à 6 chiffres envoyé à votre adresse',
          Adresses.OTP_VIEW_BUTTON: 'Soumettre',
          Adresses.OTP_VIEW_RESEND: 'Vous n\'avez pas reçu le code ? ',
          Adresses.OTP_CONT_SEND_TITLE: 'Compte créé avec succès !',
          Adresses.OTP_CONT_SEND_CONTENT:
              'Vous pouvez désormais utiliser ces identifiants.',
          Adresses.OTP_CONT_SEND_401: 'Code invalide, veuillez réessayer.',
          Adresses.OTP_CONT_SEND_402: 'Code expiré, veuillez réessayer.',
          Adresses.OTP_CONT_SEND_404:
              'Utilisateur introuvable, veuillez vous inscrire à nouveau.',
          Adresses.OTP_CONT_RESEND_TITLE: 'Code envoyé !',
          Adresses.OTP_CONT_RESEND_CONTENT:
              'Veuillez vérifier votre boîte mail et vos spams.',
          Adresses.OTP_CONT_RESEND_401:
              'L\'utilisateur a été supprimé, veuillez vous réinscrire.',
          Adresses.OTP_CONT_RESEND_404:
              'Utilisateur introuvable, veuillez vous inscrire à nouveau.',
          Adresses.NAVIGATION_VIEW_HOME: 'Accueil',
          Adresses.NAVIGATION_VIEW_CALENDAR: 'Calendrier',
          Adresses.NAVIGATION_VIEW_FORMS: 'Formulaires',
          Adresses.NAVIGATION_VIEW_SETTINGS: 'Paramètres',
          Adresses.DRAWER_VIEW_HOME: 'Accueil',
          Adresses.DRAWER_VIEW_ABOUT: 'À propos',
          Adresses.DRAWER_VIEW_CONTACT: 'Contact',
          Adresses.DRAWER_VIEW_LANG: 'Langue',
          Adresses.DRAWER_VIEW_SETTINGS: 'Paramètres',
          Adresses.DRAWER_VIEW_LOGOUT: 'Se déconnecter',
          Adresses.HOME_VIEW_TITLE: 'La page d\'accueil fonctionne (debug)',
          Adresses.SETTINGS_VIEW_TITLE:
              'La page des paramètres fonctionne (debug)',
        }
      };
}
