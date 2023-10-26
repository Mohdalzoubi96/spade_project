class SocketUpdatedTime {
  int? id;
  String? from;
  String? to;
  int? timeLeft;
  String? nowDate;
  String? start;
  String? end;
  bool? isBetween;
  bool? isOpenForSeller;
  bool? isOpenForBuyer;
  bool? isLocal;
  bool? isFreezone;
  List<int>? openDays;
  int? day;

  SocketUpdatedTime(
      {this.id,
        this.from,
        this.to,
        this.timeLeft,
        this.nowDate,
        this.start,
        this.end,
        this.isBetween,
        this.isOpenForSeller,
        this.isOpenForBuyer,
        this.isLocal,
        this.isFreezone,
        this.openDays,
        this.day});

  SocketUpdatedTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    timeLeft = json['timeLeft'];
    nowDate = json['nowDate'];
    start = json['start'];
    end = json['end'];
    isBetween = json['isBetween'];
    isOpenForSeller = json['isOpenForSeller'];
    isOpenForBuyer = json['isOpenForBuyer'];
    isLocal = json['is_local'];
    isFreezone = json['is_freezone'];
    openDays = json['open_days'].cast<int>();
    day = json['day'];
  }

  SocketUpdatedTime.fromJsonWithNoData(Map<String, dynamic> json) {
    timeLeft = json['timeLeft'];
    isBetween = json['isBetween'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    data['timeLeft'] = this.timeLeft;
    data['nowDate'] = this.nowDate;
    data['start'] = this.start;
    data['end'] = this.end;
    data['isBetween'] = this.isBetween;
    data['isOpenForSeller'] = this.isOpenForSeller;
    data['isOpenForBuyer'] = this.isOpenForBuyer;
    data['is_local'] = this.isLocal;
    data['is_freezone'] = this.isFreezone;
    data['open_days'] = this.openDays;
    data['day'] = this.day;
    return data;
  }
}
