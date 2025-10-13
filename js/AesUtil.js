/**
 * A utility class for AES encryption and decryption.
 * It uses PBKDF2 for secure key derivation from a passphrase.
 *
 * @param {number} keySize The key size in bits (e.g., 128, 256).
 * @param {number} iterationCount The number of iterations for PBKDF2.
 */
var AesUtil = function(keySize, iterationCount) {
  // CryptoJS works with key sizes in 32-bit words, so we convert bits to words.
  this.keySize = keySize / 32;
  this.iterationCount = iterationCount;
};

/**
 * Generates a cryptographic key from a passphrase and salt using PBKDF2.
 * This is a crucial step for making passwords secure.
 *
 * @param {string} salt A unique, random string to salt the passphrase.
 * @param {string} passPhrase The secret password or passphrase.
 * @returns {CryptoJS.WordArray} The derived key as a WordArray object.
 */
AesUtil.prototype.generateKey = function(salt, passPhrase) {
  var key = CryptoJS.PBKDF2(
    passPhrase, 
    CryptoJS.enc.Hex.parse(salt), 
    { 
      keySize: this.keySize, 
      iterations: this.iterationCount,
      hasher: CryptoJS.algo.SHA1 // <-- CHANGE THIS LINE TO SHA1
    }
  );
  return key;
}

/**
 * Encrypts plaintext data using a derived key and a unique IV.
 * The output is a Base64-encoded string.
 *
 * @param {string} salt The salt used for key derivation.
 * @param {string} iv The initialization vector for the encryption.
 * @param {string} passPhrase The secret passphrase.
 * @param {string} plainText The data to be encrypted.
 * @returns {string} The Base64-encoded ciphertext.
 */
AesUtil.prototype.encrypt = function(salt, iv, passPhrase, plainText) {
  var key = this.generateKey(salt, passPhrase);
  var encrypted = CryptoJS.AES.encrypt(
    plainText,
    key,
    { iv: CryptoJS.enc.Hex.parse(iv) });
  return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
}

/**
 * Decrypts a Base64-encoded ciphertext string.
 *
 * @param {string} salt The salt used for key derivation.
 * @param {string} iv The initialization vector for decryption.
 * @param {string} passPhrase The secret passphrase.
 * @param {string} cipherText The Base64-encoded ciphertext to be decrypted.
 * @returns {string} The original plaintext.
 */
AesUtil.prototype.decrypt = function(salt, iv, passPhrase, cipherText) {
  var key = this.generateKey(salt, passPhrase);
  // Recreate the CipherParams object from the Base64 ciphertext string.
  var cipherParams = CryptoJS.lib.CipherParams.create({
    ciphertext: CryptoJS.enc.Base64.parse(cipherText)
  });
  var decrypted = CryptoJS.AES.decrypt(
    cipherParams,
    key,
    { iv: CryptoJS.enc.Hex.parse(iv) });
  return decrypted.toString(CryptoJS.enc.Utf8);
}