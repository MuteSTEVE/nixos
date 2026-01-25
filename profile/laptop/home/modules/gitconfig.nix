{ config, ... }:

{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name  = "dr.mutesteve";
				email = "dr.mutesteve2@proton.me";
			};
		};

	};
}
