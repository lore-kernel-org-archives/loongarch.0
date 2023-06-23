Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0192D524;
	Fri, 23 Jun 2023 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687540020; bh=kjKd/MMfTv+/haFGlQ1tj3Dy+jsmWNlUJXETIqambKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=grz78a/jWVbCtEPL2kmt6niKVZO1tfgCOiy/8eI1pw17B1+cMMsWYrtjaZHsmiHpm
	 Rv1exG6vZ153foM5WNMfVr2qgBjnqfk6oXVIBH9oIA5JWdx2rheyKZ2SZM25DYukQH
	 DosCLAAzTMhln6xLeChZVychPMi2FwpVJR6eBOVo=
Received: from [192.168.9.172] (unknown [101.88.25.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0E467600A9;
	Sat, 24 Jun 2023 01:07:00 +0800 (CST)
Message-ID: <64955942-274c-047d-aab3-308fbbe6dfbc@xen0n.name>
Date: Sat, 24 Jun 2023 01:06:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/9] LoongArch: Tweak CFLAGS for Clang compatibility
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, loongarch@lists.linux.dev,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
References: <20230623134351.1898379-1-kernel@xen0n.name>
 <20230623134351.1898379-8-kernel@xen0n.name>
 <22d794613f70b04544e39e8861737af09365ae8a.camel@xry111.site>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <22d794613f70b04544e39e8861737af09365ae8a.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/23 01:00, Xi Ruoyao wrote:
> On Fri, 2023-06-23 at 21:43 +0800, WANG Xuerui wrote:
>
>> -cflags-y                       += -G0 -pipe -msoft-float
> -msoft-float should not be removed.  Our consensus (made when I was
> developing https://gcc.gnu.org/r13-6500) is -mabi=lp64s does *not*
> disable floating point instructions, but only disable FPRs for passing
> arguments and return values.  So w/o -msoft-float (or -mfpu=none) GCC is
> allowed to generate FP instructions everywhere in kernel and it may
> cause kernel FPD exception in the future.
Hmm, now I remember (still vaguely) about the discussion... I'll have to 
check how to minimize churn around FPU-touching code though if 
-msoft-float is to be kept.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

