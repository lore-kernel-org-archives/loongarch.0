Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5017C8
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1656149475; bh=vTNVhF1+7D1O5qZqp0P2k5Vd4q9zXO6mcYhzdI2e+g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=udXhW2stTwjhg2VwTuoVNFg4JiF/XG1r3xJaYFWs6f/DNXg+16A7cg0fAezoCOr6g
	 ga+1PelFiouOi9RoNqrFVPImh9tulS45jNxOu9jxePwNItYWSlU/JMRfrYO7jaAykX
	 3UnVXjy9J3gipJQhDi6q/1JZYcKQw7xQG1ucNW88=
Received: from [192.168.9.172] (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7F42060723;
	Sat, 25 Jun 2022 17:31:15 +0800 (CST)
Message-ID: <e960e9c9-dec6-6ac6-ed7c-7ba60e1f4ace@xen0n.name>
Date: Sat, 25 Jun 2022 17:31:15 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0a1
Subject: Re: [PATCH] LoongArch: Fix the _stext symbol address
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220625090150.3171909-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220625090150.3171909-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/22 17:01, Huacai Chen wrote:
> _stext means the start of .text section (see __is_kernel_text()), but we
> put its definition in .ref.text by mistake. Fix it by defining it at the
> head of head.S.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/kernel/head.S | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index e596dfcd924b..d8c625b89c7d 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -12,10 +12,10 @@
>   #include <asm/loongarch.h>
>   #include <asm/stackframe.h>
>   
> -	__REF
> -
>   SYM_ENTRY(_stext, SYM_L_GLOBAL, SYM_A_NONE)
>   
> +	__REF
> +
So why aren't we going the riscv way and just define _stext in 
vmlinux.lds.S so that there's no chance it's placed incorrectly?
>   SYM_CODE_START(kernel_entry)			# kernel entry point
>   
>   	/* Config direct window and set PG */

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

