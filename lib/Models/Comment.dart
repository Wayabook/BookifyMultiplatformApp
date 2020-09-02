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
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Noizy_and_Chris_Brown.jpg/220px-Noizy_and_Chris_Brown.jpg"
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
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg/220px-TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg"
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
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Cajal-Restored.jpg/220px-Cajal-Restored.jpg"
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
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Donald_Trump_official_portrait.jpg/220px-Donald_Trump_official_portrait.jpg"
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