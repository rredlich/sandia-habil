class HomeController < ApplicationController
  def index
    @today = Time.now
  end
  
  def result
    if request.post?
      redirect_to(result_url(startDate: params["startDate"], workingDays: params["workingDays"]))
    end
    
    # Feriados (Debería declararlos en otra parte?)
    holydays = {
    "01-01-2021" => "🎉 Año Nuevo",
    "02-04-2021" => "Viernes Santo",
    "03-04-2021" => "Sábado Santo",
    "01-05-2021" => "Día Nacional del Trabajo",
    "15-05-2021" => "🗳 Elecciones municipales, de gobernadores regionales (primera vuelta) y de convencionales constituyentes",
    "16-05-2021" => "🗳 Elecciones municipales, de gobernadores regionales (primera vuelta) y de convencionales constituyentes",
    "21-05-2021" => "Día de las Glorias Navales",
    "07-06-2021" => "Aniversario del Asalto y Toma del Morro de Arica (válido solamente en la región de Arica y Parinacota)",
    "13-06-2021" => "🗳 Elecciones de gobernadores regionales (segunda vuelta) (válido solamente en todas las regiones del país, excepto las de Valparaíso, de Aysén del General Carlos Ibáñez del Campo, y de Magallanes y de la Antártica Chilena)",
    "21-06-2021" => "Día Nacional de los Pueblos Indígenas",
    "28-06-2021" => "San Pedro y San Pablo",
    "16-07-2021" => "Virgen del Carmen",
    "18-07-2021" => "🗳 Elecciones primarias presidenciales y congresistas",
    "15-08-2021" => "Asunción de la Virgen",
    "20-08-2021" => "Nacimiento del Prócer de la Independencia (válido solamente en las comunas de Chillán y Chillán Viejo)",
    "17-09-2021" => "🇨🇱 San Viernes",
    "18-09-2021" => "🇨🇱 Día de la Independencia Nacional",
    "19-09-2021" => "🇨🇱 Día de las Glorias del Ejército",
    "11-10-2021" => "Encuentro de Dos Mundos",
    "31-10-2021" => "Día Nacional de las Iglesias Evangélicas y Protestantes",
    "01-11-2021" => "Día de Todos los Santos",
    "21-11-2021" => "🗳 Elecciones presidencial (primera vuelta), congresistas y de consejeros regionales",
    "08-12-2021" => "Inmaculada Concepción de la Virgen",
    "19-12-2021" => "🗳 Elección presidencial (segunda vuelta)",
    "25-12-2021" => "Natividad del Señor",
    "01-01-2022" => "🎉 Año Nuevo",
    "15-04-2022" => "Viernes Santo",
    "16-04-2022" => "Sábado Santo",
    "01-05-2022" => "Día Nacional del Trabajo",
    "21-05-2022" => "Día de las Glorias Navales",
    "21-06-2022" => "Día Nacional de los Pueblos Indígenas",
    "27-06-2022" => "San Pedro y San Pablo",
    "16-07-2022" => "Virgen del Carmen",
    "15-08-2022" => "Asunción de la Virgen",
    "18-09-2022" => "🇨🇱 Día de la Independencia Nacional",
    "19-09-2022" => "🇨🇱 Día de las Glorias del Ejército",
    "10-10-2022" => "Encuentro de Dos Mundos",
    "31-10-2022" => "Día Nacional de las Iglesias Evangélicas y Protestantes",
    "01-11-2022" => "Día de Todos los Santos",
    "08-12-2022" => "Inmaculada Concepción de la Virgen",
    "25-12-2022" => "Natividad del Señor",
    "01-01-2023" => "🎉 Año Nuevo",
    "02-01-2023" => "San Lunes",
    "07-04-2023" => "Viernes Santo (feriado religioso)",
    "08-04-2023" => "Sábado Santo (feriado religioso)",
    "01-05-2023" => "Día Nacional del Trabajo",
    "21-05-2023" => "Día de las Glorias Navales",
    "21-06-2023" => "Día Nacional de los Pueblos Indígenas",
    "26-06-2023" => "San Pedro y San Pablo (feriado religioso)",
    "16-07-2023" => "Virgen del Carmen (feriado religioso)",
    "15-08-2023" => "Asunción de la Virgen (feriado religioso)",
    "18-09-2023" => "🇨🇱 Día de la Independencia Nacional",
    "19-09-2023" => "🇨🇱 Día de las Glorias del Ejército",
    "09-10-2023" => "Encuentro de Dos Mundos",
    "27-10-2023" => "Día Nacional de las Iglesias Evangélicas y Protestantes (feriado religioso)",
    "01-11-2023" => "Día de Todos los Santos (feriado religioso)",
    "08-12-2023" => "Inmaculada Concepción de la Virgen (feriado religioso)",
    "25-12-2023" => "Natividad del Señor (feriado religioso)"}
    
    holydaysKeys = holydays.keys
    Date::DATE_FORMATS[:my_format] = '%d-%m-%Y'
    @holydaysOut = []
    @holydaysDateOut = []
    @holydaysDescOut = []

    if params['workingDays'] != nil
      # Dias corridos
      # @newDate = params['startDate'].to_date + params['workingDays'].to_i.days

      # Dias habiles con feriados
      @startDate = params['startDate'].to_date
      @workingDaysCnt = params['workingDays'].to_i
      cnt = params['workingDays'].to_i
      @newDate = params['startDate'].to_date
      while cnt != 0
        @newDate = @newDate + 1.days
        newDateStr = @newDate.to_formatted_s(:my_format)
        cnt = cnt - 1 unless @newDate.saturday? or @newDate.sunday? or holydaysKeys.include?(newDateStr)

        if holydaysKeys.include?(newDateStr)
          @holydaysOut << newDateStr + ' ' + holydays[newDateStr]
          @holydaysDateOut << newDateStr
          @holydaysDescOut << holydays[newDateStr]
        end
      end
      @newDate = @newDate.to_formatted_s(:my_format)
      @startDate = @startDate.to_formatted_s(:my_format)
    end
  end
end


