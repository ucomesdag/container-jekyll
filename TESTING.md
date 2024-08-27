# Testing

To test the container before publication, run these steps.

1. `container_hash=$(podman build . -q)`.
2. Create the an empty html directory: `mkdir html`.
3. Run: `podman run -ti --rm --volume=$PWD/html/:/srv/jekyll -p 4000:4000 -p 35729:35729 ${container_hash}`
4. Navigate to `http://localhost:4000`.
