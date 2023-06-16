#language : es
@PX-9
Feature: Creación de mascotas

  @TEST
  Scenario Outline: validar que se pueda Añadir un usuario a la tienda
    Given url 'https://petstore.swagger.io/v2/user'
    And request {"id": <id>,"username": "<username>","firstName": "<firsName>","lastName": "<lastName>","email": "<email>","password": "<password>","phone": "<phone>","userStatus": <userStatus>}
    When method post
    Then status 200
    Examples:
      | id | username | firsName | lastName | email             | password | phone     | userStatus |
      | 85 | PetLover | Julio    | Ramón    | jorgeRA@gmail.com | jorge123 | 987654321 | 0          |

  Scenario Outline: validar que se pueda Consultar el user creado previamente
    Given url 'https://petstore.swagger.io/v2/user/<username>'
    When method get
    Then status 200
    Examples:
      | username |
      | PetLover |

  Scenario Outline: validar que se pueda Actualizar el nombre usuario y el correo
    Given url 'https://petstore.swagger.io/v2/user/PetLover'
    And request {"id": 85,"username": "<username>","firstName": "Tito","lastName": "Ramón","email": "<email>","password": "jorge123","phone": "987654444","userStatus": 0}
    When method PUT
    Then status 200
    Examples:
      | username  | email            |
      | PetLover2 | titoRA@gmail.com |

  Scenario Outline: validar que se pueda Consultar el user modificado previamente
    Given url 'https://petstore.swagger.io/v2/user/<username>'
    When method get
    Then status 200
    * def username = response.username
    * def email = response.email
    * assert username == '<username>'
    * assert email == 'titoRA@gmail.com'
    Examples:
      | username  |
      | PetLover2 |

  Scenario Outline: Eliminar usuario
    Given url 'https://petstore.swagger.io/v2/user/<Usuario>'
    When method delete
    Then status 200
    Examples:
      | Usuario   |
      | PetLover2 |