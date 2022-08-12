Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6CA36C
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1660270161; bh=ALsfHUAlUmc4h0AThtBWqmb7c6QM5Ix6LTLAeHvFhk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UJTIw5Osl+6dcb6hpGrrTY55aq611sCj7tyxZw2ku4QnTMwG+i5COft8bk/Vvzfy5
	 KcP+6uKuZsGz7BUozYKBJXMIH0iByCb5d7Zo7fajvAyeqKpGrFBgUmbg15peU4Vf/O
	 Za1PjTPzdFA3tn5vJnUe1iyBuQNtXUsnAABH/i9M=
Received: from [100.100.35.250] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1675D60074;
	Fri, 12 Aug 2022 10:09:20 +0800 (CST)
Message-ID: <2d815c7c-6187-1b38-9185-04dc3a944bd3@xen0n.name>
Date: Fri, 12 Aug 2022 10:09:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:105.0)
 Gecko/20100101 Thunderbird/105.0a1
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220811130301.2431582-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220811130301.2431582-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/11 21:03, Huacai Chen wrote:
> The kernel entry point of both boot-cpu and nonboot-cpu may be physical
> address from BootLoader (in DA mode or identity-mapping PG mode). So we
> should jump to the link address before PG enabled (DA is disabled at the
> same time) and just after DMW configured.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/kernel/head.S | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index 7062cdf0e33e..c60eb66793e3 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
>   	csrwr		t0, LOONGARCH_CSR_DMWIN0
>   	li.d		t0, CSR_DMW1_INIT	# CA, PLV0, 0x9000 xxxx xxxx xxxx
>   	csrwr		t0, LOONGARCH_CSR_DMWIN1
> +
> +	/* We might not get launched at the address the kernel is linked to,
> +	   so we jump there.  */
> +	la.abs		t0, 0f
> +	jr		t0
> +0:

This seems to be reverting to an earlier behavior IIRC. Both ways work 
on my 3A5000+7A1000+EDK2 combination.

But, exactly because both ways work on the most typical case, would you 
mind explaining the detailed scenario where the current approach fails, 
so people have some more context both when reviewing and reading the 
code some months/years later?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

