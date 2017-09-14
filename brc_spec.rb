# coding: utf-8

describe 'Brcobranca free from AM and AS' do
  it 'runs' do
    expect { require 'brcobranca' }.not_to raise_error
  end

  it 'generates boleto' do
    # uncomment the following line to make this test pass
    #require 'coveralls'; Coveralls.wear!

    require 'brcobranca'

    # criação de um pagamento válido
    pagamento = Brcobranca::Remessa::Pagamento.new(valor: 199.9,
                                                   data_vencimento: Date.today,
                                                   nosso_numero: 123,
                                                   documento_sacado: '12345678901',
                                                   nome_sacado: 'nome',
                                                   endereco_sacado: 'endereco',
                                                   bairro_sacado: 'bairro',
                                                   cep_sacado: '12345678',
                                                   cidade_sacado: 'cidade',
                                                   uf_sacado: 'SP')

    # criação da instância
    bradesco = Brcobranca::Remessa::Cnab400::Bradesco.new(carteira: '01',
                                                          agencia: '12345',
                                                          conta_corrente: '1234567',
                                                          digito_conta: '1',
                                                          empresa_mae: 'asd',
                                                          sequencial_remessa: '1',
                                                          codigo_empresa: '123',
                                                          pagamentos: [pagamento])

    # criação da remessa
    expect { bradesco.gera_arquivo }.not_to raise_error
  end
end

