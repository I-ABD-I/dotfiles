echo Installing Required Packages
paru -S $(grep -vE '^\s*#' "pkg.lst" | awk '{print $1}')

echo Copying Config Files
cp -r ./.config/* ~/.config

echo Setting up Sddm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

echo Enableing Services
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

echo Needs Restart for everything to work...