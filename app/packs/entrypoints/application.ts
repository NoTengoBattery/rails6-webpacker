import * as Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

import './iconify'
import './stimulus'
import './turbo'

Rails.start()
ActiveStorage.start()
