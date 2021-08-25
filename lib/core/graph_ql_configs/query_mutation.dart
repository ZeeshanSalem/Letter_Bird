class QueryAndMutation {
  String getGender = """
  query gender{
    Genders{
      _id
      name
    }
  }
  """;

  String interest = """
  query interest{
    Interests{
      _id
      name
      status
    }
  }
  """;

  String country = """
  query country{
    Countries(details: true){
      country_id
      country
      iso
      capital
      currency_code
      currency_name
      currency_symbol
      phone
      postal_code_regex
      postal_code_format
      languages
      cities{
        city_id
        name
      }
    }
  }
  """;

  String getCityByCountryId(String countryId) {
    return """
  query cities{
      Cities(id: ${int.parse(countryId)}){
        city_id
        name
      }
  }
  """;
  }



  String getInterest(int from) {
    return """
  query interest{
      Interests(from: $from){
        _id
        name
        status
    }
  }
  """;
  }

  String avatars = """
  query avatar{
    Avatars{
     _id
      is_active
      is_premium
      coin
      avatar
    }
  }
  """;


  String language = """
  query Language{
    Languages{
     _id
      name
      description
      word_code
    }
  }
  """;
}
