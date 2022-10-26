Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5510FB
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666776074; bh=VUxXyqeqC9xJjU4/DUbIIcNzYJ6jIKRvBSz+ajHq9TM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vc2yQ/lR3CL1OdYJDVQzTwx5zRyjkJbojVYujWgQAF2jxlGSbz7/+Ce9XeeIb0deu
	 38HdpCujrA9ljRgnbUvkNtOhHDwBxYeFhynaynJb9Cq8nga9Z7BJh974gcbh/VFq5q
	 4aqUXK4FuOmupXtLcGCPAQiyHSHx686gLsXZrVgo=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 769AC6008C;
	Wed, 26 Oct 2022 17:21:14 +0800 (CST)
Message-ID: <edb4002c-3325-53b2-de79-ad4033b363f7@xen0n.name>
Date: Wed, 26 Oct 2022 17:21:14 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:108.0)
 Gecko/20100101 Thunderbird/108.0a1
Subject: Re: [PATCH] LoongArch: Fix memsection size
Content-Language: en-US
To: Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20221026075638.9396-1-lvjianmin@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20221026075638.9396-1-lvjianmin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/26 15:56, Jianmin Lv wrote:
> On LoongArch, the physical address space ranging from 0 to 0xfffffff is
> always memory, which is in the low half of the memsection range from 0 to
> 0x1fffffff with 512M memsection size, and the high half will be a hole with
> invalid memory pages.

The description is incorrect. For systems with less than 512MiB of 
memory for example, I believe not every address from 0x0 to 0x0fff_ffff 
is valid; and regarding the latter part of the sentence, what you mean 
by "invalid memory pages"...

> 
> This situation may cause some issues. For example, the range of 0x10000000
> to 0x1fffffff is io registers, which will be considered as valid memory range
> since which is in the memsection of range of 0 to 0x1fffffff. During S3

... turns out to be totally valid, only of the I/O kind. (This might be 
a case of Chinglish that is actually conveying the incorrect meaning to 
unaware readers.)

> sleep and resume, these io registers will be saved and restored as valid memory
> page (pfn_valid() of common version considers that all pages in a memsection
> are valid), which will cause exception, especially when restoring during resume.
> 
> We can use 256M size for memsection of LoongArch, or use the way as ARM64 to
> walk through all memory memblock to check if a mem pfn is valid which maybe
> lower performance. For simplicity, this patch just use the former way.

And the rest of the commit message is, unfortunately, a bit too verbose 
and hard to understand in general. I have to look at the actual change 
(luckily, a one-liner in this case) to confirm my understanding.

I think your intent is just to *avoid stepping into IO memory region 
during suspend/resume by reducing the section size order by one*. Try 
reducing the verbosity of the commit message in v2? I can't proofread 
and edit every commit due to limited time, so you have to practice and 
improve your writing skills after all. I'll review that piece of text 
afterwards. :)

> 
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> 
> diff --git a/arch/loongarch/include/asm/sparsemem.h b/arch/loongarch/include/asm/sparsemem.h
> index 3d18cdf1b069..05903b40a625 100644
> --- a/arch/loongarch/include/asm/sparsemem.h
> +++ b/arch/loongarch/include/asm/sparsemem.h
> @@ -8,7 +8,7 @@
>    * SECTION_SIZE_BITS		2^N: how big each section will be
>    * MAX_PHYSMEM_BITS		2^N: how much memory we can have in that space
>    */
> -#define SECTION_SIZE_BITS	29 /* 2^29 = Largest Huge Page Size */
> +#define SECTION_SIZE_BITS	28
>   #define MAX_PHYSMEM_BITS	48
>   
>   #endif /* CONFIG_SPARSEMEM */

The change is trivial indeed but I'm not immediately giving the R-b.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

