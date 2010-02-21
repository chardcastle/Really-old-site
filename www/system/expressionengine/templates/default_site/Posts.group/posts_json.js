[
{exp:channel:entries
orderby="date" 
limit="9"
paginate="top"}
{
	"index":{absolute_count}
	"title",{title},
	"body",{body}
	{if absolute_count < 9},{/if}
}
{/exp:channel:entries}
]