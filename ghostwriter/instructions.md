# Instructions for Ghostwriter (PT-BR / EN-US)

## PT-BR: Como Utilizar o Ghostwriter

### 1. **Recompor os Arquivos**
Se você recebeu o Ghostwriter em partes comprimidas, siga estas etapas para juntar as partes e acessar o programa:

1. **Certifique-se de ter todas as partes:**
   - Arquivos nomeados como `ghostwriter.part_00`, `ghostwriter.part_01`, etc.

2. **Abra o terminal na pasta com as partes.**

3. **Execute o seguinte comando para unir os arquivos:**
   ```bash
   cat ghostwriter.part_* > ghostwriter.7z
   ```

4. **Teste a integridade do arquivo gerado:**
   ```bash
   7z t ghostwriter.7z
   ```
   - Se o teste retornar "OK", o arquivo está íntegro.

5. **Extraia o conteúdo:**
   ```bash
   7z x ghostwriter.7z
   ```

6. **Acesse o programa:**
   Navegue até a pasta extraída e execute o arquivo `ghostwriter.exe`.

---

## EN-US: How to Use Ghostwriter

### 1. **Recompose the Files**
If you received Ghostwriter in compressed parts, follow these steps to merge the parts and access the program:

1. **Ensure you have all parts:**
   - Files named `ghostwriter.part_00`, `ghostwriter.part_01`, etc.

2. **Open a terminal in the folder containing the parts.**

3. **Run the following command to merge the files:**
   ```bash
   cat ghostwriter.part_* > ghostwriter.7z
   ```

4. **Test the integrity of the generated file:**
   ```bash
   7z t ghostwriter.7z
   ```
   - If the test returns "OK," the file is intact.

5. **Extract the content:**
   ```bash
   7z x ghostwriter.7z
   ```

6. **Access the program:**
   Navigate to the extracted folder and run the `ghostwriter.exe` file.

---

### Referências / References
- Ghostwriter é mantido por [Werner Dieter](https://github.com/wereturtle) (data de referência: janeiro de 2025).
- Ferramenta de compactação utilizada: [7-Zip](https://www.7-zip.org/) para Linux.

---
