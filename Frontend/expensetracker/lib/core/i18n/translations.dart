import 'package:get/get.dart';

class ExpenseTrackerTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'error-title': 'Error occurred',
          'ok': 'OK',
          'send_code-title': 'Code sent!',
          'send_code-body': 'Please check your mailbox and your spams.',
          'create_account-title': 'Account created successfully!',
          'create_account-body': 'You can now use these credentials.',
          'no_response_server': 'No response from the server',
          'check_connexion': 'Please check your connection and try again.',
          'app-title': 'Expense Tracker App',
          'login-title': 'Welcome!\nPlease log in.',
          'login-id': 'Enter your ID',
          'login-id_validator': 'ID needs to be longer',
          'login-password': 'Enter a password',
          'login-password_validator': 'Password needs to be longer',
          'login-no_account': 'No account yet? ',
          'login-text': 'Register',
          'login-button': 'Submit',
          'register-title': 'Welcome!\nCreate your profile.',
          'register-name': 'Enter a name',
          'register-name_validator': 'Name needs to be longer',
          'register-email': 'Enter an email',
          'register-email_validator': 'Email needs to be longer',
          'register-password': 'Enter a password',
          'register-password_validator': 'Password needs to be longer',
          'register-already_account': 'Already have an account? ',
          'register-text': 'Log in',
          'register-button': 'Submit',
          'intro-1_title': 'A student project',
          'intro-1_text': 'Expense Tracker is first and foremost a student '
              'project, any feedback is welcome!',
          'intro-2_title': 'Activity tracking',
          'intro-2_text': 'Simply track your expenses and establish schedules '
              'and dashboards',
          'intro-3_title': 'Personal account',
          'intro-3_text': 'You just have to authenticate yourself!',
          'intro-skip': 'Skip',
          'intro-next': 'Next',
          'network-title': 'Offline',
          'network-text': 'You don\'t seem to be connected to the internet. '
              'Please check your connection.',
          'network-button': 'Try again',
          'otp-title': 'Email verification',
          'otp-text': 'Enter the 6-digit code sent to your address',
          'otp-button': 'Submit',
          'otp-resend': 'Didn\'t receive the code? ',
          'splash-title': 'Expense Tracker',
          'unknown-title': 'Address not found',
          'unknown-text': 'The page you are looking for does not exist',
          'unknown-button': 'Back to home',
          'drawer-home': 'Home',
          'drawer-about': 'About',
          'drawer-contact': 'Contact',
          'drawer-settings': 'Settings',
          'drawer-logout': 'Log out',
          'login-error_title': 'Login failed',
          'login-error_content': 'Invalid credentials, please try again.',
          'home-title': 'Expense Tracker',
          'drawer-lang': 'Language',
          'register-error_title': 'Registration failed',
          'register-error_content': 'Name or email already used, please try '
              'again.',
          'server_down-title': 'Server down',
          'server_down-text': 'The server is currently unavailable.'
              ' We are trying our best to put it back on.'
              ' Please try again later.',
          'server_down-button': 'Try again',
          'failure-resend_code_401':
              'User has been deleted, please register again.',
          'failure-resend_code_404': 'User not found, please register again.',
          'failure-send_code_401': 'Invalid code, please try again.',
          'failure-send_code_402': 'Code expired, please try again.',
          'failure-send_code_404': 'User not found, please register again.',
        },
        'fr_FR': {
          'error-title': 'Erreur survenue',
          'ok': 'OK',
          'send_code-title': 'Code envoyé !',
          'send_code-body': 'Veuillez vérifier votre boîte mail et vos spams.',
          'create_account-title': 'Compte créé avec succès !',
          'create_account-body':
              'Vous pouvez désormais utiliser ces identifiants.',
          'no_response_server': 'Pas de réponse du serveur',
          'check_connexion': 'Veuillez vérifier votre connexion et réessayer.',
          'app-title': 'Expense Tracker App',
          'login-title': 'Bienvenue ! Authentifiez-vous',
          'login-id': 'Entrez un identifiant',
          'login-id_validator': 'L\'identifiant doit être plus long',
          'login-password': 'Entrez un mot de passe',
          'login-password_validator': 'Le mot de passe doit être plus long',
          'login-no_account': 'Pas encore de compte ?',
          'login-text': 'S\'inscrire',
          'login-button': 'Envoyer',
          'register-title': 'Bienvenue !\nCréez votre utilisateur.',
          'register-name': 'Entrez un nom',
          'register-name_validator': 'Le nom doit être plus long',
          'register-email': 'Entrez un email',
          'register-email_validator': 'L\'email doit être plus long',
          'register-password': 'Entrez un mot de passe',
          'register-password_validator': 'Le mot de passe doit être plus long',
          'register-already_account': 'Déjà un compte ?',
          'register-text': 'Se connecter',
          'register-button': 'Envoyer',
          'intro-1_title': 'Un projet étudiant',
          'intro-1_text': 'Expense Tracker est avant tout un projet étudiant,'
              ' tout retour est bienvenu !',
          'intro-2_title': 'Suivi d\'activités',
          'intro-2_text': 'Suivez simplement vos dépenses et établissez '
              'plannings et dashboards',
          'intro-3_title': 'Compte personnel',
          'intro-3_text': 'Il ne vous reste plus qu\'à vous authentifier !',
          'intro-skip': 'Passer',
          'intro-next': 'Suivant',
          'network-title': 'Hors-ligne',
          'network-text': 'Vous ne semblez pas être connecté à internet. '
              'Veuillez vérifier votre connexion.',
          'network-button': 'Réessayer',
          'otp-title': 'Vérification de l\'e-mail',
          'otp-text': 'Entrez le code à 6 chiffres envoyé à votre adresse',
          'otp-button': 'Envoyer',
          'otp-resend': 'Vous n\'avez pas reçu le code ?',
          'splash-title': 'Expense Tracker',
          'unknown-title': 'Adresse introuvable',
          'unknown-text': 'La page que vous recherchez n\'existe pas',
          'unknown-button': 'Revenir à l\'accueil',
          'drawer-home': 'Accueil',
          'drawer-about': 'À propos',
          'drawer-contact': 'Contact',
          'drawer-settings': 'Paramètres',
          'drawer-logout': 'Déconnexion',
          'login-error_title': 'Échec de la connexion',
          'login-error_content': 'Identifiants invalides, veuillez réessayer.',
          'home-title': 'Expense Tracker',
          'drawer-lang': 'Langue',
          'register-error_title': 'Échec de l\'inscription',
          'register-error_content': 'Nom ou adresse mail déjà utilisés,'
              ' veuillez réessayer.',
          'server_down-title': 'Serveur indisponible',
          'server_down-text': 'Le serveur est actuellement indisponible.'
              ' Nous faisons de notre mieux pour le remettre en route.'
              ' Veuillez réessayer plus tard.',
          'server_down-button': 'Réessayer',
          'failure-resend_code_401': 'L\'utilisateur a été supprimé,'
              ' veuillez vous inscrire à nouveau.',
          'failure-resend_code_404': 'Utilisateur introuvable,'
              ' veuillez vous inscrire à nouveau.',
          'failure-send_code_401': 'Code invalide, veuillez réessayer.',
          'failure-send_code_402': 'Code expiré, veuillez réessayer.',
          'failure-send_code_404': 'Utilisateur introuvable,'
              ' veuillez vous inscrire à nouveau.',
        },
      };
}
