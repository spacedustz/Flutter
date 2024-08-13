class NoteInfo {
  int? id; // PK
  String title; // 아이디어 제목
  String motive; // 작성 계시
  String content; // 내용
  int priority; // 중요도 점수
  String feedback; // 유저 피드백
  int createdAt; // 생성일시 (년월일시분으로 표시해야함 나중에)

  NoteInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.priority,
    required this.feedback,
    required this.createdAt
  });

  // Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'motive': motive,
      'content': content,
      'priority': priority,
      'feedback': feedback,
      'createdAt': createdAt,
    };
  }

  // factory를 사용해 싱글톤 객체 사용
  // Map -> 데이터 객체로 변환
  factory NoteInfo.fromMap(Map<String, dynamic> map) {
    return NoteInfo(
      id: map['id'],
      title: map['title'],
      motive: map['motive'],
      content: map['content'],
      priority: map['priority'],
      feedback: map['feedback'],
      createdAt: map['createdAt'],
    );
  }
}
