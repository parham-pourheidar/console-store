String dividePrice(String price) {
  if (price.length > 6) {
    return '${price.substring(0, price.length - 6)},${price.substring(price.length - 6, price.length - 3)},${price.substring(price.length - 3)}';
  } else {
    return '${price.substring(0, price.length - 3)},${price.substring(price.length - 3)}';
  }
}
