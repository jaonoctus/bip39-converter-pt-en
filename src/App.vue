<script setup lang="ts">
import { ref, computed } from "vue";
import { bip39EnglishWords } from "./wordlists/english";
import { bip39PortugueseWords } from "./wordlists/portuguese";

// TODO: autodetect, word suggestion, more languages, bip39 validation.

const userInput = ref(
  "abacate abacate abacate abacate abacate abacate abacate abacate abacate abacate abacate abater"
);

const words = computed(() => {
  return userInput.value.split(" ");
});

const translatedWords = computed(() => {
  return words.value.map((searchWord) => {
    const index = getWordIndex(searchWord, bip39PortugueseWords);
    return bip39EnglishWords[index];
  });
});

const userOutput = computed(() => translatedWords.value.join(" "));

function getWordIndex(searchWord = "", wordList: string[] = []) {
  return wordList.indexOf(searchWord);
}
</script>

<template>
  <main>
    <div>
      Digite as palavras BIP39 em Português aqui (separadas por espaço):
    </div>
    <div>
      <textarea v-model="userInput" cols="30" rows="10"></textarea>
    </div>
    <div>O mnemonico em Inglês é:</div>
    <div>
      <textarea v-model="userOutput" disabled cols="30" rows="10"></textarea>
    </div>
  </main>
  <footer>
    <br/>
    <hr/>
    <p class="text-red"><br/>* AS PALAVRAS NÃO ESTÃO SENDO VALIDADAS NO MOMENTO. USE POR SUA CONTA E RISCO.</p>
    <p class="text-bold"><br/>USO OFFLINE</p>
    <p>Você pode (e deve) usar esta ferramenta sem estar conectado na internet.</p>
    <p>Baixe a última versão standalone aqui: <a href="https://github.com/jaonoctus/bip39-converter-pt-en/releases" target="_blank">https://github.com/jaonoctus/bip39-converter-pt-en/releases</a></p>
  </footer>
</template>

<style scoped>
.text-red {
  color: #FF0000;
}

.text-bold {
  font-weight: bold;
}
</style>
