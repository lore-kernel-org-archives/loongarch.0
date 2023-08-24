Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394EF24538
	for <loongarch@lists.linux.dev>; Thu, 24 Aug 2023 06:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1692856942; bh=vVRyuNLkZSfSbUTWRT7F8T0v3fD1MZl9S+fAoKzm0/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y4P9HQqPdEgxcHNjnvkKJCVXn8KB4BAiIfRktjuzHtAPBoaa40s0h0ZbAkdHmx5M/
	 iVKOfM8xKy8DitVEZYUgRHrn9jWDs0lB7szFluwBsKcfgdbD1jgxFDScOp+9Pvh0al
	 7PEbU40iMtg9KCQYNzVZWQb5IwMPagSnPTMyCfzI=
Received: from [192.168.9.172] (unknown [101.88.24.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2D5BD600DA;
	Thu, 24 Aug 2023 14:02:22 +0800 (CST)
Message-ID: <4df42f2b-3dde-f077-4ec9-b7e87d15fa4a@xen0n.name>
Date: Thu, 24 Aug 2023 14:02:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/4] arch/loongarch/configs/*_defconfig cleanup
To: Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-3-twoerner@gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230817115017.35663-3-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/23 19:50, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 9db5d918e2c0
> ("netfilter: ip_tables: remove clusterip target").
>
> Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
> ("netfilter: nft_objref: make it builtin").
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/loongarch/configs/loongson3_defconfig | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
> index d64849b4cba1..4700655b2bcb 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -137,7 +137,6 @@ CONFIG_NFT_MASQ=m
>   CONFIG_NFT_REDIR=m
>   CONFIG_NFT_NAT=m
>   CONFIG_NFT_TUNNEL=m
> -CONFIG_NFT_OBJREF=m
>   CONFIG_NFT_QUEUE=m
>   CONFIG_NFT_QUOTA=m
>   CONFIG_NFT_REJECT=m
> @@ -227,7 +226,6 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
>   CONFIG_IP_NF_TARGET_NETMAP=m
>   CONFIG_IP_NF_TARGET_REDIRECT=m
>   CONFIG_IP_NF_MANGLE=m
> -CONFIG_IP_NF_TARGET_CLUSTERIP=m
>   CONFIG_IP_NF_TARGET_ECN=m
>   CONFIG_IP_NF_TARGET_TTL=m
>   CONFIG_IP_NF_RAW=m

Acked-by: WANG Xuerui <git@xen0n.name>

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

