# WebService CEP Delphi/FireMonkey
* Consulta de CEP (em ViaCEP)
* Consumo de API / Web Service
* Uso de JSON
* Delphi / FireMonkey

![image](https://github.com/amancio10/WebServiceCEP_Delphi/assets/48102777/20ee70e9-1e63-4a79-8a29-7380ed04a644)
 
 ## ⚡️ Coding...
* ### Uses
 ```delphi
uses
  System.JSON;
```
* ### Variável
```delphi
 Const URLBase  = 'https://viacep.com.br';
 const ParamURL = 'ws/';
 const EndURL   = '/json';
var
  CEP : string;

  {Retorno do meu JSON}
  Retorno : TJSONObject;

{$Region 'Pair / Nós'}
  Pair_Logradouro  : TJSONPair;
  Pair_Complemento : TJSONPair;
  Pair_Bairro      : TJSONPair;
  Pair_Localidade  : TJSONPair;
  Pair_UF    : TJSONPair;
  Pair_IBGE  : TJSONPair;
  Pair_GIA   : TJSONPair;
  Pair_DDD   : TJSONPair;
  Pair_SIAFI : TJSONPair;
{$EndRegion 'Pair / Nós'}

{$Region 'Para exibir na tela'}
  Logradouro  : String;
  Complemento : String;
  Bairro      : String;
  Localidade  : String;
  UF    : String;
  IBGE  : String;
  GIA   : String;
  DDD   : String;
  SIAFI : String;
{$EndRegion 'Para exibir na tela'}
```
* ### Comando
```delphi
begin
 {Montando a URL da chamada}
 CEP := EditCEP.Text;
 RESTClient.BaseURL   := URLBase;
 RESTRequest.Resource := ParamURL + CEP + EndURL;

 {Chamando o WebServiço}
 RESTRequest.Execute;

 {Exibe o retorno no Memo}
 Memo.Text := RESTRequest.Response.JSONText;

 {Atribuindo o retorno do JSON}
 Retorno := RESTRequest.Response.JSONValue as TJSONObject;

{$Region 'Alimentando os Pair's / Nós'}
 Pair_Logradouro  := Retorno.Get('logradouro');
 Pair_Complemento := Retorno.Get('complemento');
 Pair_Bairro      := Retorno.Get('bairro');
 Pair_Localidade  := Retorno.Get('localidade');
 Pair_UF          := Retorno.Get('uf');
 Pair_IBGE        := Retorno.Get('ibge');
 Pair_GIA         := Retorno.Get('gia');
 Pair_DDD         := Retorno.Get('ddd');
 Pair_SIAFI       := Retorno.Get('siafi');
{$EndRegion 'Alimentando os Pair's / Nós'}

{$Region 'Alimentando as variáveis String'}
 Logradouro  := Pair_Logradouro.JsonValue.Value;
 Complemento := Pair_Complemento.JsonValue.Value;
 Bairro      := Pair_Bairro.JsonValue.Value;
 Localidade  := Pair_Localidade.JsonValue.Value;
 UF          := Pair_UF.JsonValue.Value;
 IBGE        := Pair_IBGE.JsonValue.Value;
 GIA         := Pair_GIA.JsonValue.Value;
 DDD         := Pair_DDD.JsonValue.Value;
 SIAFI       := Pair_SIAFI.JsonValue.Value;
{$EndRegion 'Alimentando as variáveis String'}

{$Region 'Exibir dados tratados em tela'}
 EditLogradouro.Text  := Logradouro;
 EditComplemento.Text := Complemento;
 EditBairro.Text      := Bairro;
 EditLocalidade.Text  := Localidade;
 EditUF.Text    := UF;
 EditIBGE.Text  := IBGE;
 EditGIA.Text   := GIA;
 EditDDD.Text   := DDD;
 EditSIAFI.Text := SIAFI;
{$EndRegion 'Exibir dados tratados em tela'}
end;
```
