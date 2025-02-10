part of 'home_view.dart';

class _AppBar extends AppBar {
  _AppBar()
      : super(
          leading: const Icon(Icons.menu),
          title: const Text('Guida de Motéis GO'),
          centerTitle: true,
          actions: [const Icon(Icons.search)],
        );
}

class _InitalView extends SizedBox {
  const _InitalView() : super(height: 0, width: 0);
}

class _ErrorView extends Center {
  _ErrorView({required String text}) : super(child: Text(text));
}

class _LoadingView extends Center {
  const _LoadingView() : super(child: const CircularProgressIndicator());
}

class _MotelList extends SizedBox {
  _MotelList({
    required List<Motel> motels,
  }) : super(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: motels.length,
            itemBuilder: (_, index) => _MotelCard(motel: motels[index]),
          ),
        );
}

class _MotelCard extends Card {
  _MotelCard({required Motel motel})
      : super(
          elevation: .5,
          margin: const EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  leading: _Image(url: motel.image),
                  title: _MotelTitle(name: motel.name),
                ),
                _SuiteList(suites: motel.suites),
              ],
            ),
          ),
        );
}

class _MotelTitle extends Builder {
  _MotelTitle({required String name})
      : super(
          builder: (context) => Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
}

class _SuiteList extends SizedBox {
  _SuiteList({required List<Suite> suites})
      : super(
          height: 300,
          child: ListView.builder(
            itemCount: suites.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _SuiteCard(suite: suites[index]),
          ),
        );
}

class _SuiteCard extends Padding {
  _SuiteCard({required Suite suite})
      : super(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _Image(url: suite.images[0]),
              Text(suite.name),
              Text(
                '${suite.periods[0].formattedTime} - ${suite.periods[0].value.toFormat}',
              ),
            ],
          ),
        );
}

class _Image extends CachedNetworkImage {
  _Image({required String url})
      : super(
          imageUrl: url,
          memCacheHeight: 250,
          memCacheWidth: 250,
          fit: BoxFit.cover,
          placeholder: (_, __) => CircularProgressIndicator(
            color: Colors.grey[300]!,
          ),
          errorWidget: (_, __, ___) =>
              const Icon(Icons.image_not_supported_outlined),
        );
}
