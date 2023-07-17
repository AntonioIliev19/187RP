Locales['en'] = {
    ['document_deleted'] = "Документа беше ~g~скъсан~w~.",
    ['document_delete_failed'] = "Документа не се ~r~скъса~w~.",
    ['copy_from_player'] = "Ти ~g~получи~w~ копие на документа.",
    ['from_copied_player'] = "Дадохте ~g~копие~w~ на документа",
    ['could_not_copy_form_player'] = "Could ~r~not~w~ copy form to player.",
    ['document_options'] = "Опции за документи",
    ['public_documents'] = "Public Documents",
    ['job_documents'] = "Документи за работа",
    ['saved_documents'] = "Запазени документи",
    ['close_bt'] = "Затвори",
    ['no_player_found'] = "Няма човек",
    ['go_back'] = "Върни се",
    ['view_bt'] = "Виж",
    ['show_bt'] = "Покажи",
    ['give_copy'] = "Дай Копие",
    ['delete_bt'] = "Скъсай",
    ['yes_delete'] = "Да",
}

Config.Documents['en'] = {
      ["avocat"] = {
        {
          headerTitle = "ФОРМА ЗА УТВЪРЖДАНЕ",
          headerSubtitle = "Формуляр за утвърждаване на гражданите.",
          elements = {
            { label = "СЪДЪРЖАНИЕ НА ПОТВЪРЖДАВАНЕ", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "ИЗПИТВАНЕ НА СВИДЕТЕЛСТВОТО",
          headerSubtitle = "Официални показания на свидетелите.",
          elements = {
            { label = "ДАТА НА ВЪЗДЕЙСТВИЕТО", type = "input", value = "", can_be_emtpy = false },
            { label = "СЪДЪРЖАНИЕ НА ИЗПИТВАНЕТО", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "VEHICLE CONVEY STATEMENT",
          headerSubtitle = "Vehicle convey statement towards another citizen.",
          elements = {
            { label = "PLATE NUMBER", type = "input", value = "", can_be_emtpy = false },
            { label = "CITIZEN NAME", type = "input", value = "", can_be_emtpy = false },
            { label = "AGREED PRICE", type = "input", value = "", can_be_empty = false },
            { label = "OTHER INFORMATION", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "DEBT STATEMENT TOWARDS CITIZEN",
          headerSubtitle = "Official debt statement towards another citizen.",
          elements = {
            { label = "CREDITOR FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "CREDITOR LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "AMOUNT DUE", type = "input", value = "", can_be_empty = false },
            { label = "DUE DATE", type = "input", value = "", can_be_empty = false },
            { label = "OTHER INFORMATION", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
		        {
          headerTitle = "LEGAL SERVICES CONTRACT",
          headerSubtitle = "Legal services contract provided by a lawyer.",
          elements = {
            { label = "CITIZEN FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "CITIZEN LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATION", type = "textarea", value = "THIS DOCUMENT IS PROOF OF LEGAL REPRESANTATION AND COVERAGE OF THE AFOREMENTIONED CITIZEN. LEGAL SERVICES ARE VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
		        {
          headerTitle = "DEBT CLEARANCE DECLARATION",
          headerSubtitle = "Declaration of debt clearance from another citizen.",
          elements = {
            { label = "DEBTOR FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "DEBTOR LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "DEBT AMOUNT", type = "input", value = "", can_be_empty = false },
            { label = "OTHERINFORMATION", type = "textarea", value = "I HEREBY DECLARE THAT THE AFOREMENTIONED CITIZEN HAS COMPLETED A PAYMENT WITH THE AFOREMENTIONED DEBT AMOUNT", can_be_emtpy = false, can_be_edited = false },
          }
        }
	},
      ["public"] = {
        {
          headerTitle = "ИЗПИТВАНЕ НА СВИДЕТЕЛСТВОТО",
          headerSubtitle = "Официални показания на свидетелите.",
          elements = {
            { label = "ДАТА НА ВЪЗДЕЙСТВИЕТО", type = "input", value = "", can_be_emtpy = false },
            { label = "СЪДЪРЖАНИЕ НА ИЗПИТВАНЕТО", type = "textarea", value = "", can_be_emtpy = false },
			}
        }
      },
      ["police"] = {
        {
          headerTitle = "РАЗРЕШЕНИЕ ЗА ПАРКИРАНЕ",
          headerSubtitle = "НЕОГРАНИЧЕНО РАЗРЕШЕНИЕ ЗА ПАРКИРАНЕ.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО:", type = "input", value = "", can_be_empty = false },
            { label = "ИНФОРМАЦИЯ", type = "textarea", value = "ЧОВЕКЪТ ИМА ПРАВО ДА ПАРКИРА НА ВСЯКА ЗОНА В ГРАДА, ДО ИЗТИЧАНЕ НА РАЗРЕШЕНИЕТО.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "РАЗРЕШЕНИЕ ЗА ОРЪЖИЕ",
          headerSubtitle = "Специално разрешение за оръжие, предоставено от полицията.",
          elements = {
            { label = "ИМЕ НА ПРИТЕЖАТЕЛЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ НА ПРИТЕЖАТЕЛЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДНО ДО", type = "input", value = "", can_be_empty = false },
            { label = "ИНФОРМАЦИЯ", type = "textarea", value = "Гражданина притежаващ този документ, има пълно право да притежава оръжие. Документът е валиден до датата на изтичане.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "ЧИСТО КРИМИНАЛНО ДОСИЕ",
          headerSubtitle = "Официално чисто, гражданско свидетелство.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО", type = "input", value = "", can_be_empty = false },
            { label = "ДОСИЕ", type = "textarea", value = "Полицията заявява, че гражданинът е с чисто криминално досие. Този резултат е генериран от данни, постъпили в базата данни и валиден до датата на подписване на този документ", can_be_emtpy = false, can_be_edited = false },
          }         }
      },
      ["ambulance"] = {
        {
          headerTitle = "МЕДИЦИНСКИ ДОКЛАД - ПАТОЛОГИЯ",
          headerSubtitle = "Официален медицински доклад, предоставен от Патолог.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "Гореспоменатият гражданин беше прегледан от служител на здравеопазването и е определен за здрав без открити дългосрочни заболявания. Този доклад е валиден до споменатата дата.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "МЕДИЦИНСКИ ДОКЛАД - ПСИХОЛОГИЯ",
          headerSubtitle = "Официален медицински доклад от психолог.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО", type = "input", value = "", can_be_empty = false },
            { label = "МЕДИЦИНСКИ БЕЛЕЖКИ", type = "textarea", value = "Гореспоменатият гражданин беше прегледан от психолог.Този документ е валиден до посочената дата.", can_be_emtpy = false },
          }
        },
{
          headerTitle = "МЕДИЦИНСКИ ДОКЛАД - ОЧЕН ЛЕКАР",
          headerSubtitle = "Официален медицински доклад издаден от - очен лекар.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО", type = "input", value = "", can_be_empty = false },
            { label = "ИНФОРМАЦИЯ", type = "textarea", value = "Човекът има направени тестове на очите, от специален лекар. Този документ е валиден до посочената дата.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "РАЗРЕШЕНИЕ ЗА ИЗПОЛЗВАНЕ НА МАРИХУАНА",
          headerSubtitle = "Официално разрешение за употреба на марихуана за граждани.",
          elements = {
            { label = "ИМЕ", type = "input", value = "", can_be_emtpy = false },
            { label = "ФАМИЛИЯ", type = "input", value = "", can_be_emtpy = false },
            { label = "ВАЛИДЕН ДО", type = "input", value = "", can_be_empty = false },
            { label = "ИНФОРМАЦИЯ", type = "textarea", value = "Човекът има позволение за, използване на поради здравословни проблеми. Легалното количество марихуана което може да носи в себе си е 20 грама. Този документ е валиден до посочената дата.", can_be_emtpy = false, can_be_edited = false },
          }
        }
    }
  }
