
const faders = document.querySelectorAll('.fade-in');
const numOfCols = Math.floor((document.documentElement.clientWidth  / 280) - 0.19); // how the fuck did I end up calculating this?
const transitionDelay = 0.2;

let entryCount = 1;
let totalCount = 0;
const appearOptions = {
  threshold: 0
  //rootMargin: "0px 0px -10px 0px"
};
const appearOnScroll = new IntersectionObserver((entries, appearOnScroll) => {
  entries.forEach(entry => {
    if(!entry.isIntersecting) { //
      return
    } else {
      entry.target.style.transitionDelay = `${entryCount * transitionDelay}s` ;
      entry.target.classList.add('is-visible');
      appearOnScroll.unobserve(entry.target);

      entryCount++;
      totalCount++;

      if (entryCount > numOfCols) {
        entryCount = 1;
      }
    }
  })

  if (totalCount === faders.length) {
    setTimeout(() => {
      console.log("ping");
      const visibleFaders = document.querySelectorAll(".fade-in")
      visibleFaders.forEach(fader => {
        fader.style.transitionDelay = `0s`;
        fader.classList.toggle('scale-card')
      })
    }, 1000);
  }
}, appearOptions);

faders.forEach(fader => {
  appearOnScroll.observe(fader);
})

export {
  appearOnScroll
}

/*

*/
