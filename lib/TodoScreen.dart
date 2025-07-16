import 'package:flutter/material.dart'; // Flutter에서 기본적으로 화면을 그릴 때 쓰는 도구 모음
import 'package:shared_preferences/shared_preferences.dart'; // 핸드폰에 데이터를 저장하는 기능을 사용할 수 있게 해주는 도구
import 'dart:convert'; // 데이터를 문자열로 바꾸거나 다시 되돌릴 때 사용하는 도구

// TodoScreen이라는 이름의 화면 클래스 (체크리스트를 보여주는 화면)
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key}); // 키는 위젯 식별용, 여기선 필요 없음

  @override
  _TodoScreenState createState() => _TodoScreenState(); // 화면 상태를 관리하는 클래스를 연결
}

// 체크리스트의 실제 내용을 담는 클래스
class _TodoScreenState extends State<TodoScreen> {
  List<String> _items = [];      // 체크리스트 항목들을 담는 리스트 (예: ["공부하기", "운동하기"])
  List<bool> _checked = [];      // 각 항목이 체크되어 있는지 저장하는 리스트 (예: [true, false])
  final TextEditingController _controller = TextEditingController(); // 텍스트 입력창에 적은 글자를 가져오기 위한 도구

  @override
  void initState() {
    super.initState();
    _loadFromPrefs(); // 앱이 시작될 때 저장된 체크리스트 불러오기
  }

  // 저장된 데이터를 로드해서 화면에 표시하기 위한 함수
  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance(); // 저장소에서 데이터를 가져옴
    final savedItems = prefs.getStringList('todo_items') ?? []; // 저장된 항목 리스트
    final savedChecks = prefs.getStringList('checked') ?? [];   // 저장된 체크 여부 리스트

    setState(() {
      _items = savedItems; // 불러온 항목들 저장
      _checked = List.generate(
        _items.length,
            (i) => i < savedChecks.length && savedChecks[i] == '1', // '1'이면 체크됨
      );
    });
  }

  // 체크리스트와 체크 상태를 저장하는 함수
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance(); // 저장소 접근
    await prefs.setStringList('todo_items', _items);     // 항목 저장
    await prefs.setStringList(
      'checked',
      _checked.map((b) => b ? '1' : '0').toList(), // true를 '1', false를 '0'으로 저장
    );
  }

  // 체크 상태가 변경됐을 때 실행되는 함수
  void _onItemChanged(int index, bool? value) {
    setState(() {
      _checked[index] = value ?? false; // 체크 여부 변경
    });
    _saveToPrefs(); // 바뀐 상태 저장
  }

  // 새로운 할 일을 추가하는 함수
  void _addItem() {
    final text = _controller.text.trim(); // 입력한 텍스트에서 공백 제거
    if (text.isNotEmpty) {
      setState(() {
        _items.add(text);      // 항목 추가
        _checked.add(false);   // 처음엔 체크 안 된 상태
        _controller.clear();   // 입력창 비우기
      });
      _saveToPrefs(); // 저장
    }
  }

  // 항목을 삭제하는 함수
  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);    // 항목 삭제
      _checked.removeAt(index);  // 해당 항목의 체크 상태도 삭제
    });
    _saveToPrefs(); // 저장
  }

  // 화면을 그리는 함수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チェックボックス')), // 상단에 제목 표시
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 화면 안쪽 여백
        child: Column(
          children: [
            // 입력창 + 추가 버튼
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller, // 입력한 텍스트를 읽어오기 위한 컨트롤러
                    decoration: const InputDecoration(
                      hintText: '入力', // 힌트 문구
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addItem, // 버튼 누르면 할 일 추가
                  icon: const Icon(Icons.add), // + 아이콘
                ),
              ],
            ),
            const SizedBox(height: 10), // 간격

            // 체크리스트 목록
            Expanded(
              child: ListView.builder(
                itemCount: _items.length, // 항목 수만큼 반복
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_items[index]), // 항목 고유 키 (삭제할 때 필요)
                    direction: DismissDirection.endToStart, // 오른쪽 → 왼쪽으로 스와이프
                    onDismissed: (_) => _deleteItem(index), // 스와이프 시 항목 삭제
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white), // 삭제 아이콘
                    ),
                    child: CheckboxListTile(
                      title: Text(_items[index]), // 할 일 내용
                      value: _checked[index],     // 체크 상태
                      onChanged: (val) => _onItemChanged(index, val), // 체크 여부 바뀔 때 실행
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
