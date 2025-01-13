# Redes de Computadores - Conceitos Avançados e Modelo OSI

## Sumário

1. [Introdução](#introducao)
2. [Modelo OSI](#modelo-osi)
   - [Camadas e Funções](#camadas-e-funcoes)
   - [Comparação com o Modelo TCP/IP](#comparacao-com-o-modelo-tcp-ip)
3. [Conceitos Avançados](#conceitos-avancados)
   - [Sub-redes e Máscaras](#sub-redes-e-mascaras)
   - [Roteamento e Protocolos](#roteamento-e-protocolos)
   - [Segurança em Redes](#seguranca-em-redes)
4. [Referências](#referencias)

---

## 1. Introdução

O modelo OSI (Open Systems Interconnection) é um framework teórico que define como sistemas de comunicação devem interagir. Este guia aborda conceitos avançados em redes, aplicáveis a sistemas Windows e Linux.

---

## 2. Modelo OSI

### Camadas e Funções

1. **Física**: Define especificações elétricas e mecânicas. Exemplo: cabos e conectores.
2. **Enlace de Dados**: Responsável pela transferência confiável entre dispositivos adjacentes. Exemplo: Ethernet.
3. **Rede**: Gerencia endereçamento e roteamento. Exemplo: IP (Internet Protocol).
4. **Transporte**: Assegura comunicação fim a fim. Exemplo: TCP/UDP.
5. **Sessão**: Gerencia sessões entre aplicações.
6. **Apresentação**: Converte dados em formatos legíveis.
7. **Aplicação**: Interface para o usuário final. Exemplo: HTTP, FTP.

### Comparação com o Modelo TCP/IP

| Modelo OSI    | Modelo TCP/IP       |
|---------------|---------------------|
| 7. Aplicação  | Aplicação           |
| 6. Apresentação | (Integrada na Aplicação) |
| 5. Sessão     | (Integrada na Aplicação) |
| 4. Transporte | Transporte          |
| 3. Rede       | Internet            |
| 2. Enlace     | Rede                |
| 1. Física     | Rede                |

---

## 3. Conceitos Avançados

### Sub-redes e Máscaras

- **Sub-rede**: Divisão lógica de uma rede maior.
- **Máscara de Sub-rede**: Define quais bits pertencem ao endereço da rede e quais ao host. Exemplo:
  - IP: `192.168.1.1`
  - Máscara: `255.255.255.0`
  - CIDR: `/24`

### Roteamento e Protocolos

- **Roteamento**: Processo de encaminhar pacotes entre redes.
- **Protocolos de Roteamento**:
  - **RIP**: Simples, mas limitado a 15 hops.
  - **OSPF**: Baseado em link-state.
  - **BGP**: Utilizado para redes na Internet.

### Segurança em Redes

- **Firewall**: Filtra tráfego de rede. Exemplos:
  - Windows: Defender Firewall.
  - Linux: `iptables`, `ufw`.
- **VPN (Virtual Private Network)**: Cria uma conexão segura através de redes públicas.
- **IDS/IPS**:
  - **IDS**: Sistema de Detecção de Intrusões.
  - **IPS**: Sistema de Prevenção de Intrusões.

---

## 4. Referências

- Tanenbaum, A. S. **Redes de Computadores**. 5ª ed. Pearson, 2010.
- Cisco. [Modelo OSI](https://www.cisco.com/c/pt_br/about.html). Acesso em 12/01/2025.
- RedHat. [Firewall e Segurança](https://www.redhat.com/). Acesso em 12/01/2025.

---

# Computer Networks - Advanced Concepts and OSI Model

## Table of Contents

1. [Introduction](#introduction)
2. [OSI Model](#osi-model)
   - [Layers and Functions](#layers-and-functions)
   - [Comparison with the TCP/IP Model](#comparison-with-the-tcp-ip-model)
3. [Advanced Concepts](#advanced-concepts)
   - [Subnets and Masks](#subnets-and-masks)
   - [Routing and Protocols](#routing-and-protocols)
   - [Network Security](#network-security)
4. [References](#references)

---

## 1. Introduction

The OSI (Open Systems Interconnection) model is a theoretical framework defining how communication systems interact. This guide covers advanced network concepts applicable to Windows and Linux systems.

---

## 2. OSI Model

### Layers and Functions

1. **Physical**: Specifies electrical and mechanical standards. Example: cables and connectors.
2. **Data Link**: Ensures reliable transfer between adjacent devices. Example: Ethernet.
3. **Network**: Handles addressing and routing. Example: IP (Internet Protocol).
4. **Transport**: Ensures end-to-end communication. Example: TCP/UDP.
5. **Session**: Manages sessions between applications.
6. **Presentation**: Converts data into readable formats.
7. **Application**: User interface. Example: HTTP, FTP.

### Comparison with the TCP/IP Model

| OSI Model       | TCP/IP Model         |
|-----------------|---------------------|
| 7. Application  | Application          |
| 6. Presentation | (Integrated in Application) |
| 5. Session      | (Integrated in Application) |
| 4. Transport    | Transport           |
| 3. Network      | Internet            |
| 2. Data Link    | Network             |
| 1. Physical     | Network             |

---

## 3. Advanced Concepts

### Subnets and Masks

- **Subnet**: Logical division of a larger network.
- **Subnet Mask**: Defines which bits belong to the network and host portions. Example:
  - IP: `192.168.1.1`
  - Mask: `255.255.255.0`
  - CIDR: `/24`

### Routing and Protocols

- **Routing**: The process of forwarding packets between networks.
- **Routing Protocols**:
  - **RIP**: Simple, limited to 15 hops.
  - **OSPF**: Based on link-state.
  - **BGP**: Used for Internet routing.

### Network Security

- **Firewall**: Filters network traffic. Examples:
  - Windows: Defender Firewall.
  - Linux: `iptables`, `ufw`.
- **VPN (Virtual Private Network)**: Creates a secure connection over public networks.
- **IDS/IPS**:
  - **IDS**: Intrusion Detection System.
  - **IPS**: Intrusion Prevention System.

---

## 4. References

- Tanenbaum, A. S. **Computer Networks**. 5th ed. Pearson, 2010.
- Cisco. [OSI Model](https://www.cisco.com/). Accessed on 01/12/2025.
- RedHat. [Firewall and Security](https://www.redhat.com/). Accessed on 01/12/2025.
