//
//  DataSource.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
enum getDataSource {
    private static let defaultJson = """
        {
            "header": {
                "title": {
                    "text": "Olá, Pedro",
                    "font_size": 24,
                    "color": "#CCCCCC"
                }
            },
            "items": [
                {
                    "id": "balance_section",
                    "type": "balance",
                    "content": {
                        "amount": {
                            "currency_symbol": "R$",
                            "value": {
                                "text": "90,93",
                                "font_size": 28,
                                "color": "#000000"
                            }
                        },
                        "items": [
                            {
                                "id": "pix",
                                "title": {
                                    "text": "Pix",
                                    "font_size": 14,
                                    "color": "#CCCCCC"
                                },
                                "icon": "pix-icon",
                                "deeplink": "swiftbankapp://pix"
                            },
                            {
                                "id": "transferir",
                                "title": {
                                    "text": "Transferir",
                                    "font_size": 14,
                                    "color": "#CCCCCC"
                                },
                                "icon": "transfer-money-icon"
                            },
                            {
                                "id": "qr-code",
                                "title": {
                                    "text": "QR Code",
                                    "font_size": 14,
                                    "color": "#CCCCCC"
                                },
                                "icon": "qr-code-icon"
                            },
                            {
                                "id": "recarga",
                                "title": {
                                    "text": "Recarga",
                                    "font_size": 14,
                                    "color": "#CCCCCC"
                                },
                                "icon": "cellphone-icon"
                            }
                        ]
                    }
                },
                {
                    "id": "generic_section",
                    "type": "generic_section",
                    "content": {
                        "title": {
                            "text": "Empréstimos",
                            "font_size": 16,
                            "color": "#CCCCCC"
                        },
                        "subtitle": {
                            "text": "Simule seu crédito e antecipe seus planos!",
                            "font_size": 12,
                            "color": "#CCCCCC"
                        }
                    }
                },
                {
                    "id": "credit_card",
                    "type": "credit_card",
                    "content": {
                        "title": {
                            "text": "Cartão final 9999",
                            "font_size": 16,
                            "color": "#CCCCCC"
                        },
                        "icon": "master-card-icon",
                        "subtitle": {
                            "text": "Limite disponível",
                            "font_size": 12,
                            "color": "#CCCCCC"
                        },
                        "value": {
                            "text": "R$ 9.074,00",
                            "font_size": 17,
                            "color": "#CCCCCC"
                        },
                        "due_date": {
                            "text": "Vence em 04/05",
                            "font_size": 12,
                            "color": "#CCCCCC"
                        }
                    }
                },
                {
                    "id": "generic_section",
                    "type": "generic_section",
                    "content": {
                        "title": {
                            "text": "Poupança",
                            "font_size": 16,
                            "color": "#CCCCCC"
                        },
                        "subtitle": {
                            "text": "Guarde dinheiro e realize grandes sonhos.",
                            "font_size": 12,
                            "color": "#CCCCCC"
                        }
                    }
                },
                {
                    "id": "generic_section",
                    "type": "generic_section",
                    "content": {
                        "title": {
                            "text": "Seguros",
                            "font_size": 16,
                            "color": "#CCCCCC"
                        },
                        "subtitle": {
                            "text": "Mantenha protegido o que há de mais importante em sua vida.",
                            "font_size": 12,
                            "color": "#CCCCCC"
                        }
                    }
                }
            ]
        }
        
        """
    static func getData() -> String{
        return defaultJson
    }
}
