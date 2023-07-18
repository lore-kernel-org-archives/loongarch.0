Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5253BF
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1689665689; bh=0dhKwcbWoqGkIlVJQTKrRCgM9NPlqkRBuK4pvbdfpdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TEd8Dgh31dm+LAQsOm/hBPLYZsO+NlDOWZUI25/DPaHR9aIAed47qGtepHcsjKi+M
	 vgInZvSHjoSM5UiWm4RE7KYC9jVWdvuA/1y4OJPZoZSH6JPZWGMVkagPkVqWpF1OAk
	 65ZAdT86vz5CSYChOTPqlEX8OfJFISbNFTkzoOSs=
Received: from [100.100.34.13] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 96C1C60103;
	Tue, 18 Jul 2023 15:34:48 +0800 (CST)
Message-ID: <e06ac133-2fd7-85f0-2ce7-d1209c6bb2ac@xen0n.name>
Date: Tue, 18 Jul 2023 15:34:47 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] LoongArch: Cleanup __builtin_constant_p() checking for
 cpu_has_*
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <20230718064819.2549052-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230718064819.2549052-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/7/18 14:48, Huacai Chen wrote:
> In current configuration, cpu_has_lsx and cpu_has_lasx are impossible
> constants. So cleanup the __builtin_constant_p() checking to reduce the

"cannot be constants"? "impossible constants" sounds like a compile-time 
error to me.

> complexity.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/fpu.h | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
> index e4193d637f66..f02f4a0d0d64 100644
> --- a/arch/loongarch/include/asm/fpu.h
> +++ b/arch/loongarch/include/asm/fpu.h
> @@ -218,12 +218,7 @@ static inline void restore_lsx(struct task_struct *t)
>   
>   static inline void init_lsx_upper(void)
>   {
> -	/*
> -	 * Check cpu_has_lsx only if it's a constant. This will allow the
> -	 * compiler to optimise out code for CPUs without LSX without adding
> -	 * an extra redundant check for CPUs with LSX.
> -	 */
> -	if (__builtin_constant_p(cpu_has_lsx) && !cpu_has_lsx)
> +	if (!cpu_has_lsx)
>   		return;
>   
>   	_init_lsx_upper();
> @@ -294,7 +289,7 @@ static inline void restore_lasx_upper(struct task_struct *t) {}
>   
>   static inline int thread_lsx_context_live(void)
>   {
> -	if (__builtin_constant_p(cpu_has_lsx) && !cpu_has_lsx)
> +	if (!cpu_has_lsx)
>   		return 0;
>   
>   	return test_thread_flag(TIF_LSX_CTX_LIVE);
> @@ -302,7 +297,7 @@ static inline int thread_lsx_context_live(void)
>   
>   static inline int thread_lasx_context_live(void)
>   {
> -	if (__builtin_constant_p(cpu_has_lasx) && !cpu_has_lasx)
> +	if (!cpu_has_lasx)
>   		return 0;
>   
>   	return test_thread_flag(TIF_LASX_CTX_LIVE);

For the foreseeable future, the changes seem appropriate to me. FWIW the 
LoongArch kernel would stay as generic as possible so I expect the 
various predicates to almost never exist as constants.

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

