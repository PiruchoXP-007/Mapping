#include <amxmodx>
#include <amxmisc>

enum _:enumMusic
{
    nameMap[ 40 ],
    nameMusic[ 120 ]
};

new g_music = 0;

// Lista de los mapas con reproduccion de musicas.
new const STR_DATA[][enumMusic]={
	// Lista de musicas:
	// De_Petare_TSG
	{"de_petare_tsg", "sound/vhe/de_petare/music_login/musica01.mp3"}, // Se desputa
	{"de_petare_tsg", "sound/vhe/de_petare/music_login/musica02.mp3"}, // Aleteo
	{"de_petare_tsg", "sound/vhe/de_petare/music_login/musica03.mp3"}, // Singapur
	{"de_petare_tsg", "sound/vhe/de_petare/music_login/musica04.mp3"} // ACTITUD
	// De_Petare_TSG_2X2
	{"de_petare_tsg_2x2", "sound/vhe/de_petare/music_login/musica01.mp3"}, // Se desputa
	{"de_petare_tsg_2x2", "sound/vhe/de_petare/music_login/musica02.mp3"}, // Aleteo
	{"de_petare_tsg_2x2", "sound/vhe/de_petare/music_login/musica03.mp3"}, // Singapur
	{"de_petare_tsg_2x2", "sound/vhe/de_petare/music_login/musica04.mp3"} // ACTITUD
	// AIM_Petare_TSG
	{"aim_petare_tsg", "sound/vhe/de_petare/music_login/musica01.mp3"}, // Se desputa
	{"aim_petare_tsg", "sound/vhe/de_petare/music_login/musica02.mp3"}, // Aleteo
	{"aim_petare_tsg", "sound/vhe/de_petare/music_login/musica03.mp3"}, // Singapur
	{"aim_petare_tsg", "sound/vhe/de_petare/music_login/musica04.mp3"} // ACTITUD
}

public plugin_precache(){
	register_plugin( "Musica_Loggin_Petare", "1.0", "Matias_Esf" );

	g_music = get_music( );
	precache_generic( STR_DATA[ g_music ][ nameMusic ] );	
}

public client_connect( id )
    client_cmd( id, "mp3 play ^"%s^"", STR_DATA[ g_music ][ nameMusic ] );

public get_music( )
{
    new num = 0, szMap[ 30 ]; 
    get_mapname( szMap, charsmax( szMap ) );

    for( new i = 0; i < sizeof( STR_DATA ); ++i )
    {
        if( equal( szMap, STR_DATA[ i ][ nameMap ] ) )
        {
            num = i;
            break;
        }
    }
    return num;
} 
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang3082\\ f0\\ fs16 \n\\ par }
*/
