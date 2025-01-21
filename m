Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A631F2C3C
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466990; cv=none; b=XWkI6qn0wSkCC7MlVsbRDGNGgdOY5j9/ChL9DiKGsjD4YAS+0kNpaYdZZlNx3jx+3fYnG5WHYT07D0xq2Ji6u5/9Q+y7cAgZo+s6BlmXT0nQC9tBM/dKU3y+n2orS357+q89sozyLPH2StNZdmgLkfrDZeK3V399wJLFVTcFttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466990; c=relaxed/simple;
	bh=RDihTSs5Sg4XvYheb+lm/xoPAgfffymOtYshCqpwa20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAHvunhhguMeCUwkzHHmdvfYyj+jUx1IETmlR1jbnzp0XNlMaoiNzrfT1UOyq0n2AMNJc4YDi3Gbnk767dJAG7HZGtpmGQ9aCS6MebKfyE9r3hxCfD1fgYT5Xrg9Jfg+h2CIiIOH3LDKG1JFHsvacsqZc5qdwi7HT4c6bZNCYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=o7TIqQd0; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="o7TIqQd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1737466507; bh=RDihTSs5Sg4XvYheb+lm/xoPAgfffymOtYshCqpwa20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o7TIqQd051N2r9KiYe0X9bvwVzNmkMmhcHVyF4RJ5qtmAZ4Pu4DKypS59rpPKwjHL
	 64FAa5+AqAlgx01QTxOzml1nyvoudoriihznN6iAvUPlVPXHtmCEght7HkR/R0jUhu
	 YaUqg5vbUt2N7jTRqafXqop5XUkloXUfS9OzSVwo=
Received: from [IPV6:240e:30f:334:af01:18aa:f52:2bb9:3] (unknown [IPv6:240e:30f:334:af01:18aa:f52:2bb9:3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DDE26600FE;
	Tue, 21 Jan 2025 21:35:06 +0800 (CST)
Message-ID: <75b6fec7-f168-4bc3-9479-8a089bb4e033@xen0n.name>
Date: Tue, 21 Jan 2025 21:35:06 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] LoongArch: Extend the maximum number of watchpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
 <20250121070617.3214-3-yangtiezhu@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20250121070617.3214-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/21/25 15:06, Tiezhu Yang wrote:
> The maximum number of load/store watchpoints and fetch instruction
> watchpoints is 14 each according to LoongArch Reference Manual, so
> extend the maximum number of watchpoints from 8 to 14 for ptrace.
> 
> By the way, just simply change 8 to 14 for the definition in struct
> user_watch_state at the beginning, but it may corrupt uapi, then add
> a new struct user_watch_state_v2 directly.
> 
> As far as I can tell, the only users for this struct in the userspace
> are GDB and LLDB, there are no any problems of software compatibility
> between the application and kernel according to the analysis.

But it seems something is indeed corrupted by this patch...

For example, it's entirely appropriate to mix-match debuggers and 
kernels of different UAPI revision. In this case, some kind of version 
marker must be present in the UAPI structure to prevent out-of-bounds 
accesses by the kernel. But according to the changes...

> Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
> Fixes: 1a69f7a161a7 ("LoongArch: ptrace: Expose hardware breakpoints to debuggers")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/include/uapi/asm/ptrace.h | 10 ++++++++++
>   arch/loongarch/kernel/ptrace.c           |  6 +++---
>   2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/loongarch/include/uapi/asm/ptrace.h b/arch/loongarch/include/uapi/asm/ptrace.h
> index ac915f841650..aafb3cd9e943 100644
> --- a/arch/loongarch/include/uapi/asm/ptrace.h
> +++ b/arch/loongarch/include/uapi/asm/ptrace.h
> @@ -72,6 +72,16 @@ struct user_watch_state {
>   	} dbg_regs[8];
>   };
>   
> +struct user_watch_state_v2 {
> +	uint64_t dbg_info;
> +	struct {
> +		uint64_t    addr;
> +		uint64_t    mask;
> +		uint32_t    ctrl;
> +		uint32_t    pad;
> +	} dbg_regs[14];
> +};

there seems no indication of any "version marker" field ("revision" or 
"sizeof(input)" or something like that), so...

> +
>   #define PTRACE_SYSEMU			0x1f
>   #define PTRACE_SYSEMU_SINGLESTEP	0x20
>   
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> index 19dc6eff45cc..5e2402cfcab0 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -720,7 +720,7 @@ static int hw_break_set(struct task_struct *target,
>   	unsigned int note_type = regset->core_note_type;
>   
>   	/* Resource info */
> -	offset = offsetof(struct user_watch_state, dbg_regs);
> +	offset = offsetof(struct user_watch_state_v2, dbg_regs);
>   	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
>   
>   	/* (address, mask, ctrl) registers */
> @@ -920,7 +920,7 @@ static const struct user_regset loongarch64_regsets[] = {
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>   	[REGSET_HW_BREAK] = {
>   		.core_note_type = NT_LOONGARCH_HW_BREAK,
> -		.n = sizeof(struct user_watch_state) / sizeof(u32),
> +		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),

one cannot account for older (in fact, *every existing*) clients 
expecting the old UAPI, hence providing a smaller buffer than struct 
user_watch_state_v2. In which case the kernel will happily write 
out-of-bounds if the client asks for the current watchpoint state. This 
is not acceptable I'm afraid.

>   		.size = sizeof(u32),
>   		.align = sizeof(u32),
>   		.regset_get = hw_break_get,
> @@ -928,7 +928,7 @@ static const struct user_regset loongarch64_regsets[] = {
>   	},
>   	[REGSET_HW_WATCH] = {
>   		.core_note_type = NT_LOONGARCH_HW_WATCH,
> -		.n = sizeof(struct user_watch_state) / sizeof(u32),
> +		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),
>   		.size = sizeof(u32),
>   		.align = sizeof(u32),
>   		.regset_get = hw_break_get,


-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
