#define MAX_MODELS 30

methodmap SkinsableClient
{
    /** SkinsableClient
      Represents a client in game that can have their cosmetic apperance
      modified.
     */
    public SkinsableClient(int client)
    {
        return view_as<SkinsableClient>(client);
    }

    property int Client
    {
        public get() { return view_as<int>(this); }
    }

    property int Model
    {
        public get() { 
            return GetEntProp(this.Client, Prop_Data, "m_nModelIndex");
        }
        public set(int index) {
            SetEntProp(this.Client, Prop_Data, "m_nModelIndex", index, 2);
        }
    }

    property int BodyGroup
    {
        public set(int body_group) {
            SetEntProp(this.Client, Prop_Data, "m_nBody", body_group);
        }
    }

    property int Skin
    {
        public set(int skin) {
            SetEntProp(this.Client, Prop_Data, "m_nSkin", skin);
        }
    }

    public void Refresh()
    {
        int body_group;
        int skin;
        
        {
            body_group = 1;


        // Rangers can not have the first(white) hat but there is nothing to
        // address here. Bandidos and Rangers can not have the second(black) mask
        // but there is nothing to address here
        } 

        this.BodyGroup = body_group;
        this.Skin = skin;
    }
}
