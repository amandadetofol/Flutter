import '../../../models/journal.dart';
import 'journal_card.dart';

List<JournalCard> generateListJournalCards(
    {required int windowPage,
    required DateTime currentDay,
    required Function refreshFunction,
    required Map<String, Journal> database,
    required int userId,
    required String userToken}) {
  // Cria uma lista de Cards vazios
  List<JournalCard> list = List.generate(
    windowPage + 1,
    (index) => JournalCard(
        showedDate: currentDay.subtract(Duration(days: (windowPage) - index)),
        refresh: refreshFunction,
        userId: userId,
        token: userToken),
  );

  //Preenche os espaços que possuem entradas no banco
  database.forEach((key, value) {
    if (value.createdAt
        .isAfter(currentDay.subtract(Duration(days: windowPage)))) {
      int difference = value.createdAt
          .difference(currentDay.subtract(Duration(days: windowPage)))
          .inDays
          .abs();

      list[difference] = JournalCard(
          showedDate: list[difference].showedDate,
          journal: value,
          refresh: refreshFunction,
          userId: userId,
          token: userToken);
    }
  });
  return list;
}
