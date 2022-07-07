#!/bin/bash
cd ~
sudo apt remove cmdtest -y
curl -sL https://deb.nodesource.com/setup_current.x | sudo bash -
sudo apt install nodejs -y
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install yarn -y
yarn global add pm2

clear

node_version=$(node -v)
yarn_version=$(yarn -v)
pm2_version=$(pm2 -v)

printf "\n\n\e[38;2;85;85;255;49m▄\e[48;2;85;255;255m   \e[38;2;85;255;255;48;2;85;254;255m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;84;255;255m▄\e[38;2;85;254;255;48;2;85;255;255m▄\e[38;2;83;255;254;48;2;83;255;255m▄\e[49m \e[38;2;85;85;255;49m▄▄\e[48;2;85;255;255m  \e[48;2;89;255;255m \e[38;2;85;85;255;49m▄\e[38;2;85;131;255;48;2;84;255;255m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;84;255;255m▄\e[49m  \e[38;2;85;85;255;49m▄\e[38;2;85;149;255;48;2;85;255;255m▄\e[48;2;85;255;255m    \e[38;2;84;255;255;48;2;85;255;255m▄\e[48;2;85;255;255m    \e[49m  \e[38;2;86;86;255;49m▄\e[38;2;85;129;255;48;2;85;255;255m▄\e[38;2;85;255;255;48;2;84;255;255m▄\e[48;2;85;255;255m   \e[48;2;85;254;255m \e[48;2;85;255;255m  \e[49m       \e[38;2;85;85;255;49m▄\e[38;2;85;255;255;48;2;84;255;255m▄\e[48;2;85;255;255m \e[38;2;83;255;254;48;2;83;255;255m▄\e[49m  \e[38;2;85;85;255;49m▄\e[48;2;85;255;255m    \e[38;2;85;255;255;48;2;85;254;255m▄\e[48;2;85;255;255m  \e[49m  \e[38;2;83;83;255;49m▄\e[38;2;85;106;255;48;2;88;255;255m▄\e[38;2;85;255;254;48;2;85;255;255m▄\e[48;2;85;255;255m   \e[38;2;85;255;255;48;2;84;255;255m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;85;255;254m▄\e[49m  \e[38;2;85;85;255;49m▄\e[38;2;85;194;255;48;2;84;255;255m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;85;255;254m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;85;254;255m▄\e[38;2;85;255;255;48;2;85;255;254m▄\e[48;2;85;255;255m  \e[38;2;85;255;254;48;2;85;255;255m▄\e[48;2;85;255;255m \e[49m  \e[38;2;85;85;255;49m▄\e[38;2;85;174;255;48;2;84;255;255m▄\e[48;2;85;255;255m \e[38;2;85;255;255;48;2;84;255;255m▄\e[48;2;85;255;255m     \e[49m  \e[38;2;85;85;254;49m▄\e[38;2;85;255;255;48;2;84;255;255m▄\e[38;2;85;254;255;48;2;85;255;255m▄\e[48;2;85;255;255m \e[49m      \e[38;2;83;83;255;49m▄\e[38;2;85;85;255;49m▄\e[48;2;85;255;255m  \e[38;2;81;254;255;48;2;81;255;255m▄\e[49m    \e[m
\e[48;2;85;85;255m \e[48;2;85;255;255m \e[38;2;79;249;249;48;2;77;247;246m▄\e[38;2;77;239;247;48;2;78;182;248m▄\e[38;2;83;83;255;48;2;85;85;255m▄\e[48;2;85;85;255m \e[38;2;77;247;247;48;2;74;244;244m▄\e[48;2;85;255;255m \e[48;2;83;255;255m \e[49m \e[48;2;85;85;255m \e[38;2;85;85;254;48;2;85;85;255m▄\e[38;2;84;255;255;48;2;85;255;255m▄\e[38;2;77;246;247;48;2;74;245;244m▄\e[48;2;78;244;244m \e[38;2;84;85;255;48;2;85;85;255m▄\e[38;2;83;128;253;48;2;82;128;252m▄\e[38;2;77;247;247;48;2;74;244;245m▄\e[48;2;85;255;255m \e[49m  \e[48;2;85;85;255m \e[38;2;89;89;255;48;2;85;85;255m▄▄▄\e[38;2;85;85;255;48;2;85;84;255m▄\e[48;2;85;255;255m \e[38;2;79;249;249;48;2;76;246;246m▄\e[38;2;77;235;248;48;2;79;168;249m▄\e[38;2;89;89;255;48;2;85;85;254m▄\e[38;2;89;89;255;48;2;85;85;255m▄\e[49m   \e[48;2;86;86;255m \e[48;2;85;129;255m \e[48;2;85;255;255m \e[38;2;77;247;247;48;2;74;244;244m▄\e[38;2;89;89;254;48;2;85;85;255m▄\e[38;2;84;85;255;48;2;85;85;255m▄\e[38;2;80;194;250;48;2;78;193;248m▄\e[38;2;80;250;250;48;2;78;248;248m▄\e[48;2;85;255;255m \e[49m       \e[38;2;85;85;255;48;2;85;85;254m▄\e[48;2;85;255;255m \e[38;2;78;248;248;48;2;76;246;246m▄\e[38;2;77;246;246;48;2;74;244;244m▄\e[49m  \e[48;2;85;85;255m \e[48;2;85;255;255m \e[38;2;77;246;246;48;2;74;244;244m▄\e[38;2;79;224;250;48;2;81;139;251m▄\e[38;2;85;84;255;48;2;85;85;255m▄\e[38;2;85;89;255;48;2;85;88;255m▄\e[38;2;77;247;247;48;2;74;244;244m▄\e[48;2;85;255;255m \e[49m  \e[48;2;83;83;255m \e[48;2;85;106;255m \e[38;2;85;255;255;48;2;85;255;254m▄\e[38;2;77;247;247;48;2;74;244;244m▄\e[38;2;89;88;255;48;2;85;85;255m▄\e[38;2;89;89;255;48;2;85;85;255m▄\e[38;2;88;89;255;48;2;85;85;255m▄\e[38;2;80;80;255;48;2;85;84;255m▄\e[49m   \e[38;2;81;81;255;48;2;85;85;254m▄\e[38;2;89;89;255;48;2;85;85;255m▄▄\e[38;2;81;81;255;48;2;85;85;254m▄\e[48;2;85;85;255m \e[48;2;85;255;255m \e[38;2;77;247;247;48;2;74;244;244m▄\e[38;2;78;217;249;48;2;82;126;252m▄\e[38;2;89;88;255;48;2;85;85;255m▄\e[38;2;85;85;255;48;2;84;84;254m▄\e[49m   \e[48;2;85;85;255m \e[38;2;85;174;255;48;2;85;175;255m▄\e[48;2;83;253;253m \e[38;2;77;247;247;48;2;74;244;244m▄\e[38;2;89;89;255;48;2;85;85;255m▄\e[48;2;85;85;255m \e[38;2;76;238;247;48;2;74;235;245m▄\e[38;2;82;252;252;48;2;81;251;251m▄\e[48;2;85;255;255m \e[49m  \e[48;2;85;85;255m \e[48;2;85;255;255m \e[38;2;79;249;249;48;2;77;247;247m▄\e[38;2;76;248;248;48;2;75;245;244m▄\e[49m      \e[48;2;83;83;255m \e[48;2;85;85;255m \e[48;2;85;255;255m \e[38;2;77;247;247;48;2;74;244;244m▄\e[38;2;81;242;242;48;2;67;242;242m▄\e[49m    \e[m
\e[48;2;85;85;255m \e[38;2;84;255;254;48;2;83;253;253m▄\e[38;2;54;224;224;48;2;60;230;231m▄\e[38;2;58;228;228;48;2;61;232;232m▄\e[38;2;81;251;251;48;2;79;245;250m▄\e[38;2;42;212;212;48;2;53;180;222m▄\e[38;2;42;212;212;48;2;51;221;221m▄\e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;83;255;254;48;2;83;250;250m▄\e[49m \e[38;2;85;84;255;48;2;85;85;255m▄\e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;42;212;212;48;2;51;221;221m▄\e[38;2;44;211;211;48;2;55;222;222m▄\e[48;2;85;85;255m \e[38;2;73;120;243;48;2;76;122;246m▄\e[38;2;42;212;212;48;2;51;221;221m▄\e[38;2;84;254;254;48;2;82;253;253m▄\e[49m      \e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;85;254;254;48;2;82;252;252m▄\e[38;2;84;255;255;48;2;82;251;251m▄\e[49m     \e[48;2;86;86;255m \e[38;2;85;128;255;48;2;84;128;254m▄\e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;42;213;212;48;2;51;221;221m▄\e[49m \e[48;2;85;85;255m \e[38;2;56;171;226;48;2;62;177;232m▄\e[38;2;57;227;226;48;2;63;233;233m▄\e[38;2;84;254;254;48;2;82;253;253m▄\e[49m       \e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;47;217;217;48;2;55;225;225m▄\e[38;2;41;212;212;48;2;52;221;221m▄\e[49m  \e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;43;213;213;48;2;52;222;222m▄\e[38;2;41;211;211;48;2;50;220;220m▄\e[48;2;84;85;255m \e[48;2;84;88;254m \e[38;2;42;212;212;48;2;51;221;221m▄\e[38;2;85;254;254;48;2;82;253;253m▄\e[49m  \e[48;2;83;83;255m \e[48;2;85;106;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;84;254;254;48;2;80;251;251m▄\e[38;2;42;212;212;48;2;43;212;212m▄\e[38;2;78;248;248;48;2;76;247;247m▄\e[38;2;61;231;231;48;2;60;231;231m▄\e[38;2;42;213;212;48;2;43;212;212m▄\e[38;2;42;212;212;48;2;43;212;212m▄\e[49m      \e[48;2;85;85;255m \e[38;2;84;255;254;48;2;83;253;253m▄\e[38;2;84;254;254;48;2;81;251;251m▄\e[38;2;84;251;251;48;2;80;251;251m▄\e[49m     \e[48;2;85;85;255m \e[48;2;84;173;254m \e[38;2;75;245;245;48;2;76;246;246m▄\e[38;2;42;212;212;48;2;51;221;221m▄\e[38;2;84;254;254;48;2;81;252;252m▄\e[38;2;42;212;212;48;2;53;180;223m▄\e[38;2;42;212;212;48;2;51;219;221m▄\e[38;2;68;238;238;48;2;71;241;241m▄\e[38;2;84;254;254;48;2;83;254;254m▄\e[49m  \e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;84;254;254;48;2;82;253;252m▄\e[38;2;83;255;255;48;2;82;252;252m▄\e[49m      \e[48;2;83;83;255m \e[48;2;85;85;255m \e[38;2;84;254;254;48;2;83;253;253m▄\e[38;2;84;254;254;48;2;81;251;251m▄\e[38;2;81;255;255;48;2;81;254;255m▄\e[49m    \e[m
\e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;234;235m▄\e[38;2;38;208;208;48;2;47;217;217m▄\e[38;2;52;167;222;48;2;57;199;227m▄\e[38;2;85;85;255;48;2;81;180;252m▄\e[38;2;85;85;255;48;2;60;159;231m▄\e[38;2;36;206;206;48;2;40;210;210m▄\e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;42;213;212;48;2;68;234;234m▄\e[49m \e[48;2;85;85;255m  \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;36;206;206;48;2;40;210;210m▄\e[38;2;33;200;200;48;2;44;211;211m▄\e[48;2;85;85;255m \e[38;2;72;118;242;48;2;73;119;243m▄\e[38;2;36;206;206;48;2;40;210;210m▄\e[38;2;42;212;212;48;2;65;235;235m▄\e[49m      \e[38;2;85;84;255;48;2;85;85;255m▄\e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;37;207;207;48;2;64;234;234m▄\e[38;2;36;206;207;48;2;63;234;234m▄\e[49m     \e[38;2;86;86;255;48;2;86;87;255m▄\e[38;2;74;118;244;48;2;80;124;250m▄\e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;36;207;206;48;2;40;210;210m▄\e[49m \e[48;2;85;85;255m \e[38;2;52;167;222;48;2;55;169;224m▄\e[38;2;38;208;208;48;2;49;219;219m▄\e[38;2;43;212;212;48;2;66;235;235m▄\e[49m       \e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;37;206;207;48;2;43;213;213m▄\e[38;2;36;205;205;48;2;41;210;210m▄\e[49m  \e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;36;206;206;48;2;40;210;210m▄\e[38;2;35;205;205;48;2;41;208;208m▄\e[48;2;85;85;255m \e[48;2;84;88;254m \e[38;2;36;206;207;48;2;40;210;210m▄\e[38;2;43;212;212;48;2;65;235;235m▄\e[49m  \e[38;2;84;84;255;48;2;82;83;255m▄\e[38;2;85;85;255;48;2;85;97;255m▄\e[38;2;85;85;254;48;2;83;182;253m▄\e[38;2;85;85;255;48;2;83;182;253m▄\e[38;2;85;85;255;48;2;60;159;230m▄\e[38;2;85;85;255;48;2;80;179;250m▄\e[38;2;59;151;228;48;2;61;197;230m▄\e[38;2;38;207;207;48;2;40;210;210m▄\e[48;2;42;212;212m \e[49m      \e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;36;206;206;48;2;63;233;233m▄\e[38;2;35;205;205;48;2;62;232;232m▄\e[49m     \e[48;2;85;85;255m \e[38;2;62;151;232;48;2;75;164;245m▄\e[38;2;41;211;211;48;2;60;230;230m▄\e[38;2;36;206;206;48;2;40;210;210m▄\e[38;2;85;85;255;48;2;83;182;253m▄\e[38;2;85;85;255;48;2;60;159;230m▄\e[38;2;38;199;209;48;2;41;207;211m▄\e[38;2;40;210;210;48;2;56;226;226m▄\e[38;2;42;213;213;48;2;65;236;236m▄\e[49m  \e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;38;209;208;48;2;64;235;234m▄\e[38;2;36;207;207;48;2;63;235;235m▄\e[49m      \e[38;2;83;83;255;48;2;82;83;255m▄\e[48;2;85;85;255m \e[38;2;42;212;212;48;2;65;235;235m▄\e[38;2;36;206;206;48;2;63;233;233m▄\e[38;2;40;201;201;48;2;67;228;228m▄\e[49m    \e[m
\e[48;2;85;85;255m \e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;9;178;178;48;2;32;202;202m▄\e[38;2;0;171;171;48;2;28;199;199m▄\e[48;2;81;81;255m \e[48;2;85;85;255m \e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;29;199;199;48;2;41;210;211m▄\e[38;2;31;198;198;48;2;42;208;208m▄\e[49m \e[38;2;85;84;255;48;2;85;85;255m▄\e[48;2;85;85;255m \e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;0;169;169;48;2;13;185;185m▄\e[38;2;0;170;170;48;2;75;95;245m▄\e[38;2;0;170;170;48;2;64;121;235m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[49m      \e[38;2;85;85;255;48;2;85;84;255m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;6;176;176;48;2;31;201;201m▄\e[38;2;0;170;171;48;2;29;199;199m▄\e[49m     \e[48;2;86;86;255m \e[38;2;71;114;241;48;2;74;117;244m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;0;169;169;48;2;0;170;171m▄\e[38;2;1;170;170;48;2;78;92;248m▄\e[38;2;0;170;170;48;2;44;164;214m▄\e[38;2;10;180;180;48;2;33;203;203m▄\e[38;2;29;200;200;48;2;41;211;211m▄\e[49m       \e[48;2;85;85;255m \e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;4;175;174;48;2;30;200;200m▄\e[38;2;0;169;169;48;2;29;199;199m▄\e[49m  \e[38;2;85;85;254;48;2;85;85;255m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;1;171;171;48;2;29;199;199m▄\e[38;2;0;170;170;48;2;29;196;196m▄\e[48;2;85;85;255m \e[38;2;83;87;253;48;2;84;88;254m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[49m   \e[38;2;0;166;167;49m▄\e[38;2;0;169;169;48;2;0;170;170m▄▄▄\e[38;2;0;170;170;48;2;77;93;247m▄\e[38;2;0;170;170;48;2;51;150;221m▄\e[38;2;7;176;177;48;2;31;201;201m▄\e[38;2;29;199;199;48;2;41;211;210m▄\e[49m      \e[38;2;84;85;255;48;2;85;85;255m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;0;170;170;48;2;27;197;197m▄\e[49m     \e[48;2;85;85;255m \e[38;2;56;145;226;48;2;62;151;232m▄\e[38;2;23;193;193;48;2;38;208;208m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[49m \e[48;2;85;85;255m \e[38;2;5;165;175;48;2;32;192;202m▄\e[38;2;18;188;188;48;2;36;206;206m▄\e[38;2;29;200;200;48;2;41;212;212m▄\e[49m  \e[38;2;85;85;255;48;2;85;85;254m▄\e[38;2;28;199;199;48;2;41;211;211m▄\e[38;2;8;179;178;48;2;32;202;202m▄\e[38;2;0;170;170;48;2;27;197;196m▄\e[38;2;1;169;169;48;2;0;170;170m▄\e[38;2;0;169;169;48;2;0;170;170m▄\e[38;2;0;169;168;48;2;0;170;170m▄\e[38;2;0;169;169;48;2;0;170;170m▄\e[38;2;0;174;174;49m▄\e[49m \e[38;2;82;83;255;48;2;83;83;255m▄\e[38;2;85;84;255;48;2;85;85;255m▄\e[38;2;29;199;199;48;2;41;211;211m▄\e[38;2;0;170;170;48;2;28;198;198m▄\e[38;2;0;169;169;48;2;14;184;184m▄\e[38;2;0;169;169;48;2;0;170;170m▄▄▄▄\e[m
\e[38;2;84;85;255;48;2;85;85;255m▄\e[38;2;85;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;7;177;177m▄\e[38;2;87;86;255;48;2;0;171;171m▄\e[38;2;81;80;255;48;2;81;81;255m▄\e[38;2;85;85;255;48;2;85;85;254m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[49;38;2;24;194;194m▀\e[49;38;2;26;193;193m▀\e[49m \e[48;2;85;85;255m \e[48;2;85;85;254m \e[38;2;85;85;255;48;2;25;194;194m▄\e[38;2;85;85;255;48;2;0;170;170m▄▄▄▄\e[38;2;85;85;254;48;2;0;170;171m▄\e[49;38;2;24;194;194m▀\e[49m      \e[48;2;85;85;255m \e[38;2;85;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;5;175;175m▄\e[38;2;84;84;255;48;2;0;171;171m▄\e[49m     \e[38;2;86;86;255;48;2;86;87;255m▄\e[38;2;85;85;255;48;2;69;113;238m▄\e[38;2;85;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[38;2;85;85;254;48;2;0;170;171m▄\e[38;2;85;85;255;48;2;0;170;170m▄▄\e[38;2;84;84;255;48;2;9;178;178m▄\e[49;38;2;24;193;193m▀\e[49m       \e[38;2;85;85;254;48;2;85;85;255m▄\e[38;2;84;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;3;172;173m▄\e[38;2;83;83;255;48;2;0;169;169m▄\e[49m  \e[38;2;85;85;254;48;2;85;85;255m▄\e[38;2;85;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;1;171;171m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[48;2;85;85;255m \e[38;2;85;85;255;48;2;83;87;253m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[49;38;2;24;194;194m▀\e[49m  \e[48;2;83;83;255m \e[38;2;85;85;255;48;2;74;96;244m▄\e[38;2;85;85;254;48;2;0;170;171m▄\e[38;2;85;85;255;48;2;0;170;170m▄▄▄▄\e[38;2;85;85;255;48;2;5;175;175m▄\e[49;38;2;24;194;195m▀\e[49m      \e[38;2;85;85;255;48;2;84;85;255m▄\e[38;2;85;84;255;48;2;24;195;194m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[38;2;85;85;255;48;2;1;170;170m▄\e[49m     \e[38;2;85;85;255;48;2;84;85;255m▄\e[38;2;85;85;255;48;2;53;142;223m▄\e[38;2;85;85;255;48;2;19;189;188m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[49m \e[48;2;85;85;255m \e[38;2;85;85;255;48;2;5;165;175m▄\e[38;2;85;85;255;48;2;15;184;185m▄\e[49;38;2;23;194;195m▀\e[49m  \e[48;2;85;85;255m \e[38;2;85;85;255;48;2;25;194;194m▄\e[38;2;85;85;255;48;2;6;177;176m▄\e[38;2;85;85;255;48;2;0;170;170m▄▄\e[38;2;85;84;255;48;2;0;170;170m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[49;38;2;0;170;170m▀▀\e[49m \e[48;2;83;83;255m \e[38;2;85;85;255;48;2;85;84;255m▄\e[38;2;85;85;255;48;2;24;194;194m▄\e[38;2;85;85;255;48;2;0;170;170m▄▄▄\e[38;2;84;85;255;48;2;0;170;170m▄\e[38;2;85;85;255;48;2;0;170;170m▄\e[49;38;2;0;170;170m▀\e[m\n
";
printf "\nThanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall
Node version: $node_version
Yarn version: $yarn_version
PM2 version: $pm2_version
"