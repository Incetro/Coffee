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
  /// Выберите действие
  static var chooseYourAction: String {
    L10n.tr("Localizable", "choose-your-action")
  }
  /// Очистить
  static var clear: String {
    L10n.tr("Localizable", "clear")
  }
  /// incetro@ya.ru
  static var contactEmail: String {
    L10n.tr("Localizable", "contact-email")
  }
  /// %@ %@
  static func distance(_ p1: String, _ p2: String) -> String {
    L10n.tr("Localizable", "distance", p1, p2)
  }
  /// Готово
  static var done: String {
    L10n.tr("Localizable", "done")
  }
  /// Редактировать
  static var edit: String {
    L10n.tr("Localizable", "edit")
  }
  /// км
  static var kilometers: String {
    L10n.tr("Localizable", "kilometers")
  }
  /// км/ч
  static var kmh: String {
    L10n.tr("Localizable", "kmh")
  }
  /// м
  static var meters: String {
    L10n.tr("Localizable", "meters")
  }
  /// Далее
  static var next: String {
    L10n.tr("Localizable", "next")
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
  /// Поделиться
  static var share: String {
    L10n.tr("Localizable", "share")
  }
  /// %@ %@
  static func speed(_ p1: String, _ p2: String) -> String {
    L10n.tr("Localizable", "speed", p1, p2)
  }
  /// Старт
  static var start: String {
    L10n.tr("Localizable", "start")
  }
  /// Стоп
  static var stop: String {
    L10n.tr("Localizable", "stop")
  }
  /// Сегодня
  static var today: String {
    L10n.tr("Localizable", "today")
  }
  /// Внимание
  static var warning: String {
    L10n.tr("Localizable", "warning")
  }
  /// Да
  static var yes: String {
    L10n.tr("Localizable", "yes")
  }

  enum _3dShortcus {
    /// Создать маршрут
    static var createRoute: String {
      L10n.tr("Localizable", "3d-shortcus.create-route")
    }
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

  enum Agreement {

    enum PrivacyPolicy {
      /// Политика конфиденциальности
      static var title: String {
        L10n.tr("Localizable", "agreement.privacy-policy.title")
      }
    }

    enum TermsOfService {
      /// Условия обсдуживания
      static var title: String {
        L10n.tr("Localizable", "agreement.terms-of-service.title")
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

    enum LocationAlways {

      enum Design {
        /// Чтобы создать маршрут и определять местоположение, пожалуйста, выберите пункт «Всегда» в настройках геопозиции Coffee.
        static var description: String {
          L10n.tr("Localizable", "alert.location-always.design.description")
        }
        /// Разрешите доступ к геопозиции для построения маршрута
        static var title: String {
          L10n.tr("Localizable", "alert.location-always.design.title")
        }
      }

      enum Driving {
        /// Чтобы стартовать по маршруту и определять местоположение, пожалуйста, выберите пункт «Всегда» в настройках геопозиции Coffee.
        static var description: String {
          L10n.tr("Localizable", "alert.location-always.driving.description")
        }
        /// Разрешите доступ к геопозиции для старта по маршруту
        static var title: String {
          L10n.tr("Localizable", "alert.location-always.driving.title")
        }
      }

      enum Routes {
        /// Чтобы увидеть треки поблизости и определять местоположение, пожалуйста, выберите пункт «Всегда» в настройках геопозиции Coffee.
        static var description: String {
          L10n.tr("Localizable", "alert.location-always.routes.description")
        }
        /// Пожалуйста, разрешите доступ к геопозиции для того, чтоб мы показали вам треки поблизости.
        static var title: String {
          L10n.tr("Localizable", "alert.location-always.routes.title")
        }
      }
    }

    enum LocationBase {
      /// Пожалуйста, разрешите доступ к геопозиции, чтобы Coffee определял ваше местоположение.
      static var description: String {
        L10n.tr("Localizable", "alert.location-base.description")
      }
      /// Разрешите доступ к геопозиции
      static var title: String {
        L10n.tr("Localizable", "alert.location-base.title")
      }
    }

    enum Notifications {
      /// Пожалуйста, разрешите Coffee присылать вам полезные уведомления.
      static var description: String {
        L10n.tr("Localizable", "alert.notifications.description")
      }
      /// Разрешите доступ к уведомлениям
      static var title: String {
        L10n.tr("Localizable", "alert.notifications.title")
      }
    }

    enum RouteCancelled {

      enum Permissions {
        /// Маршрут «%@» был отменен так как вы запретили доступ к геопозици в настройках. Пожалуйста, не делайте этого в момент прохождения маршрута.
        static func description(_ p1: String) -> String {
          L10n.tr("Localizable", "alert.route-cancelled.permissions.description", p1)
        }
        /// Маршрут был принудительно отменен
        static var title: String {
          L10n.tr("Localizable", "alert.route-cancelled.permissions.title")
        }
      }

      enum SpeedLimit {
        /// Маршрут «%@» был отменен так как вы превысили допустимую скорость %@. Пожалуйста, не делайте этого, когда на маршруте установлено ограничение.
        static func description(_ p1: String, _ p2: String) -> String {
          L10n.tr("Localizable", "alert.route-cancelled.speed-limit.description", p1, p2)
        }
        /// Маршрут был принудительно отменен
        static var title: String {
          L10n.tr("Localizable", "alert.route-cancelled.speed-limit.title")
        }
      }

      enum Timeout {
        /// Маршрут «%@» был отменен так как вы вышли из приложения. Пожалуйста, не выходите из приложения в момент прохождения маршрута.
        static func description(_ p1: String) -> String {
          L10n.tr("Localizable", "alert.route-cancelled.timeout.description", p1)
        }
        /// Маршрут был принудительно отменен
        static var title: String {
          L10n.tr("Localizable", "alert.route-cancelled.timeout.title")
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

    enum SignUp {

      enum StopRegistrationProcess {
        /// Вы действительно хотите прекратить регистрацию?
        static var title: String {
          L10n.tr("Localizable", "alert.sign-up.stop-registration-process.title")
        }

        enum Actions {
          /// Продолжить
          static var `continue`: String {
            L10n.tr("Localizable", "alert.sign-up.stop-registration-process.actions.continue")
          }
        }
      }
    }
  }

  enum Appearance {

    enum Section {
      /// Тема оформления
      static var appearance: String {
        L10n.tr("Localizable", "appearance.section.appearance")
      }
      /// Цвет
      static var color: String {
        L10n.tr("Localizable", "appearance.section.color")
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

  enum Comments {
    /// Комментарии
    static var title: String {
      L10n.tr("Localizable", "comments.title")
    }
  }

  enum ContextMenu {
    /// Комментарии
    static var comments: String {
      L10n.tr("Localizable", "context-menu.comments")
    }
    /// Редактировать
    static var edit: String {
      L10n.tr("Localizable", "context-menu.edit")
    }
    /// Пожаловаться
    static var report: String {
      L10n.tr("Localizable", "context-menu.report")
    }
    /// Настройки
    static var settings: String {
      L10n.tr("Localizable", "context-menu.settings")
    }
    /// Поделиться
    static var share: String {
      L10n.tr("Localizable", "context-menu.share")
    }
  }

  enum Countries {
    /// Выбор страны
    static var title: String {
      L10n.tr("Localizable", "countries.title")
    }

    enum Empty {
      /// Введите имя любой страны
      static var initial: String {
        L10n.tr("Localizable", "countries.empty.initial")
      }
      /// Ничего не найдено
      static var search: String {
        L10n.tr("Localizable", "countries.empty.search")
      }
    }

    enum Limit {
      /// Вы можете выбрать не более %@ стран для поиска.
      static func description(_ p1: String) -> String {
        L10n.tr("Localizable", "countries.limit.description", p1)
      }
      /// Максимальное количество стран
      static var title: String {
        L10n.tr("Localizable", "countries.limit.title")
      }
    }
  }

  enum CountryCode {
    /// Код страны
    static var title: String {
      L10n.tr("Localizable", "country-code.title")
    }
  }

  enum Date {
    /// %@ назад
    static func ago(_ p1: String) -> String {
      L10n.tr("Localizable", "date.ago", p1)
    }
  }

  enum EditProfile {
    /// О себе
    static var bio: String {
      L10n.tr("Localizable", "edit-profile.bio")
    }
    /// День рождения
    static var birthday: String {
      L10n.tr("Localizable", "edit-profile.birthday")
    }
    /// Изменить пароль
    static var changePassword: String {
      L10n.tr("Localizable", "edit-profile.change-password")
    }
    /// Город
    static var city: String {
      L10n.tr("Localizable", "edit-profile.city")
    }
    /// Готово
    static var done: String {
      L10n.tr("Localizable", "edit-profile.done")
    }
    /// Пол
    static var gender: String {
      L10n.tr("Localizable", "edit-profile.gender")
    }
    /// Выйти
    static var logout: String {
      L10n.tr("Localizable", "edit-profile.logout")
    }
    /// Имя
    static var name: String {
      L10n.tr("Localizable", "edit-profile.name")
    }
    /// Не указан
    static var notSet: String {
      L10n.tr("Localizable", "edit-profile.not-set")
    }
    /// Профиль
    static var title: String {
      L10n.tr("Localizable", "edit-profile.title")
    }
    /// Транспорт
    static var transport: String {
      L10n.tr("Localizable", "edit-profile.transport")
    }
    /// Никнейм
    static var username: String {
      L10n.tr("Localizable", "edit-profile.username")
    }

    enum Avatar {
      /// Камера
      static var camera: String {
        L10n.tr("Localizable", "edit-profile.avatar.camera")
      }
      /// Галерея
      static var gallery: String {
        L10n.tr("Localizable", "edit-profile.avatar.gallery")
      }
      /// Выберите опцию
      static var title: String {
        L10n.tr("Localizable", "edit-profile.avatar.title")
      }
    }

    enum Cover {
      /// Удалить
      static var remove: String {
        L10n.tr("Localizable", "edit-profile.cover.remove")
      }
      /// Добавить фон
      static var title: String {
        L10n.tr("Localizable", "edit-profile.cover.title")
      }
    }

    enum Gender {
      /// Женский
      static var female: String {
        L10n.tr("Localizable", "edit-profile.gender.female")
      }
      /// Мужской
      static var male: String {
        L10n.tr("Localizable", "edit-profile.gender.male")
      }
      /// Другое
      static var other: String {
        L10n.tr("Localizable", "edit-profile.gender.other")
      }
    }
  }

  enum Errors {
    /// Ошибка
    static var error: String {
      L10n.tr("Localizable", "errors.error")
    }
    /// Расстояние между крайними точками должно быть не менее %@ метров.
    static func incorrectPointsDistance(_ p1: String) -> String {
      L10n.tr("Localizable", "errors.incorrect-points-distance", p1)
    }
    /// Неизвестная ошибка
    static var unknown: String {
      L10n.tr("Localizable", "errors.unknown")
    }
  }

  enum ExperienceRating {
    /// Мир
    static var allTimeTab: String {
      L10n.tr("Localizable", "experience-rating.all-time-tab")
    }
    /// Выберите город
    static var chooseCity: String {
      L10n.tr("Localizable", "experience-rating.choose-city")
    }
    /// Выберите страну
    static var chooseCountry: String {
      L10n.tr("Localizable", "experience-rating.choose-country")
    }
    /// Город
    static var cityTab: String {
      L10n.tr("Localizable", "experience-rating.city-tab")
    }
    /// Новый
    static var new: String {
      L10n.tr("Localizable", "experience-rating.new")
    }
    /// %@, %@ 􀆈
    static func subtitle(_ p1: String, _ p2: String) -> String {
      L10n.tr("Localizable", "experience-rating.subtitle", p1, p2)
    }
    /// Зал славы
    static var title: String {
      L10n.tr("Localizable", "experience-rating.title")
    }
    /// Страна
    static var wholeWorldTab: String {
      L10n.tr("Localizable", "experience-rating.whole-world-tab")
    }

    enum EmptyExp {
      /// Данных по Вашему запросу нет
      static var city: String {
        L10n.tr("Localizable", "experience-rating.empty-exp.city")
      }
      /// Данных по Вашему запросу нет
      static var country: String {
        L10n.tr("Localizable", "experience-rating.empty-exp.country")
      }
    }

    enum Filter {
      /// Города
      static var cities: String {
        L10n.tr("Localizable", "experience-rating.filter.cities")
      }
      /// Страны
      static var countries: String {
        L10n.tr("Localizable", "experience-rating.filter.countries")
      }
      /// Период
      static var timePeriod: String {
        L10n.tr("Localizable", "experience-rating.filter.time-period")
      }
      /// Фильтр зала славы
      static var title: String {
        L10n.tr("Localizable", "experience-rating.filter.title")
      }

      enum TimePeriod {
        /// За всё время
        static var allTime: String {
          L10n.tr("Localizable", "experience-rating.filter.time-period.allTime")
        }
        /// Свой период
        static var custom: String {
          L10n.tr("Localizable", "experience-rating.filter.time-period.custom")
        }
        /// За день
        static var perDay: String {
          L10n.tr("Localizable", "experience-rating.filter.time-period.perDay")
        }
        /// За месяц
        static var perMonth: String {
          L10n.tr("Localizable", "experience-rating.filter.time-period.perMonth")
        }
        /// За неделю
        static var perWeek: String {
          L10n.tr("Localizable", "experience-rating.filter.time-period.perWeek")
        }
      }
    }
  }

  enum FinishRouteInfo {
    /// средняя скорость
    static var averageSpeed: String {
      L10n.tr("Localizable", "finish-route-info.average-speed")
    }
    /// %@ от @%@
    static func info(_ p1: String, _ p2: String) -> String {
      L10n.tr("Localizable", "finish-route-info.info", p1, p2)
    }
    /// максимальная скорость
    static var maxSpeed: String {
      L10n.tr("Localizable", "finish-route-info.max-speed")
    }
  }

  enum Follow {
    /// млрд.
    static var b: String {
      L10n.tr("Localizable", "follow.b")
    }
    /// тыс.
    static var k: String {
      L10n.tr("Localizable", "follow.k")
    }
    /// млн.
    static var m: String {
      L10n.tr("Localizable", "follow.m")
    }
  }

  enum Followance {
    /// Подписан
    static var followed: String {
      L10n.tr("Localizable", "followance.followed")
    }
    /// Подписчики
    static var followers: String {
      L10n.tr("Localizable", "followance.followers")
    }
    /// Подписки
    static var following: String {
      L10n.tr("Localizable", "followance.following")
    }
    /// Друзья
    static var mutual: String {
      L10n.tr("Localizable", "followance.mutual")
    }

    enum Alerts {

      enum Unfollow {
        /// Вы уверены, что хотите отписаться от %@?
        static func title(_ p1: String) -> String {
          L10n.tr("Localizable", "followance.alerts.unfollow.title", p1)
        }
      }
    }

    enum Status {
      /// Подписаться
      static var follow: String {
        L10n.tr("Localizable", "followance.status.follow")
      }
      /// Подписки
      static var following: String {
        L10n.tr("Localizable", "followance.status.following")
      }
      /// Друзья
      static var mutual: String {
        L10n.tr("Localizable", "followance.status.mutual")
      }
    }
  }

  enum HistoryRollup {

    enum Title {
      /// Моя история
      static var mine: String {
        L10n.tr("Localizable", "history-rollup.title.mine")
      }
      /// История %@
      static func someones(_ p1: String) -> String {
        L10n.tr("Localizable", "history-rollup.title.someones", p1)
      }
    }
  }

  enum Languages {

    enum Deutsch {
      /// Немецкий
      static var name: String {
        L10n.tr("Localizable", "languages.deutsch.name")
      }
      /// Deutsch
      static var title: String {
        L10n.tr("Localizable", "languages.deutsch.title")
      }
    }

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

  enum Markers {

    enum Standard {
      /// Стандартный
      static var name: String {
        L10n.tr("Localizable", "markers.standard.name")
      }
    }

    enum TheRun {
      /// Coffee
      static var name: String {
        L10n.tr("Localizable", "markers.the-run.name")
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

  enum Notifications {
    /// Если вы не откроете приложение в течение %@ минут, маршрут будет автоматически аннулирован.
    static func routeWillBeFinished(_ p1: String) -> String {
      L10n.tr("Localizable", "notifications.route-will-be-finished", p1)
    }
    /// Уведомления
    static var title: String {
      L10n.tr("Localizable", "notifications.title")
    }

    enum Sections {

      enum Followance {
        /// Подписки
        static var title: String {
          L10n.tr("Localizable", "notifications.sections.followance.title")
        }
      }

      enum Track {
        /// Треки
        static var title: String {
          L10n.tr("Localizable", "notifications.sections.track.title")
        }
      }
    }

    enum Types {
      /// Новый подписчик
      static var newFollower: String {
        L10n.tr("Localizable", "notifications.types.new-follower")
      }
      /// Подсказки во время прохождения трека
      static var trackHints: String {
        L10n.tr("Localizable", "notifications.types.track-hints")
      }
    }
  }

  enum Onboarding {

    enum Compete {
      /// Передвигайтесь на любом виде транспорта для прохождения треков
      static var description: String {
        L10n.tr("Localizable", "onboarding.compete.description")
      }
      /// Соревнуйтесь
      static var title: String {
        L10n.tr("Localizable", "onboarding.compete.title")
      }
    }

    enum Create {
      /// Создавайте собственные треки с чек-поинтами и делитесь ими со всем миром
      static var description: String {
        L10n.tr("Localizable", "onboarding.create.description")
      }
      /// Создавайте треки на карте
      static var title: String {
        L10n.tr("Localizable", "onboarding.create.title")
      }
    }

    enum Win {
      /// Находите крутые треки и ставьте рекорды
      static var description: String {
        L10n.tr("Localizable", "onboarding.win.description")
      }
      /// Побеждайте
      static var title: String {
        L10n.tr("Localizable", "onboarding.win.title")
      }
    }
  }

  enum Recommended {
    /// Предложения и популярные треки будут доступны в скором времени. Пока что Вы можете воспользоваться поиском.
    static var stubText: String {
      L10n.tr("Localizable", "recommended.stub-text")
    }
  }

  enum Regions {
    /// Выбор города
    static var title: String {
      L10n.tr("Localizable", "regions.title")
    }

    enum Empty {
      /// Введите имя любого города
      static var initial: String {
        L10n.tr("Localizable", "regions.empty.initial")
      }
      /// Ничего не найдено
      static var search: String {
        L10n.tr("Localizable", "regions.empty.search")
      }
    }

    enum Limit {
      /// Вы можете выбрать не более %@ городов для поиска.
      static func description(_ p1: String) -> String {
        L10n.tr("Localizable", "regions.limit.description", p1)
      }
      /// Максимальное количество городов
      static var title: String {
        L10n.tr("Localizable", "regions.limit.title")
      }
    }
  }

  enum Route {
    /// Пройдите трек\nдля активации
    static var activation: String {
      L10n.tr("Localizable", "route.activation")
    }
    /// от @%@
    static func by(_ p1: String) -> String {
      L10n.tr("Localizable", "route.by", p1)
    }
    /// Ещё никто не завершил этот маршрут
    static var emptyFinished: String {
      L10n.tr("Localizable", "route.empty-finished")
    }
    /// События
    static var feed: String {
      L10n.tr("Localizable", "route.feed")
    }
    /// %@ на треке
    static func onTrack(_ p1: String) -> String {
      L10n.tr("Localizable", "route.on-track", p1)
    }

    enum Actions {
      /// Подписаться
      static var follow: String {
        L10n.tr("Localizable", "route.actions.follow")
      }
      /// Поехали!
      static var start: String {
        L10n.tr("Localizable", "route.actions.start")
      }
      /// Подписки
      static var unfollow: String {
        L10n.tr("Localizable", "route.actions.unfollow")
      }
    }

    enum Details {
      /// Сред. скорость
      static var averageSpeed: String {
        L10n.tr("Localizable", "route.details.average-speed")
      }
      /// Сред. время
      static var averageTime: String {
        L10n.tr("Localizable", "route.details.average-time")
      }
      /// Расстояние
      static var distance: String {
        L10n.tr("Localizable", "route.details.distance")
      }
      /// Подписчики
      static var followers: String {
        L10n.tr("Localizable", "route.details.followers")
      }
      /// Лимит
      static var limit: String {
        L10n.tr("Localizable", "route.details.limit")
      }
      /// Участники
      static var participants: String {
        L10n.tr("Localizable", "route.details.participants")
      }
      /// Рекорд
      static var record: String {
        L10n.tr("Localizable", "route.details.record")
      }
    }
  }

  enum RouteAmend {
    /// Лимит
    static var limit: String {
      L10n.tr("Localizable", "route-amend.limit")
    }
    /// Необходимо выбрать хотя бы 1 вид транспорта
    static var transportIsObligatory: String {
      L10n.tr("Localizable", "route-amend.transport-is-obligatory")
    }

    enum RemoveConfirmation {
      /// Вы уверены, что хотите удалить этот трек?
      static var title: String {
        L10n.tr("Localizable", "route-amend.remove-confirmation.title")
      }
    }

    enum RouteType {

      enum Mutual {
        /// Будет виден только по взаимной подписке.
        static var description: String {
          L10n.tr("Localizable", "route-amend.route-type.mutual.description")
        }
        /// Взаимный
        static var title: String {
          L10n.tr("Localizable", "route-amend.route-type.mutual.title")
        }
      }

      enum Private {
        /// Будет виден только Вам и пользователям, с которыми вы поделитесь этим треком
        static var description: String {
          L10n.tr("Localizable", "route-amend.route-type.private.description")
        }
        /// Закрытый
        static var title: String {
          L10n.tr("Localizable", "route-amend.route-type.private.title")
        }
      }

      enum Public {
        /// Будет виден всем.
        static var description: String {
          L10n.tr("Localizable", "route-amend.route-type.public.description")
        }
        /// Публичный
        static var title: String {
          L10n.tr("Localizable", "route-amend.route-type.public.title")
        }
      }
    }

    enum Title {
      /// Новый трек
      static var create: String {
        L10n.tr("Localizable", "route-amend.title.create")
      }
      /// Редактирование
      static var edit: String {
        L10n.tr("Localizable", "route-amend.title.edit")
      }
    }
  }

  enum RouteCell {
    /// Показать на карте
    static var seeOnTheMap: String {
      L10n.tr("Localizable", "route-cell.see-on-the-map")
    }
  }

  enum RouteDesigner {
    /// Сохранить
    static var save: String {
      L10n.tr("Localizable", "route-designer.save")
    }

    enum EnterRouteName {
      /// Пожалуйста, введите имя маршрута
      static var message: String {
        L10n.tr("Localizable", "route-designer.enter-route-name.message")
      }
    }

    enum Errors {
      /// Максимально возможное количество точек – 25
      static var maxPointsLimit: String {
        L10n.tr("Localizable", "route-designer.errors.max-points-limit")
      }
    }

    enum NewRoute {

      enum RouteType {
        /// Пожалуйста, выберите тип маршрута
        static var title: String {
          L10n.tr("Localizable", "route-designer.new-route.route-type.title")
        }
      }
    }

    enum Title {
      /// Новый маршрут
      static var newRoute: String {
        L10n.tr("Localizable", "route-designer.title.new-route")
      }
      /// Прросмотр маршрута
      static var routePreview: String {
        L10n.tr("Localizable", "route-designer.title.route-preview")
      }
    }

    enum Tutoring {
      /// Удерживайте палец на карте, чтобы добавить точку
      static var create: String {
        L10n.tr("Localizable", "route-designer.tutoring.create")
      }
      /// Удерживайте палец на точке, чтобы передвинуть её
      static var move: String {
        L10n.tr("Localizable", "route-designer.tutoring.move")
      }
      /// Нажмите на точку, чтобы удалить её
      static var remove: String {
        L10n.tr("Localizable", "route-designer.tutoring.remove")
      }
    }
  }

  enum RouteDirection {
    /// Вело транспорт
    static var cycling: String {
      L10n.tr("Localizable", "route-direction.cycling")
    }
    /// Отключить
    static var disabled: String {
      L10n.tr("Localizable", "route-direction.disabled")
    }
    /// Авто
    static var driving: String {
      L10n.tr("Localizable", "route-direction.driving")
    }
    /// Бег/Ходьба
    static var walking: String {
      L10n.tr("Localizable", "route-direction.walking")
    }
  }

  enum RouteDriving {
    /// %@%@ до старта
    static func beforeStarting(_ p1: String, _ p2: String) -> String {
      L10n.tr("Localizable", "route-driving.before-starting", p1, p2)
    }
    /// GO!
    static var go: String {
      L10n.tr("Localizable", "route-driving.go")
    }
    /// READY?
    static var ready: String {
      L10n.tr("Localizable", "route-driving.ready")
    }

    enum Alerts {

      enum SpeedViolationHelp {
        /// Скорость можно превышать не более %@ раз.
        static func description(_ p1: String) -> String {
          L10n.tr("Localizable", "route-driving.alerts.speed-violation-help.description", p1)
        }
        /// Превышение скорости
        static var title: String {
          L10n.tr("Localizable", "route-driving.alerts.speed-violation-help.title")
        }
      }
    }

    enum StopRouteAlert {
      /// Вы действительно хотите остановить движение по маршруту? Весь прогресс будет утерян.
      static var message: String {
        L10n.tr("Localizable", "route-driving.stop-route-alert.message")
      }
      /// Внимание!
      static var title: String {
        L10n.tr("Localizable", "route-driving.stop-route-alert.title")
      }
    }
  }

  enum RouteRating {
    /// 🏆 %@
    static func title(_ p1: String) -> String {
      L10n.tr("Localizable", "route-rating.title", p1)
    }
  }

  enum Routes {
    /// Ни один маршрут ещё не создан.
    static var empty: String {
      L10n.tr("Localizable", "routes.empty")
    }

    enum Filter {
      /// Города
      static var citites: String {
        L10n.tr("Localizable", "routes.filter.citites")
      }
      /// Ничего не найдено :(
      static var empty: String {
        L10n.tr("Localizable", "routes.filter.empty")
      }
      /// Макс. длина
      static var maxLengthTitle: String {
        L10n.tr("Localizable", "routes.filter.max-length-title")
      }
      /// Макс. время
      static var maxTravelTimeTitle: String {
        L10n.tr("Localizable", "routes.filter.max-travel-time-title")
      }
      /// Мин. длина
      static var minLengthTitle: String {
        L10n.tr("Localizable", "routes.filter.min-length-title")
      }
      /// Мин. время
      static var minTravelTimeTitle: String {
        L10n.tr("Localizable", "routes.filter.min-travel-time-title")
      }
      /// Только мои
      static var onlyMine: String {
        L10n.tr("Localizable", "routes.filter.only-mine")
      }
      /// Кол-во проездов
      static var passes: String {
        L10n.tr("Localizable", "routes.filter.passes")
      }
      /// Радиус от меня
      static var radiusTitle: String {
        L10n.tr("Localizable", "routes.filter.radius-title")
      }
      /// Фильтр маршрутов
      static var title: String {
        L10n.tr("Localizable", "routes.filter.title")
      }
      /// Транспорт
      static var transport: String {
        L10n.tr("Localizable", "routes.filter.transport")
      }
      /// Кол-во участников
      static var users: String {
        L10n.tr("Localizable", "routes.filter.users")
      }

      enum Followance {
        /// Треки, отображающиеся по взаимной подписке
        static var description: String {
          L10n.tr("Localizable", "routes.filter.followance.description")
        }
        /// Треки друзей
        static var title: String {
          L10n.tr("Localizable", "routes.filter.followance.title")
        }
      }
    }

    enum History {
      /// Все
      static var all: String {
        L10n.tr("Localizable", "routes.history.all")
      }
    }

    enum Tabs {
      /// Избранное
      static var favorites: String {
        L10n.tr("Localizable", "routes.tabs.favorites")
      }
      /// Подписки
      static var following: String {
        L10n.tr("Localizable", "routes.tabs.following")
      }
      /// Все
      static var someones: String {
        L10n.tr("Localizable", "routes.tabs.someones")
      }
    }

    enum Title {
      /// Мои треки
      static var mine: String {
        L10n.tr("Localizable", "routes.title.mine")
      }
      /// Треки %@
      static func someones(_ p1: String) -> String {
        L10n.tr("Localizable", "routes.title.someones", p1)
      }
    }
  }

  enum Search {
    /// Ничего не найдено
    static var empty: String {
      L10n.tr("Localizable", "search.empty")
    }
    /// Люди
    static var people: String {
      L10n.tr("Localizable", "search.people")
    }
    /// Маршруты
    static var routes: String {
      L10n.tr("Localizable", "search.routes")
    }
    /// Поиск
    static var title: String {
      L10n.tr("Localizable", "search.title")
    }
    /// Турниры
    static var tournaments: String {
      L10n.tr("Localizable", "search.tournaments")
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

    enum Route {
      /// Настройки карты
      static var title: String {
        L10n.tr("Localizable", "settings.route.title")
      }

      enum Sections {
        /// Метка геопозиции
        static var geopositionLabel: String {
          L10n.tr("Localizable", "settings.route.sections.geoposition-label")
        }
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
    /// Пожалуйста, введите свой номер телефона
    static var description: String {
      L10n.tr("Localizable", "sign-in.description")
    }
    /// Продолжить
    static var signInButton: String {
      L10n.tr("Localizable", "sign-in.sign-in-button")
    }
    /// Добро пожаловать в\nCoffee!
    static var welcomeTitle: String {
      L10n.tr("Localizable", "sign-in.welcome-title")
    }

    enum Errors {
      /// Некорректный номер телефона. Попробуйте ещё раз.
      static var invalidPhoneNumber: String {
        L10n.tr("Localizable", "sign-in.errors.invalid-phone-number")
      }
    }

    enum Placeholders {
      /// Номер телефона
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

  enum Social {
    /// Instagram
    static var instagram: String {
      L10n.tr("Localizable", "social.instagram")
    }
    /// @
    static var placeholder: String {
      L10n.tr("Localizable", "social.placeholder")
    }
    /// Telegram
    static var telegram: String {
      L10n.tr("Localizable", "social.telegram")
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
      /// Графит
      static var gray: String {
        L10n.tr("Localizable", "themes.types.gray")
      }
      /// Светлая
      static var light: String {
        L10n.tr("Localizable", "themes.types.light")
      }
    }
  }

  enum Time {
    /// ч
    static var h: String {
      L10n.tr("Localizable", "time.h")
    }
    /// ч
    static var hours: String {
      L10n.tr("Localizable", "time.hours")
    }
    /// м
    static var m: String {
      L10n.tr("Localizable", "time.m")
    }
    /// мин
    static var minutes: String {
      L10n.tr("Localizable", "time.minutes")
    }
    /// с
    static var s: String {
      L10n.tr("Localizable", "time.s")
    }
    /// с
    static var seconds: String {
      L10n.tr("Localizable", "time.seconds")
    }
  }

  enum ToStart {
    /// %@ до старта
    static func distance(_ p1: String) -> String {
      L10n.tr("Localizable", "to-start.distance", p1)
    }
    /// Вы здесь
    static var tooClose: String {
      L10n.tr("Localizable", "to-start.too-close")
    }
  }

  enum Transport {
    /// Транспорт
    static var title: String {
      L10n.tr("Localizable", "transport.title")
    }

    enum Limit {
      /// Вы можете выбрать не более %@ видов транспорта.
      static func description(_ p1: String) -> String {
        L10n.tr("Localizable", "transport.limit.description", p1)
      }
      /// Максимальное количество транспорта на треке
      static var title: String {
        L10n.tr("Localizable", "transport.limit.title")
      }
    }

    enum Types {
      /// Квадроцикл
      static var atVs: String {
        L10n.tr("Localizable", "transport.types.ATVs")
      }
      /// Велосипед
      static var bicycle: String {
        L10n.tr("Localizable", "transport.types.bicycle")
      }
      /// Мотоцикл
      static var bike: String {
        L10n.tr("Localizable", "transport.types.bike")
      }
      /// Автомобиль
      static var car: String {
        L10n.tr("Localizable", "transport.types.car")
      }
      /// Другое
      static var other: String {
        L10n.tr("Localizable", "transport.types.other")
      }
      /// Ролики
      static var rollers: String {
        L10n.tr("Localizable", "transport.types.rollers")
      }
      /// Бег
      static var running: String {
        L10n.tr("Localizable", "transport.types.running")
      }
      /// Самокат
      static var scooter: String {
        L10n.tr("Localizable", "transport.types.scooter")
      }
      /// Скейтборд
      static var skateboard: String {
        L10n.tr("Localizable", "transport.types.skateboard")
      }
      /// Снегоход
      static var snowmobile: String {
        L10n.tr("Localizable", "transport.types.snowmobile")
      }
    }
  }

  enum UserProfile {
    /// Редактировать
    static var edit: String {
      L10n.tr("Localizable", "user-profile.edit")
    }
    /// Очки рейтинга
    static var expSubtitle: String {
      L10n.tr("Localizable", "user-profile.exp-subtitle")
    }
    /// Избранные
    static var favorites: String {
      L10n.tr("Localizable", "user-profile.favorites")
    }
    /// Подписаться
    static var follow: String {
      L10n.tr("Localizable", "user-profile.follow")
    }
    /// Подписчики
    static var followers: String {
      L10n.tr("Localizable", "user-profile.followers")
    }
    /// Подписки
    static var following: String {
      L10n.tr("Localizable", "user-profile.following")
    }
    /// Друзья
    static var friends: String {
      L10n.tr("Localizable", "user-profile.friends")
    }
    /// История 🥇🥈🥉
    static var history: String {
      L10n.tr("Localizable", "user-profile.history")
    }
    /// Треки
    static var tracks: String {
      L10n.tr("Localizable", "user-profile.tracks")
    }
  }

  enum Users {

    enum Filter {
      /// Города
      static var cities: String {
        L10n.tr("Localizable", "users.filter.cities")
      }
      /// Фильтр пользователей
      static var title: String {
        L10n.tr("Localizable", "users.filter.title")
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
