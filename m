Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5ED182
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1657009953; bh=EV/+FK0A80HVNjbe/Kswv8enUhc6feszv49QHR3ih80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kbwBT7oePB/btU9gL35wABbCrXjx7kHq5BcaO8yQnvhel10BaRGjLqO66DRk41vQx
	 /dzOscml65oeFYpiG1uZo4qDvHbwKHGRUPs2XaUGgn1L5JmM1Fz2z+tzw9Ldy2hxzx
	 Sz0RdB1sDddHoV8DjR8CsAnfA46oSLbU0UxnZdzY=
Received: from [100.100.57.190] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id EB62C60114;
	Tue,  5 Jul 2022 16:32:32 +0800 (CST)
Message-ID: <f84bb217-7e2e-7919-6213-4a25ea76bf4f@xen0n.name>
Date: Tue, 5 Jul 2022 16:32:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0)
 Gecko/20100101 Thunderbird/104.0a1
Subject: Re: [PATCH] LoongArch: drop these obsolete selects in Kconfig
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705073405.29618-1-lukas.bulwahn@gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220705073405.29618-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/7/5 15:34, Lukas Bulwahn wrote:
> Commit fa96b57c1490 ("LoongArch: Add build infrastructure") adds the new
> file arch/loongarch/Kconfig.
>
> As the work on LoongArch was probably quite some time under development,
> various config symbols have changed and disappeared from the time of
> initial writing of the Kconfig file and its inclusion in the repository.
>
> The following four commits:
>
>    commit c126a53c2760 ("arch: remove GENERIC_FIND_FIRST_BIT entirely")
>    commit 140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")
>    commit aca52c398389 ("mm: remove CONFIG_HAVE_MEMBLOCK")
>    commit 3f08a302f533 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
>
> remove the mentioned config symbol, and enable the intended setup by
> default without configuration.
>
> Drop these obsolete selects in loongarch's Kconfig.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Huacai Chen, please pick this minor clean-up patch.
>
>   arch/loongarch/Kconfig | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2dee595bf4b6..9be4d0eef299 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -54,7 +54,6 @@ config LOONGARCH
>   	select GENERIC_CMOS_UPDATE
>   	select GENERIC_CPU_AUTOPROBE
>   	select GENERIC_ENTRY
> -	select GENERIC_FIND_FIRST_BIT
>   	select GENERIC_GETTIMEOFDAY
>   	select GENERIC_IRQ_MULTI_HANDLER
>   	select GENERIC_IRQ_PROBE
> @@ -77,7 +76,6 @@ config LOONGARCH
>   	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>   	select HAVE_ASM_MODVERSIONS
>   	select HAVE_CONTEXT_TRACKING_USER
> -	select HAVE_COPY_THREAD_TLS
>   	select HAVE_DEBUG_STACKOVERFLOW
>   	select HAVE_DMA_CONTIGUOUS
>   	select HAVE_EXIT_THREAD
> @@ -86,8 +84,6 @@ config LOONGARCH
>   	select HAVE_IOREMAP_PROT
>   	select HAVE_IRQ_EXIT_ON_IRQ_STACK
>   	select HAVE_IRQ_TIME_ACCOUNTING
> -	select HAVE_MEMBLOCK
> -	select HAVE_MEMBLOCK_NODE_MAP
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_NMI
>   	select HAVE_PERF_EVENTS

Looks good to me, thanks for the cleanup!

Reviewed-by: WANG Xuerui <git@xen0n.name>

