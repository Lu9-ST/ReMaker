switch (string_length(string(score)))
{
    case 5: str = "0"+string(score); break;
    case 4: str = "00"+string(score); break;
    case 3: str = "000"+string(score); break;
    case 2: str = "0000"+string(score); break;
    case 1: str = "00000"+string(score); break;
    default: str = string(score); break;
}
return (str)
