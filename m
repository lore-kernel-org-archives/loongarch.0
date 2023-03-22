Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5F23D4
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1679483362; bh=Dx4KKfYUa3saxw4ZiDY+1yllUPKh1pQ5ZReMkCQ6IZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S6xuEyMzM7kohFb0GwgobajiVP/rDKkcAZSPuy50FFfkC8xSY+ZOjKZRxaPUwqsTl
	 UTOj9hWGv4hyhH9EIqV8txow8/D8LhDuWsN9FNiNPaFS6RtwHbjcns8XVbK7cHe0W1
	 oji4sn0qmYcSoEnx/BlcpbRBnXrGbMZX+18y8eFs=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3EE826006F;
	Wed, 22 Mar 2023 19:09:22 +0800 (CST)
Message-ID: <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
Date: Wed, 22 Mar 2023 19:09:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
Content-Language: en-US
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
References: <20230322090533.4079453-1-lienze@kylinos.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230322090533.4079453-1-lienze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/22 17:05, Enze Li wrote:
> When I use the latest version of lscpu to check my CPU info, I see,
> 
> ======
> Architecture:          loongarch64
>    Byte Order:          Little Endian
> CPU(s):                4
>    On-line CPU(s) list: 0-3
> Model name:            -
>    Thread(s) per core:  1
>    Core(s) per socket:  4
> ...
> ======
> 
> Obviously, the "Model name" field shows me with a "-", which means the
> lscpu failed to retrieve the correct information from the /proc/cpuinfo
> file.
> 
> The main problem is that, the lscpu only identifies the data by its
> "model name" field.  However, on the LoongArch platform, only 'Model
> Name' is provided, which cannot be accurately identified due to case
> sensitivity issues.  And I think that must be an oversight.
> 
> This patch fixes this issue.  With this patch applied, I get,
> 
> ======
> Architecture:          loongarch64
>    Byte Order:          Little Endian
> CPU(s):                4
>    On-line CPU(s) list: 0-3
> Model name:            Loongson-3A5000-HV
>    Thread(s) per core:  1
>    Core(s) per socket:  4
> ...
> ======
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>   arch/loongarch/kernel/proc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index 5c67cc4fd56d..7da56f9ee15c 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -50,7 +50,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
>   	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
>   	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
> -	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
> +	seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);

NAK: it's userspace-visible ABI change. AFAIK there are already multiple 
downstream adaptations (made by Loongson folks) that rely on the current 
spelling, which may not have any fallback mechanism built in (e.g. 
recognize both "Model Name" and "model name", match case-insensitively, 
etc).

It's better to adapt the downstream projects instead, for example you 
could make them more resilient to a hypothetic future arch's similar 
change by making them match case-insensitively.

>   	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
>   	seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
>   	seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",
> 
> base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

