class ReadingMat {
  String title;
  String textFile;
  int snippetLength;

  ReadingMat(
      {required this.title,
      required this.textFile,
      required this.snippetLength});

  getTitle() {
    return title;
  }

  getTextFile() {
    return textFile;
  }

  getSnippetLength() {
    return snippetLength;
  }
}
