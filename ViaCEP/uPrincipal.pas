unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ImgList, System.ImageList;

type
  TFrmPrincipal = class(TForm)
    Button: TButton;
    GroupBox1: TGroupBox;
    EditCEP: TEdit;
    LblCEP: TLabel;
    GroupBox2: TGroupBox;
    Memo: TMemo;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    EditLogradouro: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditLocalidade: TEdit;
    EditUF: TEdit;
    EditIBGE: TEdit;
    EditGIA: TEdit;
    EditDDD: TEdit;
    EditSIAFI: TEdit;
    LblLogradouro: TLabel;
    LblComplemento: TLabel;
    LblBairro: TLabel;
    LblLocalidade: TLabel;
    LblUF: TLabel;
    LblIBGE: TLabel;
    LblGIA: TLabel;
    LblDDD: TLabel;
    Lblsiafi: TLabel;
    LblFonte: TLabel;
    LblLink: TLabel;
    ImageList: TImageList;
    Glyph1: TGlyph;
    procedure ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

Uses
  {Web.HTTPApp,} System.JSON;

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.iPhone55in.fmx IOS}
{$R *.iPhone.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TFrmPrincipal.ButtonClick(Sender: TObject);
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

end.

