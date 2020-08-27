import 'Book.dart';
import 'Chapter.dart';
import 'Genre.dart';
import 'Item.dart';
import 'Lecture.dart';
import 'Shop.dart';
import 'User.dart';

class Comment {
  User author;
  int likes;
  String comment;

  Comment(this.author, this.comment, {this.likes = 0});

  static List<Comment> getMockComments(){

    List<Chapter> chapters = new List();
    List<Book> books = new List();
    List<Lecture> lectures = new List();
    List<Item> items = new List();
    List<Genre> genres = new List();

    chapters.add(new Chapter(1, "Capitulo 1 :  Inicio"));
    chapters.add(new Chapter(2, "Capitulo 2 :  Post Inicio"));
    chapters.add(new Chapter(3, "Capitulo 3 :  Pre Final"));
    chapters.add(new Chapter(4, "Capitulo 4 :  Final"));

    Shop shop1 = new Shop.withoutIds("Casa del Libro", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
    Shop shop2 = new Shop.withoutIds("Fnac", "https://upload.wikimedia.org/wikipedia/commons/2/2e/Fnac_Logo.svg");
    Shop shop3 = new Shop.withoutIds("El corte ingles", "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg");
    Shop shop4 = new Shop.withoutIds("Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png");
    Shop shop5 = new Shop.withoutIds("Me gusta leer", "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg");

    items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€"));
    items.add(new Item.withoutId(shop2, "https://www.fnac.es/a7456973/En-busca-del-chico-irrompible#st=el+chico+irr&ct=En+todo+Fnac&t=p", 16.05, "€"));
    items.add(new Item.withoutId(shop3, "https://www.elcorteingles.es/libros/A35120735-en-busca-del-chico-irrompible-tapa-dura-9788408228059/", 16.05, "€"));
    items.add(new Item.withoutId(shop4, "https://www.tagusbooks.com/ebook-en-busca-del-chico-irrompible-ebook/9788408230663/11537354", 16.05, "€"));
    items.add(new Item.withoutId(shop5, "https://tienda.megustaleer.com/libros/2519-dulce-chico-indecente-9788490708248.html", 16.05, "€"));

    Map<String, List<Item>> shopItems = {
      'Tapa Blanda': items,
      'Tapa Dura' : items,
      'Tapa Ebook': items,
    };

    String description =
    """
    Engánchate al fenómenoValeria de @BetaCoqueta, una saga altamente divertida, emotiva y sensual.
    
    ¡Te vas a enamorar!
    
    Valeria es escritora de historias de amor.
    Valeria vive el amor de forma sublime.
    Valeria tiene tres amigas: Nerea, Carmen y Lola.
    Valeria vive en Madrid.
    Valeria ama a Adrián hasta que conoce a Víctor.
    Valeria necesita sincerarse consigo misma.
    Valeria llora, Valeria ríe, Valeria camina...
    Pero el sexo, el amor y los hombres no son objetivos fáciles.
    Valeria es especial.
    Como tú.
    
    En los zapatos de Valeria es el primer libro de la«Saga Valeria», la primera obra deElísabet Benavent, que inició su carrera literaria autopublicándose y que en poco tiempo conquistó a cientos de lectores y se situó en los primeros puestos de la lista de más vendidos de ficción.
    
    Posteriormente la autora, también conocida por sus fans como@BetaCoqueta, ha continuado cosechando grandes éxitos con la publicación de su«Saga Silvia», la trilogía«Mi elección», la bilogía«Horizonte Martina» y la novelaMi isla.
    """;

    Book book1 = new Book.withSummary(
        "En los Zapatos de Valeria",
        "Elisabeth Benavent",
        "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg",
        description,
        "1",
        "2",
        shopItems,
        chapters : chapters
    );

    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description,
        "2",
        "2",
        shopItems,
        chapters: chapters
    );

    Book book3 = new Book.withSummary(
        "Con el amor bastaba",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description,
        "3",
        "2",
        shopItems,
        chapters: chapters
    );

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description,
        "4",
        "2",
        shopItems,
        chapters: chapters
    );

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    lectures.add(book1.toLecture());
    lectures.add(book2.toLecture());
    lectures.add(book3.toLecture());
    lectures.add(book4.toLecture());

    Genre genre1 = Genre("1", "Genre1", "genre1.png");
    Genre genre2 = Genre("2", "Genre2", "genre2.png");
    Genre genre3 = Genre("3", "Genre3", "genre3.png");
    Genre genre4 = Genre("4", "Genre4", "genre4.png");
    Genre genre5 = Genre("5", "Genre5", "genre5.png");
    Genre genre6 = Genre("6", "Genre6", "genre6.png");
    Genre genre7 = Genre("7", "Genre7", "genre7.png");
    Genre genre8 = Genre("8", "Genre8", "genre8.png");
    Genre genre9 = Genre("9", "Genre9", "genre9.png");

    genres.add(genre1);
    genres.add(genre2);
    genres.add(genre3);
    genres.add(genre4);
    genres.add(genre5);
    genres.add(genre6);
    genres.add(genre7);
    genres.add(genre8);
    genres.add(genre9);


    Map<String, List<Lecture>> userLectures =
    {'Reading': lectures.sublist(0, 1), 'Pending': lectures.sublist(2, 3), 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};

    User user1= new User(
        "1",
        "John Cobra",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "data:image/jpeg;base64,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"
    );

    User user2 = new User(
        "2",
        "Usain Ahmad",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://www.hotfootdesign.co.uk/wp-content/uploads/2016/05/d5jA8OZv.jpg"
    );

    User user3 = new User(
        "3",
        "Alberto Chicote",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F17%2Fcf%2Fba%2F17cfba1f45d560407323bfd514f9bc8d.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F474426141969903275%2F&tbnid=9t4aCgSZVL-98M&vet=10CAMQxiAoAGoXChMIyLjU9N276wIVAAAAAB0AAAAAEB0..i&docid=nb32oYmQ-loZ1M&w=200&h=281&itg=1&q=user%20pictures&ved=0CAMQxiAoAGoXChMIyLjU9N276wIVAAAAAB0AAAAAEB0"
    );

    User user4 = new User(
        "4",
        "Jose Calderon",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.getuppeople.com%2F%3Fpage%3Dprofile%26id%3D67&psig=AOvVaw2882N0zz2URcd786jn8ei2&ust=1598629622569000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMi41PTdu-sCFQAAAAAdAAAAABAq"
    );

    User user5 = new User(
        "5",
        "Antonio Puerta",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "http://www.templatebeats.com/files/images/JJ2.png"
    );

    List<Comment> mockSubComments = new List();
    mockSubComments.add(new Comment(user1, "Muy buen libro", likes: 0));
    mockSubComments.add(new Comment(user2, "Muy buen libro 1", likes: 1000));
    mockSubComments.add(new Comment(user3, "Muy buen libro 2", likes: 10000));
    mockSubComments.add(new Comment(user4, "Muy buen libro 3", likes: 100000));
    mockSubComments.add(new Comment(user5, "Muy buen libro 4", likes: 10000700));
    return mockSubComments;
  }
}