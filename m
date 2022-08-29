Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812482F31
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1661768301; bh=AQf7Y+PACVxGUB/6c+6RJXN0ovHaKQP7Aja2+E93maQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rYBy0iX0j3WmFCEfOLyq9Gt2P5I4WTeaLvV8/RB1T39azBceVCdD6tb9XsR0yAGl/
	 UsDRM1VB8YoTo9pJRkb8HVwkn5wjf7qQ6/P/nJWnhaeQW0lflDk0HQUu7j7mKnjW1j
	 yRHUho4nYZtJR5K1xiyzMt1VSgX9ap+B2i31M3v8=
Received: from [100.100.57.219] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 30D8C600D9;
	Mon, 29 Aug 2022 18:18:21 +0800 (CST)
Message-ID: <9c13e812-7e43-52f7-dd6e-306946dc0d42@xen0n.name>
Date: Mon, 29 Aug 2022 18:18:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0)
 Gecko/20100101 Thunderbird/106.0a1
Subject: Re: [PATCH] LoongArch: Fix warning: #warning syscall fstat not
 implemented
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1661766931-7277-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <1661766931-7277-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/29 17:55, Tiezhu Yang wrote:
> Define __ARCH_WANT_NEW_STAT to fix the following build warning:
> 
>    CALL    scripts/checksyscalls.sh
> <stdin>:569:2: warning: #warning syscall fstat not implemented [-Wcpp]
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/include/uapi/asm/unistd.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/loongarch/include/uapi/asm/unistd.h b/arch/loongarch/include/uapi/asm/unistd.h
> index fcb6689..b344b1f 100644
> --- a/arch/loongarch/include/uapi/asm/unistd.h
> +++ b/arch/loongarch/include/uapi/asm/unistd.h
> @@ -1,4 +1,5 @@
>   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#define __ARCH_WANT_NEW_STAT
>   #define __ARCH_WANT_SYS_CLONE
>   #define __ARCH_WANT_SYS_CLONE3
>   
No. We explicitly removed support for fstat/newfstatat in favor of 
statx, so the correct way forward is to amend the checksyscalls.sh, to 
make it aware of the fact that loongarch is the latest shiny addition so 
it doesn't carry any of the "legacy" around.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

