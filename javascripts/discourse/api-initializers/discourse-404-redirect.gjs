import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("redirect-404", (api) => {
  // Get the Ember router service
  const router = api.container.lookup("service:router");

  // Set your redirect target
  const targetTopicUrl = settings.redirect_destination;

  api.onPageChange(() => {
    const currentRoute = router.currentRoute;

    if (
      currentRoute &&
      currentRoute.name === "unknown" &&
      router.currentURL !== targetTopicUrl
    ) {
      window.location.replace(targetTopicUrl);
    }
  });
});
