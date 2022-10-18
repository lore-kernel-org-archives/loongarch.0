Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E44A24
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666096064; bh=GL+rlXoOxGmGApSv3L9SAXqNdDYDUffuAVXsj7dTPI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q39rCzmJDf0frLXFRDkDji03DUoyRapZULiPBo3S919f4p94iuxbswBSqDhGzKHuf
	 D5f8UahmxpXkRnooTdVK8Kub/Jmt14jSOAXTVSnKF64sBX6iFs/UtMJ6rpdoy6hdzD
	 rJpKIRk2vyzdaBneAZZLrpVVi3/xldO2LhK7X8Wg=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CF84D6011C;
	Tue, 18 Oct 2022 20:27:43 +0800 (CST)
Message-ID: <59b75b38-8995-ea54-b5cf-eca78249b65e@xen0n.name>
Date: Tue, 18 Oct 2022 20:27:43 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH] LoongArch: use flexible-array member instead of
 zero-length array
Content-Language: en-US
To: zys.zljxml@gmail.com, chenhuacai@kernel.org
Cc: oleg@redhat.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 chenhuacai@loongson.cn, lixuefeng@loongson.cn, yangtiezhu@loongson.cn,
 Yushan Zhou <katrinzhou@tencent.com>
References: <20221018094742.324576-1-zys.zljxml@gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20221018094742.324576-1-zys.zljxml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/18 17:47, zys.zljxml@gmail.com wrote:
> From: Yushan Zhou <katrinzhou@tencent.com>
> 
> Eliminate the following coccicheck warning:
> ./arch/loongarch/include/asm/ptrace.h:32:15-21: WARNING use flexible-array member instead
> 
> Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
> ---
>   arch/loongarch/include/asm/ptrace.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
> index 17838c6b7ccd..7437b9366c3b 100644
> --- a/arch/loongarch/include/asm/ptrace.h
> +++ b/arch/loongarch/include/asm/ptrace.h
> @@ -29,7 +29,7 @@ struct pt_regs {
>   	unsigned long csr_euen;
>   	unsigned long csr_ecfg;
>   	unsigned long csr_estat;
> -	unsigned long __last[0];
> +	unsigned long __last[];
>   } __aligned(8);
>   
>   static inline int regs_irqs_disabled(struct pt_regs *regs)

Seems good. Thanks.

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

