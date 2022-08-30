Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019736A
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 02:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1661828095; bh=jicVVKpBA+cgvSfNxC/C7jbvEsQZylNBRPCAz8Pbepc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mJ8W4cnQ35S5Y3Ib7frUpIObfVTiRs0QTvpSjGzeUwZBQq4wQHx+2gacfT/u25gPW
	 CfA2ZKvh6TiukvTS/DJqKJuPYx7RXNDcEzBDE24V5OmxeneVc+LWDi9WxnCEL7QGoB
	 Oj30PCKsjroReFVXxejCy7JLQ4TDHbpqfFiYYRPk=
Received: from [100.100.57.219] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 966A2600D4;
	Tue, 30 Aug 2022 10:54:55 +0800 (CST)
Message-ID: <6563ce1b-7637-3402-be54-0e7acf4f86ca@xen0n.name>
Date: Tue, 30 Aug 2022 10:54:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0)
 Gecko/20100101 Thunderbird/106.0a1
Subject: Re: [PATCH v2] checksyscalls: Ignore fstat to silence build warning
 on LoongArch
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1661827800-8463-1-git-send-email-yangtiezhu@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <1661827800-8463-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/30 10:50, Tiezhu Yang wrote:
> fstat is replaced by statx on the new architecture, so an exception
> is added to the checksyscalls script to silence the following build
> warning on LoongArch:
> 
>    CALL    scripts/checksyscalls.sh
> <stdin>:569:2: warning: #warning syscall fstat not implemented [-Wcpp]
> 
> Suggested-by: WANG Xuerui <kernel@xen0n.name>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> Hi Xuerui and Arnd,
> 
> Thank you for your reviews and suggestions.
> 
> v2:
>    -- Change scripts/checksyscalls.sh
>    -- Modify patch subject and commit message
> 
>   scripts/checksyscalls.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index f33e61a..c0a093c 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -114,7 +114,6 @@ cat << EOF
>   #define __IGNORE_truncate
>   #define __IGNORE_stat
>   #define __IGNORE_lstat
> -#define __IGNORE_fstat
>   #define __IGNORE_fcntl
>   #define __IGNORE_fadvise64
>   #define __IGNORE_newfstatat
> @@ -253,6 +252,7 @@ cat << EOF
>   #define __IGNORE_vserver
>   
>   /* 64-bit ports never needed these, and new 32-bit ports can use statx */
> +#define __IGNORE_fstat

This should not belong here, because some 64-bit ports apparently need 
fstat. Instead it should be its own block with some explanation like 
"Newer ports are not required to provide fstat in favor of statx".

>   #define __IGNORE_fstat64
>   #define __IGNORE_fstatat64
>   EOF

Otherwise LGTM, thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

