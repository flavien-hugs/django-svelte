<script>
	import { onMount } from "svelte";

	export let name;

	let apimessage = "Waiting for server ...";

	onMount(async () => {
		let response = await fetch("/api/greet").then((resultat) => resultat.json());
		console.log(response);
		apimessage = JSON.stringify(response);
	});
</script>

<main>
	<h1>Hello {name}!</h1>

	<h3>Data from server</h3>
    {apimessage}
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
