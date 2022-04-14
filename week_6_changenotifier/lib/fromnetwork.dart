import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_6_changenotifier/provider/appstate_provider.dart';

class Intermediate extends StatefulWidget {
  final String? title;
  const Intermediate({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _IntermediateState createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextDisplay(),
                TextEditWidget(),
                ElevatedButton(
                  onPressed: () {
                    appState.fetchData();
                  },
                  child: Text("Fetch Data  "),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextDisplay extends StatefulWidget {
  const TextDisplay({Key? key}) : super(key: key);

  @override
  _TextDisplayState createState() => _TextDisplayState();
}

class _TextDisplayState extends State<TextDisplay> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        appState.getdisplaytext ?? '',
        style: const TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}

class TextEditWidget extends StatefulWidget {
  const TextEditWidget({Key? key}) : super(key: key);

  @override
  _TextEditWidgetState createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        labelText: "Some Text",
        border: OutlineInputBorder(),
      ),
      onChanged: (changed) => appState.setDisplayText(changed),
      onSubmitted: (submitted) => appState.setDisplayText(submitted),
    );
  }
}

class ResponseDisplay extends StatefulWidget {
  @override
  _ResponseDisplayState createState() => _ResponseDisplayState();
}

class _ResponseDisplayState extends State<ResponseDisplay> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: appState.isFetching
          ? CircularProgressIndicator()
          : appState.getResponseJson() != null
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: appState.getResponseJson().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            appState.getResponseJson()[index]['avatar']),
                      ),
                      title: Text(
                        appState.getResponseJson()[index]["first_name"],
                      ),
                    );
                  },
                )
              : Text("Press Button above to fetch data"),
    );
  }
}
