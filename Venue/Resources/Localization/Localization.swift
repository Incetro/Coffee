// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  /// Update bundle if you need to change app language
  static var bundle: Bundle?
  /// Отмена
  static var cancel: String {
    L10n.tr("Localizable", "cancel")
  }
  /// Готово
  static var done: String {
    L10n.tr("Localizable", "done")
  }
  /// Редактировать
  static var edit: String {
    L10n.tr("Localizable", "edit")
  }
  /// Нет
  static var no: String {
    L10n.tr("Localizable", "no")
  }
  /// Ок
  static var ok: String {
    L10n.tr("Localizable", "ok")
  }
  /// Открыть
  static var `open`: String {
    L10n.tr("Localizable", "open")
  }
  /// Удалить
  static var remove: String {
    L10n.tr("Localizable", "remove")
  }
  /// Повторить
  static var retry: String {
    L10n.tr("Localizable", "retry")
  }
  /// Да
  static var yes: String {
    L10n.tr("Localizable", "yes")
  }

  enum AboutApp {
    /// Лицензионное соглашение
    static var licenseAgreement: String {
      L10n.tr("Localizable", "about-app.license-agreement")
    }
    /// Политика конфиденциальности
    static var privacyPolicy: String {
      L10n.tr("Localizable", "about-app.privacy-policy")
    }
    /// Версия %@ от %@
    static func releaseInfo(_ p1: String, _ p2: String) -> String {
      L10n.tr("Localizable", "about-app.release-info", p1, p2)
    }
    /// Сайт appname.app
    static var website: String {
      L10n.tr("Localizable", "about-app.website")
    }

    enum Update {
      /// У Вас последняя версия
      static var ok: String {
        L10n.tr("Localizable", "about-app.update.ok")
      }
      /// Обновить сейчас
      static var possible: String {
        L10n.tr("Localizable", "about-app.update.possible")
      }
    }
  }

  enum Alert {

    enum CodeVerification {

      enum StopVerificationProcess {
        /// Вы действительно хотите остановить процесс верификации?
        static var title: String {
          L10n.tr("Localizable", "alert.code-verification.stop-verification-process.title")
        }

        enum Actions {
          /// Продолжить
          static var `continue`: String {
            L10n.tr("Localizable", "alert.code-verification.stop-verification-process.actions.continue")
          }
        }
      }
    }

    enum SignIn {

      enum InvalidPhoneNumber {
        /// Неправильный номер телефона. Пожалуйста, введите заново.
        static var message: String {
          L10n.tr("Localizable", "alert.sign-in.invalid-phone-number.message")
        }
      }
    }
  }

  enum CodeVerification {

    enum ActionButton {

      enum Title {
        /// Отправить заново через %@
        static func interval(_ p1: String) -> String {
          L10n.tr("Localizable", "code-verification.action-button.title.interval", p1)
        }
        /// Забыли пароль?
        static var remind: String {
          L10n.tr("Localizable", "code-verification.action-button.title.remind")
        }
        /// Отправить код заново
        static var resend: String {
          L10n.tr("Localizable", "code-verification.action-button.title.resend")
        }
      }
    }

    enum Description {
      /// Мы отправим на Ваш номер проверочный код для сброса пароля
      static var forgotPassword: String {
        L10n.tr("Localizable", "code-verification.description.forgot-password")
      }
      /// Пожалуйста, введите новый пароль для входа
      static var newPassword: String {
        L10n.tr("Localizable", "code-verification.description.new-password")
      }
      /// Пожалуйста, введите Ваш пароль
      static var password: String {
        L10n.tr("Localizable", "code-verification.description.password")
      }
      /// Пароль успешно изменён
      static var passwordHasBeenChanged: String {
        L10n.tr("Localizable", "code-verification.description.password-has-been-changed")
      }
      /// Придумайте пароль для входа
      static var signUpPassword: String {
        L10n.tr("Localizable", "code-verification.description.sign-up-password")
      }
      /// Введите код, отправленный на Ваш номер\n%@
      static func sms(_ p1: String) -> String {
        L10n.tr("Localizable", "code-verification.description.sms", p1)
      }
    }

    enum Errors {
      /// Вы ввели неправильный код. Пожалуйста, попробуйте ещё раз.
      static var codeIncorrect: String {
        L10n.tr("Localizable", "code-verification.errors.code-incorrect")
      }
    }
  }

  enum EditProfile {
    /// Изменить пароль
    static var changePassword: String {
      L10n.tr("Localizable", "edit-profile.change-password")
    }
    /// Готово
    static var done: String {
      L10n.tr("Localizable", "edit-profile.done")
    }
    /// Выйти
    static var logout: String {
      L10n.tr("Localizable", "edit-profile.logout")
    }
    /// Профиль
    static var title: String {
      L10n.tr("Localizable", "edit-profile.title")
    }
  }

  enum Errors {
    /// Ошибка
    static var error: String {
      L10n.tr("Localizable", "errors.error")
    }
    /// Неизвестная ошибка
    static var unknown: String {
      L10n.tr("Localizable", "errors.unknown")
    }
  }

  enum Languages {

    enum English {
      /// Английский
      static var name: String {
        L10n.tr("Localizable", "languages.english.name")
      }
      /// English
      static var title: String {
        L10n.tr("Localizable", "languages.english.title")
      }
    }

    enum Russian {
      /// Русский
      static var name: String {
        L10n.tr("Localizable", "languages.russian.name")
      }
      /// Русский
      static var title: String {
        L10n.tr("Localizable", "languages.russian.title")
      }
    }
  }

  enum MinVersion {
    /// В последних обновлениях мы внесли новые изменения, которые не поддерживаются в Вашей версии. В связи с этим необходимо обновить приложение.
    static var message: String {
      L10n.tr("Localizable", "min-version.message")
    }
    /// Необходимо обновление
    static var title: String {
      L10n.tr("Localizable", "min-version.title")
    }
    /// Обновить
    static var updateButtonTitle: String {
      L10n.tr("Localizable", "min-version.update-button-title")
    }
  }

  enum Settings {
    /// Настройки
    static var title: String {
      L10n.tr("Localizable", "settings.title")
    }

    enum AboutApp {
      /// О приложении
      static var title: String {
        L10n.tr("Localizable", "settings.about-app.title")
      }
    }

    enum Account {
      /// Сменить пароль
      static var changePassword: String {
        L10n.tr("Localizable", "settings.account.change-password")
      }
      /// Очистить кэш
      static var clearCache: String {
        L10n.tr("Localizable", "settings.account.clear-cache")
      }
      /// Войти
      static var login: String {
        L10n.tr("Localizable", "settings.account.login")
      }
      /// Выйти
      static var logout: String {
        L10n.tr("Localizable", "settings.account.logout")
      }
    }

    enum Language {
      /// Язык
      static var title: String {
        L10n.tr("Localizable", "settings.language.title")
      }
    }

    enum Notifications {
      /// Уведомления
      static var title: String {
        L10n.tr("Localizable", "settings.notifications.title")
      }
    }

    enum Support {
      /// Написать в поддержку
      static var title: String {
        L10n.tr("Localizable", "settings.support.title")
      }
    }

    enum Themes {
      /// Темы
      static var title: String {
        L10n.tr("Localizable", "settings.themes.title")
      }
    }
  }

  enum SignIn {
    /// Пожалуйста, введите свою почту
    static var description: String {
      L10n.tr("Localizable", "sign-in.description")
    }
    /// Продолжить
    static var signInButton: String {
      L10n.tr("Localizable", "sign-in.sign-in-button")
    }
    /// Добро пожаловать в\nVenue!
    static var welcomeTitle: String {
      L10n.tr("Localizable", "sign-in.welcome-title")
    }

    enum Errors {
      /// Некорректная почта. Попробуйте ещё раз.
      static var invalidPhoneNumber: String {
        L10n.tr("Localizable", "sign-in.errors.invalid-phone-number")
      }
    }

    enum Placeholders {
      /// Адрес почты
      static var login: String {
        L10n.tr("Localizable", "sign-in.placeholders.login")
      }
    }
  }

  enum SignUp {
    /// Осталось всего несколько шагов.
    static var description: String {
      L10n.tr("Localizable", "sign-up.description")
    }
    /// Продолжить
    static var signUpButton: String {
      L10n.tr("Localizable", "sign-up.sign-up-button")
    }
    /// Регистрация
    static var title: String {
      L10n.tr("Localizable", "sign-up.title")
    }

    enum Footnote {
      /// Политикой конфиденциальности
      static var privacyPolicy: String {
        L10n.tr("Localizable", "sign-up.footnote.privacy-policy")
      }
      /// Условиями обслуживания
      static var termsOfService: String {
        L10n.tr("Localizable", "sign-up.footnote.terms-of-service")
      }
      /// Регистрируясь, вы соглашаетесь с нашими Условиями обслуживания и Политикой конфиденциальности.
      static var title: String {
        L10n.tr("Localizable", "sign-up.footnote.title")
      }
    }

    enum Nickname {
      /// недоступно
      static var unavailable: String {
        L10n.tr("Localizable", "sign-up.nickname.unavailable")
      }
    }

    enum Placeholders {
      /// Имя
      static var name: String {
        L10n.tr("Localizable", "sign-up.placeholders.name")
      }
      /// Никнейм
      static var nickname: String {
        L10n.tr("Localizable", "sign-up.placeholders.nickname")
      }
    }
  }

  enum Support {

    enum ChooseMailClient {
      /// Выберите, пожалуйста, любой из этих клиентов для связи с поддержкой:
      static var message: String {
        L10n.tr("Localizable", "support.choose-mail-client.message")
      }
      /// Подтверждение
      static var title: String {
        L10n.tr("Localizable", "support.choose-mail-client.title")
      }
    }

    enum Unavailable {
      /// На вашем устройстве не авторизована почта Mail.
      static var message: String {
        L10n.tr("Localizable", "support.unavailable.message")
      }
      /// Ошибка
      static var title: String {
        L10n.tr("Localizable", "support.unavailable.title")
      }
    }
  }

  enum Themes {
    /// Системная тема
    static var systemChange: String {
      L10n.tr("Localizable", "themes.system-change")
    }
    /// Темы
    static var title: String {
      L10n.tr("Localizable", "themes.title")
    }

    enum Types {
      /// Тёмная
      static var dark: String {
        L10n.tr("Localizable", "themes.types.dark")
      }
      /// Светлая
      static var light: String {
        L10n.tr("Localizable", "themes.types.light")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: bundle ?? Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
