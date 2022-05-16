var SERVICES_JSON;

function init2() {
}

function init() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = getIndexJsonCB;
  xhttp.open("GET", 'services_ips.json', true);
  xhttp.setRequestHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
  xhttp.send();

  // update 'div' elemnts from STATIC_JSON
}

function getIndexJsonCB ()  {
  if (this.readyState != 4) return;
  if (this.status == 200) {
    SERVICES_JSON = JSON.parse(this.responseText);
    SERVICES_JSON = SERVICES_JSON.sort(function(a, b) {
      if (a.text < b.text)
        return -1;
      if (a.text > b.text)
        return 1;
      return 0;
    });
    updateIps();
  }
  else {
    document.getElementById('services_ips').innerHTML = 'There was an issue loading the service_ips JSON "service_ips.json"';
  }
}


function updateIps() {
  var div = document.getElementById('services_ips');
  var id = null;
  var elm = null

  function check(value, index, array) {
	if (elm && value.title == elm.id) {
      elm.href = (value.port == 443) ? 'https://' + value.host : 'http://' + value.host + ':' + value.port;
      return value;
    }
    return null
  }

  var elms = div.getElementsByTagName('a')
  for (let el in elms) {
    elm = elms[el];
    SERVICES_JSON.filter(check);
  }
}

function showDockerRestApi () {
  var host = this.host.value;
  var x1 = document.getElementById('test');
  var elms = x1.getElementsByTagName('a')
  for (let i = 0; i < elms.length; i++) {
    elm = elms[i];

    var href = elm.href;
    var offs = href.indexOf(":4243/");
    href = 'http://' + host + href.substr(offs);
    elm.href = href;
  }
}

function xxx() {
  var table = document.createElement('div');
  table.className = 'table center';
  table.id = 'main'+id;
  var old = document.getElementById(table.id);
  if (old)
    x1.removeChild( old );
  x1.appendChild( table );

  var form = document.createElement('form');
  form.action = 'showContent('+id+')'
  var lbl = document.createElement('label');

  lbl.for = 'host';
  lbl.appendChild(document.createTextNode('Select host'));
//  lbl.text = 'Select host';

  form.appendChild(lbl);
  var sel = document.createElement('select');
  sel.id = 'host';
  sel.name = 'host';

  var option = document.createElement('option');
  option.value = "volvo";
  option.text = 'Volvo';
  sel.appendChild(option);

  form.appendChild(sel);


  for (var i = 0; i < json.length;) {
    var row = document.createElement('div');
    row.className = 'row';
    table.appendChild(row);
    showVersion(json[i++], row);
  }
}
