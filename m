Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE507495
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 13:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D02CC433C7;
	Fri, 25 Aug 2023 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692971119;
	bh=p6xhQBPRgg79wDY30Dy2w8BQlNFM3BRt8/ppENFT20c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euOKz8xWzJjRsQ3Vx+frRZc42WwRYGXl0kbYGbBRwXMs43sqfwi5U+TkJLX0vJOur
	 Pt+xjN2IrFuWtd3iUFGC+KBdIQYqDL+bNG3jO/aYHsM4tZ77Cha/858Vj0XIUUJ9ih
	 MQ52cM/llKKe1UQLrg8WBtJvPwAy8f27JiNdOt2qnem8YwNsEylEnGFWuK9YsqYgQr
	 8LO5eQxushxsTVkraLCOiY8kFE1/TRwy+dD97BVndL+XjC4egW9/fTAb392co2ZCoR
	 xQa+OiKAoDTJJfKxMNiKdNxJhUKF8BJFOB1QO6jWnmStTMVguGvI1JMUnu6cobNExr
	 iUvlYD72TL3xA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BE0EE40722; Fri, 25 Aug 2023 10:45:16 -0300 (-03)
Date: Fri, 25 Aug 2023 10:45:16 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: mingo@redhat.com, peterz@infradead.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	chenhuacai@kernel.org, linux-perf-users@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn, loongarch@lists.linux.dev
Subject: Re: [PATCH v2 1/3] perf/tools: Allow to use cpuinfo on LoongArch
Message-ID: <ZOiwbNrwaodRfbSN@kernel.org>
References: <cover.1692962043.git.siyanteng@loongson.cn>
 <db968a186a10e4629fe10c26a1210f7126ad41ec.1692962043.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db968a186a10e4629fe10c26a1210f7126ad41ec.1692962043.git.siyanteng@loongson.cn>
X-Url: http://acmel.wordpress.com

Em Fri, Aug 25, 2023 at 07:28:02PM +0800, Yanteng Si escreveu:
> Define these macros so that the CPU name can be displayed
> when running perf report and perf timechart.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  tools/perf/util/header.c    | 2 ++
>  tools/perf/util/svghelper.c | 5 ++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> index 52fbf526fe74..c6e19192bd28 100644
> --- a/tools/perf/util/header.c
> +++ b/tools/perf/util/header.c
> @@ -456,6 +456,8 @@ static int write_cpudesc(struct feat_fd *ff,
>  #define CPUINFO_PROC	{ "Processor", }
>  #elif defined(__xtensa__)
>  #define CPUINFO_PROC	{ "core ID", }
> +#elif defined(__loongarch__)
> +#define CPUINFO_PROC	{ "Model Name", }
>  #else
>  #define CPUINFO_PROC	{ "model name", }
>  #endif
> diff --git a/tools/perf/util/svghelper.c b/tools/perf/util/svghelper.c
> index 5c62d3118c41..5744a3036b01 100644
> --- a/tools/perf/util/svghelper.c
> +++ b/tools/perf/util/svghelper.c
> @@ -331,7 +331,10 @@ static char *cpu_model(void)
>  	file = fopen("/proc/cpuinfo", "r");
>  	if (file) {
>  		while (fgets(buf, 255, file)) {
> -			if (strstr(buf, "model name")) {
> +			if (strcasestr(buf, "Model Name")) {
> +				strlcpy(cpu_m, &buf[13], 255);
> +				break;
> +			} else if (strcasestr(buf, "model name")) {
>  				strlcpy(cpu_m, &buf[13], 255);

Hey, the point of strcasestr() is to do a case _insensitive_ substring
search, so all we need is:

> --- a/tools/perf/util/svghelper.c
> +++ b/tools/perf/util/svghelper.c
> @@ -331,7 +331,10 @@ static char *cpu_model(void)
>  	file = fopen("/proc/cpuinfo", "r");
>  	if (file) {
>  		while (fgets(buf, 255, file)) {
> -			if (strstr(buf, "model name")) {
> +			if (strcasestr(buf, "model Name")) {
>  				strlcpy(cpu_m, &buf[13], 255);
>  				break;

Right? I'm doing this change while applying your patches.

See:

[acme@five c]$ grep -m1 "model name" /proc/cpuinfo | ./strcasestr "Model NAME"
needle=Model NAME
haystack=model name	: AMD Ryzen 9 5950X 16-Core Processor

found: model name	: AMD Ryzen 9 5950X 16-Core Processor
found[13..]: AMD Ryzen 9 5950X 16-Core Processor
[acme@five c]$ grep -m1 "model name" /proc/cpuinfo | ./strcasestr "model name"
needle=model name
haystack=model name	: AMD Ryzen 9 5950X 16-Core Processor

found: model name	: AMD Ryzen 9 5950X 16-Core Processor
found[13..]: AMD Ryzen 9 5950X 16-Core Processor
[acme@five c]$ grep -m1 "model name" /proc/cpuinfo | ./strcasestr "Model Name"
needle=Model Name
haystack=model name	: AMD Ryzen 9 5950X 16-Core Processor

found: model name	: AMD Ryzen 9 5950X 16-Core Processor
found[13..]: AMD Ryzen 9 5950X 16-Core Processor
acme@five c]$ echo "Model Name : AMD Ryzen 9 5950X 16-Core Processor" | ./strcasestr "model name"
needle=model name
haystack=Model Name	: AMD Ryzen 9 5950X 16-Core Processor

found: Model Name	: AMD Ryzen 9 5950X 16-Core Processor
found[13..]: AMD Ryzen 9 5950X 16-Core Processor
[acme@five c]$ echo "MODEL NAME : AMD Ryzen 9 5950X 16-Core Processor" | ./strcasestr "model name"
needle=model name
haystack=MODEL NAME	: AMD Ryzen 9 5950X 16-Core Processor

found: MODEL NAME	: AMD Ryzen 9 5950X 16-Core Processor
found[13..]: AMD Ryzen 9 5950X 16-Core Processor
[acme@five c]$
[acme@five c]$ cat strcasestr.c
#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
	char *needle = argv[1], haystack[128], *found;
	printf("needle=%s\n", needle);
	fgets(haystack, sizeof(haystack), stdin);
	printf("haystack=%s\n", haystack);
	found = strcasestr(haystack, needle);
	printf("found: %s", found);
	printf("found[13..]: %s", found + 13);
	return 0;
}
[acme@five c]$
