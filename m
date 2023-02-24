Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A97C
	for <loongarch@lists.linux.dev>; Fri, 24 Feb 2023 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1677224368; bh=8pT5NHFFPI6K+UXL7Ee2pQvDYSUg1+u8JZdamiAcObc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KLuijKcYq92b5tQpiwoNnvwRdC/YLJtdHQdafrKzJChZ3sVXK5VAWz5iu8KhysDH+
	 PKVkgxNhxOW22GaM3tVu9FyWA9BqEejynz1j9lbN4d2x8uF3bXytjAIBrwClooEC1j
	 /Y0Vp76fovMU2TnX8+o12OAFQB0d55xa41BcOyT4=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 449E8600DA;
	Fri, 24 Feb 2023 15:39:28 +0800 (CST)
Message-ID: <78e9232e-ff2f-fc17-edc2-560c5bced72b@xen0n.name>
Date: Fri, 24 Feb 2023 15:39:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] LoongArch/syscall: remove asm/unistd.h include from
 syscall.c
Content-Language: en-US
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
References: <20230224064921.299908-1-lienze@kylinos.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230224064921.299908-1-lienze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/2/24 14:49, Enze Li wrote:
> At first glance, this inclusion looks weird.  After digging further, I

It's not weird, it's just overriding the fallback entries with actual 
function pointers for the existing supported syscalls.

> realized that there's no need to include the "asm/unistd.h" file.  I've
> tested this patch for a few weeks, and didn't see any regressions.
> Therefore, removes the unnecessary inclusion.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>   arch/loongarch/kernel/syscall.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
> index 3fc4211db989..4dea411e9e0d 100644
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -31,7 +31,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
>   
>   void *sys_call_table[__NR_syscalls] = {
>   	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
> -#include <asm/unistd.h>

Is this really supposed to work? You're removing *every* handler from 
the syscall table so every single syscall will just -ENOSYS. I don't 
believe you can test such a kernel "for a few weeks without regressions".

>   };
>   
>   typedef long (*sys_call_fn)(unsigned long, unsigned long,
> 
> base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

