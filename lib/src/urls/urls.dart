import 'package:url_launcher/url_launcher.dart';



// URL NEITOR


abrirPaginaNeitor() async {
  const url = 'https://neitor.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}
abrirPagina2Jl() async {
  const url = 'http://2jl.ec';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}

//URLS ATLANTIC

abrirPaginaAtlantic() async
{
  const url = 'https://www.atlantic.edu.ec/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}

abrirEnFacebookAtlantic() async
{
  const url = 'https://www.facebook.com/atlanticsuperior/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}
abrirEnInstagramAtlantic() async
{
  const url = 'https://www.instagram.com/atlantic_ist/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}

abrirEnTwitterAtlantic() async
{
  const url = 'https://twitter.com/ITS_ATLANTIC_';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir: $url';
  }
}

