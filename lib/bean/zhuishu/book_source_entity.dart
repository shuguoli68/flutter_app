class BookSourceEntity {
    String sId;
    int chaptersCount;
    String host;
    bool isCharge;
    String lastChapter;
    String link;
    String name;
    String source;
    bool starting;
    String updated;

    BookSourceEntity({this.sId, this.chaptersCount, this.host, this.isCharge, this.lastChapter, this.link, this.name, this.source, this.starting, this.updated});

    factory BookSourceEntity.fromJson(Map<String, dynamic> json) {
        return BookSourceEntity(
            sId: json['_id'],
            chaptersCount: json['chaptersCount'],
            host: json['host'],
            isCharge: json['isCharge'],
            lastChapter: json['lastChapter'],
            link: json['link'],
            name: json['name'],
            source: json['source'],
            starting: json['starting'],
            updated: json['updated'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.sId;
        data['chaptersCount'] = this.chaptersCount;
        data['host'] = this.host;
        data['isCharge'] = this.isCharge;
        data['lastChapter'] = this.lastChapter;
        data['link'] = this.link;
        data['name'] = this.name;
        data['source'] = this.source;
        data['starting'] = this.starting;
        data['updated'] = this.updated;
        return data;
    }
}