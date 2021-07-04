<template>
  <div
    class="
      container
      mx-auto
      text-center
      flex
      h-screen
      justify-center
      items-center
      antialiased
    "
  >
    <div class="">
      <h3 class="text-cyan-200 text-lg tracking-tight italic">
        Swords of Legends Online – Discord Bot
      </h3>
      <h4 class="text-5xl font-extralight text-cyan-300 mt-1">Coming soon</h4>

      <div class="flex grid-rows-1 mt-12 gap-16">
        <div class="text-cyan-200 space-x-2 mx-auto">
          <span class="text-3xl font-bold">{{ days }}</span>
          <span class="text-xl uppercase block tracking-wide">DAYS</span>
        </div>
        <div class="text-cyan-200 space-x-2 mx-auto">
          <span class="text-3xl font-bold">{{ hours }}</span>
          <span class="text-xl uppercase block tracking-wide">HOURS</span>
        </div>
        <div class="text-cyan-200 space-x-2 mx-auto">
          <span class="text-3xl font-bold">{{ minutes }}</span>
          <span class="text-xl uppercase block tracking-wide">MINUTES</span>
        </div>
        <div class="text-cyan-200 space-x-2 mx-auto">
          <span class="text-3xl font-bold">{{ seconds }}</span>
          <span class="text-xl uppercase block tracking-wide">SECONDS</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  data() {
    return {
      days: "?",
      hours: "?",
      minutes: "?",
      seconds: "?",
      releaseDate: null,
    };
  },
  mounted() {
    fetch(import.meta.env.VITE_API_URL + "/time/release")
      .then((response) => response.json())
      .then((json) => {
        this.releaseDate = moment.unix(json.date);
        setInterval(this.update, 1000);
      });
  },
  methods: {
    update() {
      var duration = moment.duration(this.releaseDate.diff(moment()));

      this.days = duration.days();
      this.hours = duration.hours();
      this.minutes = duration.minutes();
      this.seconds = duration.seconds();
    },
  },
};
</script>

<style>
body {
  @apply bg-gray-800;
}
</style>
