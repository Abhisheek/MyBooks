import 'dart:html';
import 'dart:convert';

void onDataLoaded(String responseText) {
  var jsonString = responseText;
  Map data = JSON.decode(responseText);
  print(jsonString);
  querySelector('#mn_div').children.clear();
  var books = (
                data['items'] as List
              ).forEach((Map item) 
                       {
                          DivElement first = new DivElement();
                          DivElement forImg = new DivElement();
                          ParagraphElement title = new ParagraphElement();
                          ParagraphElement publisher = new ParagraphElement();
                          ParagraphElement publishedDate = new ParagraphElement();
                          ParagraphElement pagecount = new ParagraphElement();
                          ParagraphElement language = new ParagraphElement();
                          ParagraphElement description = new ParagraphElement();
                          ParagraphElement athr = new ParagraphElement();
                          ParagraphElement spc = new ParagraphElement();
                          ParagraphElement tnail = new ParagraphElement();
                          HRElement h = new HRElement();
                          
                         print('Thumbnail: ${item['volumeInfo']['imageLinks']['thumbnail']}');
                          
                          
                          var thumb_img=item['volumeInfo']['imageLinks']['thumbnail'];
                          ImageElement image = new ImageElement(src:thumb_img);
                        
                          querySelector('#mn_div').children.add(first);
                          //first.classes.add(mdiv); 
                          first.children.add(tnail);
                          first.children.add(h);
                          forImg.classes.add(".mdiv");
                          forImg.children.add(image);
                          tnail.children.add(forImg);
                          
                          
                          
                          print('Title: ${item['volumeInfo']['title']}');
                          title.text = 'Title: ${item['volumeInfo']['title']}';
                          tnail.children.add(title);
                          
                          print('Publisher: ${item['volumeInfo']['publisher']}');
                          publisher.text = 'Publisher: ${item['volumeInfo']['publisher']}';
                          tnail.children.add(publisher);
                          
                          print('Published Date: ${item['volumeInfo']['publishedDate']}');
                          publishedDate.text = 'Published Date: ${item['volumeInfo']['publishedDate']}';
                          tnail.children.add(publishedDate);
                          
                          
                          print('Page count: ${item['volumeInfo']['pagecount']}');
                          pagecount.text = 'Pages: ${item['volumeInfo']['pageCount']}';
                          tnail.children.add(pagecount);
                          
                          print('Language: ${item['volumeInfo']['language']}');
                          language.text = 'Language: ${item['volumeInfo']['language']}';
                          tnail.children.add(language);
                          
                          print('Description: ${item['volumeInfo']['description']}');
                          description.text = 'Description: ${item['volumeInfo']['description']}';
                          tnail.children.add(description);
                       
                       });
} 

main() {
   print('Inside main');
  querySelector('#gbqfb').onClick.listen(loadData);
  querySelector('#gbqfq').onChange.listen(loadData);
  

}

void loadData(Event e) {
  print('Inside loadData');
  var phr=querySelector('#gbqfq').value;
  var url = "https://www.googleapis.com/books/v1/volumes?q=" + phr;
  var request = HttpRequest.getString(url).then(onDataLoaded);
}
