function labels = mapLabels(textLabels)

	labels = zeros(1, length(textLabels));

	for i=1:length(textLabels)
		if strcmp(textLabels{i},'walk')
			labels(i) = 1;
		end
		if strcmp(textLabels{i},'kick')
			labels(i) = 2;
                end
		if strcmp(textLabels{i},'run')
                	labels(i) = 3;
		end
		if strcmp(textLabels{i},'fall')
			labels(i) = 4;
                end
		if strcmp(textLabels{i},'dribble')
			labels(i) = 5;
                end
		if strcmp(textLabels{i},'hand_kick')
			labels(i) = 6;
                end
		if strcmp(textLabels{i},'throw')
			labels(i) = 7;
                end
		if strcmp(textLabels{i},'stand')
			labels(i) = 8;
                end
		if strcmp(textLabels{i},'goalkeeper')
			labels(i) = 9;
                end

	end

end
