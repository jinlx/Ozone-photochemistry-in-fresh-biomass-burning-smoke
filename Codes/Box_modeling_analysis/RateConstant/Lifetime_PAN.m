% Constants and parameters
M = 2.5E19;
temperatures = [270, 275, 280, 285, 290, 295, 300]; % Temperature array
lifetimes = zeros(1, length(temperatures));
percentage_loss = zeros(1, length(temperatures)); % Array to hold percentage loss of PAN

% Calculate lifetime for each temperature using the predefined function
for idx = 1:length(temperatures)
    lifetimes(idx) = 1 / (GCJPLEQ_acabab(M, temperatures(idx), 9.00d-29, 14000.0d0, 7.3d-29, 4.1d0, 9.5d-12, 1.6d0, 0.6d0)) / 86400 * 24; % lifetime in hours
    percentage_loss(idx) = 100 * (1 - exp(-5 / lifetimes(idx))); % calculate the percentage loss in 5 hours
end

% Plotting the results for lifetime
figure;
plot(temperatures, lifetimes, 'o-');
xlabel('Temperature (K)');
ylabel('Lifetime (hours)');
title('Lifetime vs Temperature');
grid on;

% Plotting the results for percentage loss
figure;
plot(temperatures, percentage_loss, 's-'); % Using square markers for distinction
xlabel('Temperature (K)');
ylabel('Percentage Loss of PAN (%)');
title('Percentage of PAN Loss due to Chemical Reactions in 5 Hours');
grid on;

% Save the figures to files
saveas(gcf, './Percentage_Loss_PAN_5_Hours.png');  % Save the PAN loss figure
saveas(figure(1), './Lifetime_vs_Temperature_hours.png');  % Save the lifetime figure with appropriate file name
