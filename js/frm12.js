function prueba() {
    /*  ejemplo var a = 5;
        var b = 10;
        console.log(`Quince es ${a + b} y\nno ${2 * a + b}.`); */
    var variablea = ` <section>
                                            <div class="col-md-2" style="margin-top: 70px; text-align: center">
                                                <label class="control-label">
                                                    Variable A
                                                </label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="control-label">
                                                            Nombre:
                                                        </label>

                                                        <textarea class="form-control" placeholder=""></textarea>
                                                    </div>
                                                    <div>
                                                        <label class="control-label">
                                                            Medio de verificación:
                                                        </label>

                                                        <textarea class="form-control"
                                                                  placeholder="Describa el medio de verificacion"></textarea>
                                                    </div>

                                                </div>
                                            </div>

                                        </section>`;
    var variableb = ` <section>
                                            <div class="col-md-2" style="margin-top: 70px; text-align: center">
                                                <label class="control-label">
                                                    Variable B
                                                </label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="control-label">
                                                            Nombre:
                                                        </label>

                                                        <textarea class="form-control" placeholder=""></textarea>
                                                    </div>
                                                    <div>
                                                        <label class="control-label">
                                                            Medio de verificación:
                                                        </label>

                                                        <textarea class="form-control"
                                                                  placeholder="Describa el medio de verificacion"></textarea>
                                                    </div>

                                                </div>
                                            </div>

                                        </section>`;
    var variablec = ` <section>
                                            <div class="col-md-2" style="margin-top: 70px; text-align: center">
                                                <label class="control-label">
                                                    Variable C
                                                </label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="control-label">
                                                            Nombre:
                                                        </label>

                                                        <textarea class="form-control" placeholder=""></textarea>
                                                    </div>
                                                    <div>
                                                        <label class="control-label">
                                                            Medio de verificación:
                                                        </label>

                                                        <textarea class="form-control"
                                                                  placeholder="Describa el medio de verificacion"></textarea>
                                                    </div>

                                                </div>
                                            </div>

                                        </section>`;
    var variabled = ` <section>
                                            <div class="col-md-2" style="margin-top: 70px; text-align: center">
                                                <label class="control-label">
                                                    Variable D
                                                </label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="control-label">
                                                            Nombre:
                                                        </label>

                                                        <textarea class="form-control" placeholder=""></textarea>
                                                    </div>
                                                    <div>
                                                        <label class="control-label">
                                                            Medio de verificación:
                                                        </label>

                                                        <textarea class="form-control"
                                                                  placeholder="Describa el medio de verificacion"></textarea>
                                                    </div>

                                                </div>
                                            </div>

                                        </section>`;

    var variableE = ` <section>
                                            <div class="col-md-2" style="margin-top: 70px; text-align: center">
                                                <label class="control-label">
                                                    Variable E
                                                </label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="control-label">
                                                            Nombre:
                                                        </label>

                                                        <textarea class="form-control" placeholder=""></textarea>
                                                    </div>
                                                    <div>
                                                        <label class="control-label">
                                                            Medio de verificación:
                                                        </label>

                                                        <textarea class="form-control"
                                                                  placeholder="Describa el medio de verificacion"></textarea>
                                                    </div>

                                                </div>
                                            </div>

                                        </section>`;
    var seleccion = document.getElementById("tipo_algoritmo").value;

    var numero_variables = 2; //esta variable haria la peticion ajax para consultar el numero de variables del tipo de algoritmo

    if (seleccion == "ejemplo1") {
        if (numero_variables == 2) {

            $("#variables").append(variablea);
            $("#variables").append(variableb);
        }
    } else if (seleccion == "ejemplo2") {
        $("#variables").append(variablea);
        $("#variables").append(variableb);
        $("#variables").append(variablec);
    }


    //console.log(variableb);
}

(function () {
    busquedapediodicidadcalculo();
})();

function busquedapediodicidadcalculo() {
    /*Url estatica*/
    var url = document.getElementById("url").value;
    $.ajax({
        type: "GET",
        url: url + "consultas/frm_12/periodicidad",
        data: "ok=ok",
        success: function (data) {
            value = 0;
            JSON.parse(data, function (k, v) {
                if (isNaN(v) === true) {
                    if (typeof v === 'object') {
                    } else {
                        //texto
                        var o = new Option("option text", value);
                        $("#cbo_nombre_periodicidad").append(o);
                        $(o).html(v);
                    }
                } else {
                    //numero
                    value = v;
                }

            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);

        }
    });
}

(function () {
    recueperar_tendencia();
})();

function recueperar_tendencia() {
    /*Url estatica*/
    var url = document.getElementById("url").value;
    $.ajax({
        type: "GET",
        url: url + "consultas/frm_12/tendencia",
        data: "ok=ok",
        success: function (data) {
            value = 0;
            JSON.parse(data, function (k, v) {
                if (isNaN(v) === true) {
                    if (typeof v === 'object') {
                    } else {
                        //texto
                        var o = new Option("option text", value);
                        $("#cbo_nombre_tendencia").append(o);
                        $(o).html(v);
                    }
                } else {
                    //numero
                    value = v;
                }

            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);

        }
    });
}

(function () {
    recuperar_ambito();
})();

function recuperar_ambito() {
    /*Url estatica*/
    var url = document.getElementById("url").value;
    $.ajax({
        type: "GET",
        url: url + "consultas/frm_12/ambitos",
        data: "ok=ok",
        success: function (data) {
            value = 0;
            JSON.parse(data, function (k, v) {
                if (isNaN(v) === true) {
                    if (typeof v === 'object') {
                    } else {
                        //texto
                        var o = new Option("option text", value);
                        $("#cbo_nombre_medicion").append(o);
                        $(o).html(v);
                    }
                } else {
                    //numero
                    value = v;
                }

            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);

        }
    });
}
(function () {
    recuperar_desempenio();
})();

function recuperar_desempenio() {
    /*Url estatica*/
    var url = document.getElementById("url").value;
    $.ajax({
        type: "GET",
        url: url + "consultas/frm_12/desempenos",
        data: "ok=ok",
        success: function (data) {
            value = 0;
            JSON.parse(data, function (k, v) {
                if (isNaN(v) === true) {
                    if (typeof v === 'object') {
                    } else {
                        //texto
                        var o = new Option("option text", value);
                        $("#cbo_dimension_desempenio").append(o);
                        $(o).html(v);
                    }
                } else {
                    //numero
                    value = v;
                }

            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);

        }
    });
}

