const faders = document.querySelectorAll(".fade-in");
const numOfCols = Math.floor(document.documentElement.clientWidth / 280 - 0.19); // how the fuck did I end up calculating this?
const transitionDelay = 0.2;
const refreshLinks = document.querySelectorAll(".js-refresh");

let entryCount = 1;
let totalCount = 0;
const appearOptions = {
  threshold: 0,
  //rootMargin: "0px 0px -10px 0px"
};
const appearOnScroll = new IntersectionObserver((entries, appearOnScroll) => {
  entries.forEach((entry) => {
    if (!entry.isIntersecting) {
      return;
    } else {
      entry.target.style.transitionDelay = `${entryCount * transitionDelay}s`;
      entry.target.classList.add("is-visible");
      appearOnScroll.unobserve(entry.target);

      entryCount++;
      totalCount++;

      if (entryCount > numOfCols) {
        entryCount = 1;
      }
    }
  });

  refreshLinks.forEach((link) => {
    return link.addEventListener("click", () => {
      const linkHtml = link.innerHTML;
      console.log(linkHtml);
      if (linkHtml === "CLEAR") return window.location.replace(`/`);
      if (linkHtml === "Handyman") {
        return window.location.replace(`/?category=Handy&commit=Search`);
      }
      window.location.reload();
      window.location.replace(`/?category=${linkHtml}&commit=Search`);
    });
  });

  if (totalCount === faders.length) {
    setTimeout(() => {
      const visibleFaders = document.querySelectorAll(".fade-in");
      visibleFaders.forEach((fader) => {
        fader.style.transitionDelay = `0s`;
        fader.classList.toggle("scale-card");
      });
    }, 1000);
  }
}, appearOptions);

faders.forEach((fader) => {
  appearOnScroll.observe(fader);
});

export { appearOnScroll };

/*

*/
