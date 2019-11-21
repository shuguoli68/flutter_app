class BookRecommendEntity {
    List<Book> books;
    bool ok;

    BookRecommendEntity({this.books, this.ok});

    factory BookRecommendEntity.fromJson(Map<String, dynamic> json) {
        return BookRecommendEntity(
            books: json['books'] != null ? (json['books'] as List).map((i) => Book.fromJson(i)).toList() : null, 
            ok: json['ok'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ok'] = this.ok;
        if (this.books != null) {
            data['books'] = this.books.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Book {
    String sId;
    bool allowFree;
    bool allowMonthly;
    String author;
    String contentType;
    String cover;
    bool isSerial;
    String lastChapter;
    int latelyFollower;
    String majorCate;
    String minorCate;
    double otherReadRatio;
    double retentionRatio;
    String shortIntro;
    String site;
    String title;

    Book({this.sId, this.allowFree, this.allowMonthly, this.author, this.contentType, this.cover, this.isSerial, this.lastChapter, this.latelyFollower, this.majorCate, this.minorCate, this.otherReadRatio, this.retentionRatio, this.shortIntro, this.site, this.title});

    factory Book.fromJson(Map<String, dynamic> json) {
        return Book(
            sId: json['_id'],
            allowFree: json['allowFree'],
            allowMonthly: json['allowMonthly'],
            author: json['author'],
            contentType: json['contentType'],
            cover: json['cover'],
            isSerial: json['isSerial'],
            lastChapter: json['lastChapter'],
            latelyFollower: json['latelyFollower'],
            majorCate: json['majorCate'],
            minorCate: json['minorCate'],
            otherReadRatio: json['otherReadRatio'],
            retentionRatio: json['retentionRatio'],
            shortIntro: json['shortIntro'],
            site: json['site'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.sId;
        data['allowFree'] = this.allowFree;
        data['allowMonthly'] = this.allowMonthly;
        data['author'] = this.author;
        data['contentType'] = this.contentType;
        data['cover'] = this.cover;
        data['isSerial'] = this.isSerial;
        data['lastChapter'] = this.lastChapter;
        data['latelyFollower'] = this.latelyFollower;
        data['majorCate'] = this.majorCate;
        data['minorCate'] = this.minorCate;
        data['otherReadRatio'] = this.otherReadRatio;
        data['retentionRatio'] = this.retentionRatio;
        data['shortIntro'] = this.shortIntro;
        data['site'] = this.site;
        data['title'] = this.title;
        return data;
    }
}