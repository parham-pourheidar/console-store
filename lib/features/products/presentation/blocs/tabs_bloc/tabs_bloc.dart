import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsInitial(3)) {
    on<ChangeTab>((event, emit) {
      emit(TabChanged(event.index));
    });
  }
}
