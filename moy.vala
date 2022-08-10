using Posix;

const string GREEN = "\033[1;92m";
const string BLUE = "\033[1;36m";
const string YELLOW = "\033[1;93m";
const string ORANGE = "\033[1;91m";
const string RED = "\033[1;31m";
const string NONE = "\033[0m";

int[] ft_get_random_tab(int size)
{
    var tab = new int[size];
    var n = 0;
    
    for (var i = 0; i != size; i++)
    {
        n = Random.int_range(int.MIN, int.MAX);
        if (n in tab)
            i--;
        else
            tab[i] = n;
    }
    return (tab);
}

string ft_tab_to_string(int []tab)
{
    var str = "";
    foreach (var i in tab)
        str += i.to_string() + " ";
    return(str);
}

int ft_count_line()
{
    var fd = FileStream.open ("my_file", "r");
    var i = 0;

    while (fd.read_line() != null)
        i++;
    return (i);
}

void calc_moy(string []args)
{
    var puissance = args[1] != null ? int.parse(args[1]) : 10;
    var foix = args.length > 2 ? int.parse(args[2]) : 10;
    var nbr = 0;
    var max = 0;
    var moy = 0.0;

    var i = 0;
    while(i != foix)
    {
        var tab = ft_get_random_tab(puissance);
        var str = ft_tab_to_string(tab);
        system(@"$(push_swap_emp) \"$(str)\" > my_file");
        system(@"cat ./my_file | ./checker_linux $(str) > file_check");
        nbr = ft_count_line();
        if(nbr > max)
            max = nbr;
        moy += nbr;
		var FD_CHECK = FileStream.open("file_check", "r");
		var s = FD_CHECK.read_line();
		if (s == "OK")
			print("\033[1;32m[OK] \033[0m");
		else if (s == "KO")
			print(@"\033[1;31m[KO] {$(str)}\033[0m");
        if (puissance <= 100)
		{
			if (nbr < 700)
				print(@"Nombre de coups : $(GREEN)$(nbr)$(NONE)\n"); 
			else if (nbr < 900)
				print(@"Nombre de coups : $(BLUE)$(nbr)$(NONE)\n"); 
			else if (nbr < 1100)
				print(@"Nombre de coups : $(YELLOW)$(nbr)$(NONE)\n"); 
			else if (nbr < 1500)
				print(@"Nombre de coups : $(ORANGE)$(nbr)$(NONE)\n"); 
			else
				print(@"Nombre de coups : $(RED)$(nbr)$(NONE)\n"); 
		}
		else if (puissance <= 500)
		{
			if (nbr < 5500)
				print(@"Nombre de coups : $(GREEN)$(nbr)$(NONE)\n"); 
			else if (nbr < 7000)
				print(@"Nombre de coups : $(BLUE)$(nbr)$(NONE)\n"); 
			else if (nbr < 8500)
				print(@"Nombre de coups : $(YELLOW)$(nbr)$(NONE)\n");
			else if (nbr < 11500)
				print(@"Nombre de coups : $(ORANGE)$(nbr)$(NONE)\n");
			else
				print(@"Nombre de coups : $(RED)$(nbr)$(NONE)\n");
		}
		else
			print(@"Nombre de coups : \033[1m$(nbr)\033[0m\n");
        i++;
    }
	if (puissance <= 100)
	{
		if (max < 700)
			print(@"max : $(GREEN)$(max)$(NONE)\n");
		else if (max < 900)
			print(@"max : $(BLUE)$(max)$(NONE)\n");
		else if (max < 1100)
			print(@"max : $(YELLOW)$(max)$(NONE)\n");
		else if (max < 1500)
			print(@"max : $(ORANGE)$(max)$(NONE)\n");
		else
			print(@"max : $(RED)$(max)$(NONE)\n");
	}
	else if (puissance <= 500)
	{
		if (max < 5500)
			print(@"max : $(GREEN)$(max)$(NONE)\n");
		else if (max < 7000)
			print(@"max : $(BLUE)$(max)$(NONE)\n");
		else if (max < 8500)
			print(@"max : $(YELLOW)$(max)$(NONE)\n");
		else if (max < 11500)
			print(@"max : $(ORANGE)$(max)$(NONE)\n");
		else
			print(@"max : $(RED)$(max)$(NONE)\n");
	}
	else		
		print(@"maxenne : $(GREEN)$(max)$(NONE)\n");

	moy /= i;
	if (puissance <= 100)
	{
		if (moy < 700)
			print(@"moyenne : $(GREEN)$(moy)$(NONE)\n");
		else if (moy < 900)
			print(@"moyenne : $(BLUE)$(moy)$(NONE)\n");
		else if (moy < 1100)
			print(@"moyenne : $(YELLOW)$(moy)$(NONE)\n");
		else if (moy < 1500)
			print(@"moyenne : $(ORANGE)$(moy)$(NONE)\n");
		else
			print(@"moyenne : $(RED)$(moy)$(NONE)\n");
	}
	else if (puissance <= 500)
	{
		if (moy < 5500)
			print(@"moyenne : $(GREEN)$(moy)$(NONE)\n");
		else if (moy < 7000)
			print(@"moyenne : $(BLUE)$(moy)$(NONE)\n");
		else if (moy < 8500)
			print(@"moyenne : $(YELLOW)$(moy)$(NONE)\n");
		else if (moy < 11500)
			print(@"moyenne : $(ORANGE)$(moy)$(NONE)\n");
		else
			print(@"moyenne : $(RED)$(moy)$(NONE)\n");
	}
	else		
		print(@"moyenne : $(GREEN)$(moy)$(NONE)\n");
	system("rm my_file file_check");
}
