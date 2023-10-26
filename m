Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6E38FA0
	for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="K4auNB9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1698343634;
	bh=/XdUvlNTO4zdDZMBAOycXXb/ghIDFkL5KXud5WJOJc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K4auNB9dGJnlskO2Zlz6XOvE90XuJNpL4S2HKXCG5Du14gafVhIS3wMyRL8NGp6X0
	 Oc9UuWh0KL6K1OEAuNCtXKMP7hLj4PsS9T+FC89krzyVtj1HsYJgZe4pLHsL+/ymvZ
	 V7nkW4CxZ+tHh/6+jIc/uhuXdw/hwtIo+obgqa4IbQhZwS3zg49xbEu/IXeLFrFsmY
	 v5Fcu+aXsIMjCf+sUPJ36WY9RxqQYqylTb2BqnPzXtZPGMu8lr7xZzDvzA6X3s86K3
	 Y9yNaLIaS6ngFOVdJKVeUu/QA7GEXopXnys6rECU8aez2xMPoZ4v3cUKADTFZplIUe
	 wZhkiQdA9xffA==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SGYfT6Y2Kz1ZZL;
	Thu, 26 Oct 2023 14:07:13 -0400 (EDT)
Message-ID: <0e0cbc68-2b4c-462d-aff4-abd795b3b63d@efficios.com>
Date: Thu, 26 Oct 2023 14:07:28 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] LoongArch: Add RSEQ_SIG break code definition
Content-Language: en-US
To: Huang Pei <huangpei@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231026114446.5932-1-huangpei@loongson.cn>
 <20231026114446.5932-2-huangpei@loongson.cn>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20231026114446.5932-2-huangpei@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-26 07:44, Huang Pei wrote:
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>   arch/loongarch/include/uapi/asm/break.h | 2 ++

Why is this part of the uapi ? None of the other architecture has this 
as part of uapi. It's only defined in the rseq selftest arch-specific 
header file.

Thanks,

Mathieu

>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/loongarch/include/uapi/asm/break.h b/arch/loongarch/include/uapi/asm/break.h
> index bb9b82ba59f2..e0fcfc304834 100644
> --- a/arch/loongarch/include/uapi/asm/break.h
> +++ b/arch/loongarch/include/uapi/asm/break.h
> @@ -20,4 +20,6 @@
>   #define BRK_UPROBE_BP		12	/* See <asm/uprobes.h> */
>   #define BRK_UPROBE_XOLBP	13	/* See <asm/uprobes.h> */
>   
> +#define BRK_RSEQ_SIG		16	/* See rseq */
> +
>   #endif /* __UAPI_ASM_BREAK_H */

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

