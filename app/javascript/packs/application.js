// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap'
import 'css/styles'

import flatpickr from "flatpickr"
import { Spanish } from "flatpickr/dist/l10n/es.js"
import "flatpickr/dist/flatpickr.min.css"

document.addEventListener('turbolinks:load', () => {
    flatpickr("[data-behavior='flatpickr']", {
        "locale": Spanish,
        allowInput: true,
        altFormat: "j F Y",
        altInput: true,
        dateFormat: "d-m-Y"
    });
  })


Rails.start()
Turbolinks.start()
ActiveStorage.start()
