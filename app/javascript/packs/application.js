// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function crearUrlAmigable(str)
{
	//se reemplaza los caracteres especiales o simbolos on un espacio

	str = str.replace(/[`~!@#$%^&*()_\-+=\[\]{};:'"\\|\/,.<>?\s]/g,' ').toLowerCase();


	//corta los espacio al inicio y final del string

	str = str.replace(/^\s+|\s+$/gm, '');

	//reemplaza el espacio con guion

	str = str.replace(/\s+/g, '-');

	var input = document.getElementById('url');

	input.value = str;

}
function cargarImagen(){
	var name = document.getElementById('nimg');


	nas = name.files.item(0).name

	var ini = document.getElementById('img');

	ini.value = nas;

}

function ConfirmDelete() {
    var x = confirm("Estas seguro de Eliminar?");
    if (x)
        return true;
    else
        return false;
}
