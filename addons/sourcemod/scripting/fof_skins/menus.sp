void ShowSkinsMenu(SkinsableClient fclient)
{

    Menu menu = new Menu(SkinsMenuSelected);

    menu.SetTitle("Fistful Of Skins");

    menu.AddItem("1", "Skins Admin");
    menu.AddItem("2", "Western");
    menu.AddItem("3", "Games");
    menu.AddItem("4", "Horror/Terror");
    menu.AddItem("5", "Mix Skins");
    
    menu.ExitBackButton = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
}


SkinsMenuSelected(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
                    case 1: { SkinsAdmin(fclient); }
					case 2: { Western(fclient); }
					case 3: { Games(fclient); }
					case 4: { HorrorTerror(fclient); }
				    case 5: { Mix(fclient); }

                }
            }
        case MenuAction_End: delete menu;
    }
}

void SkinsAdmin(SkinsableClient fclient)
{
    if (CheckCommandAccess(fclient.Client, "", ADMFLAG_SLAY))  
	{
    Menu menu = new Menu(SkinsAdminlist);
    menu.SetTitle("Escolha uma Skin");

    menu.AddItem("0", "PathFinder");
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("8", " Voltar/Back");

    menu.Pagination = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
	}
	else
    {
    ReplyToCommand(fclient.Client, "%t", "no access");
    }
}

SkinsAdminlist(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
                    case 0: { fclient.Model = g_PathFinderModelIndex; }
                    case 8: { ShowSkinsMenu(fclient); }
                }

                fclient.Refresh();
            }
        case MenuAction_End: delete menu;
    }
}

void Western(SkinsableClient fclient)
{
    Menu menu = new Menu(Westernlist);
    menu.SetTitle("Escolha uma Skin");

    menu.AddItem("0", "Arthur Morgan");
    menu.AddItem("1", "John Marston");
    menu.AddItem("2", "Erron Black");
    menu.AddItem("3", "Ray Mccall");
    menu.AddItem("4", "Prisoner");
    menu.AddItem("5", "Billy The Kid");
    menu.AddItem("6", "Buffalo Bill");
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("8", " Voltar/Back");	


    menu.Pagination = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
}

Westernlist(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
                    case 0: { fclient.Model = g_ArthurMorganModelIndex; }
                    case 1: { fclient.Model = g_JohnMarstonModelIndex; }
                    case 2: { fclient.Model = g_ErronBlackModelIndex; }
                    case 3: { fclient.Model = g_raymccallModelIndex; }
                    case 4: { fclient.Model = g_prisonerModelIndex; }
                    case 5: { fclient.Model = g_billythekidModelIndex; }
                    case 6: { fclient.Model = g_BuffaloBillModelIndex; }
					case 8: { ShowSkinsMenu(fclient); }

                }

                fclient.Refresh();
            }
        case MenuAction_End: delete menu;
    }
}

void Games(SkinsableClient fclient)
{
    Menu menu = new Menu(Gameslist);
    menu.SetTitle("Escolha uma Skin");

    menu.AddItem("0", "Trevor");
    menu.AddItem("1", "Hitman");
    menu.AddItem("2", "Joel");
    menu.AddItem("3", "Vaas");
    menu.AddItem("4", "Sniper TF2");
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("8", " Voltar/Back");	

    menu.Pagination = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
}

Gameslist(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
					case 0: { fclient.Model = g_TrevorModelIndex; }
					case 1: { fclient.Model = g_hitmanModelIndex; }
                    case 2: { fclient.Model = g_joelModelIndex; }
                    case 3: { fclient.Model = g_vaasModelIndex; }
                    case 4: { fclient.Model = g_sniperModelIndex; }
					case 8: { ShowSkinsMenu(fclient); }
                }

                fclient.Refresh();
            }
        case MenuAction_End: delete menu;
    }
}

void HorrorTerror(SkinsableClient fclient)
{
    Menu menu = new Menu(HorrorTerrorlist);
    menu.SetTitle("Escolha uma Skin");

    menu.AddItem("0", "Jason");
    menu.AddItem("1", "Demon Violinist");
    menu.AddItem("2", "The Trapper");
    menu.AddItem("3", "Revenant");
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("8", " Voltar/Back");	


    menu.Pagination = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
}

HorrorTerrorlist(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
                    case 0: { fclient.Model = g_JasonModelIndex; }
					case 1: { fclient.Model = g_DemonViolinistModelIndex;}
				    case 2: { fclient.Model = g_TheTrapperModelIndex;}
				    case 3: { fclient.Model = g_revenantModelIndex;}
					case 8: { ShowSkinsMenu(fclient); }

                }

                fclient.Refresh();
            }
        case MenuAction_End: delete menu;
    }
}

void Mix(SkinsableClient fclient)
{
    Menu menu = new Menu(Mixlist);
    menu.SetTitle("Escolha uma Skin");

    menu.AddItem("0", "john wick");
    menu.AddItem("1", "Zack Halloween");
    menu.AddItem("2", "Danny Trejo");
    menu.AddItem("3", "Plague Doktor");
    menu.AddItem("4", "Samurai");
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("", "", ITEMDRAW_SPACER);
    menu.AddItem("8", " Voltar/Back");	


    menu.Pagination = false;
    menu.ExitButton = true;
    menu.Display(fclient.Client, 20);
}

Mixlist(Menu menu, MenuAction action, param1, param2)
{
    switch (action)
    {
        case MenuAction_Select:
            {
                SkinsableClient fclient = SkinsableClient(param1);

                char choice[32];
                menu.GetItem(param2, choice, sizeof(choice));

                switch (StringToInt(choice))
                {
                    case 0: { fclient.Model = g_johnwickModelIndex;}
					case 1: { fclient.Model = g_zackModelIndex;}
                    case 2: { fclient.Model = g_dannytrejoModelIndex;}
                    case 3: { fclient.Model = g_plaguedoktorModelInde;}
                    case 4: { fclient.Model = g_samuraiModelIndex;}
					case 8: { ShowSkinsMenu(fclient); }

                }

                fclient.Refresh();
            }
        case MenuAction_End: delete menu;
    }
}