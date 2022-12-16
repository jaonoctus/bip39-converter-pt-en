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
</template>

<style scoped></style>
