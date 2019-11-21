class BookContentEntity {
    Chapter chapter;
    bool ok;

    BookContentEntity({this.chapter, this.ok});

    factory BookContentEntity.fromJson(Map<String, dynamic> json) {
        return BookContentEntity(
            chapter: json['chapter'] != null ? Chapter.fromJson(json['chapter']) : null, 
            ok: json['ok'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ok'] = this.ok;
        if (this.chapter != null) {
            data['chapter'] = this.chapter.toJson();
        }
        return data;
    }
}

class Chapter {
    String body;
    String cpContent;
    String created;
    int currency;
    String id;
    bool isVip;
    int order;
    String title;
    String updated;

    Chapter({this.body, this.cpContent, this.created, this.currency, this.id, this.isVip, this.order, this.title, this.updated});

    factory Chapter.fromJson(Map<String, dynamic> json) {
        return Chapter(
            body: json['body'],
            cpContent: json['cpContent'],
            created: json['created'],
            currency: json['currency'],
            id: json['id'],
            isVip: json['isVip'],
            order: json['order'],
            title: json['title'],
            updated: json['updated'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body'] = this.body;
        data['cpContent'] = this.cpContent;
        data['created'] = this.created;
        data['currency'] = this.currency;
        data['id'] = this.id;
        data['isVip'] = this.isVip;
        data['order'] = this.order;
        data['title'] = this.title;
        data['updated'] = this.updated;
        return data;
    }
}