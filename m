Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFA539D
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681985668; bh=br/7Gkn+A/5g5SY6z1icD75jzW0ja+DkMNxdyMu6Djk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iaMEx/W9uZrAI4brdNvh3IuhxitwW9ztLPXZ4D32TzwzJhuK1c2wdWZmrM1bYTQoY
	 m4BgG0Wv6nvo+EZkRBoGqUPf7OHpHT1W3AgR8u0IIq4tJ9y6yNpk8Lfop+rWJbooYd
	 TD0RM+1ytyxvP3xVRWZeDfvgYE93Dd5XP3gw9VkU=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4064E600DA;
	Thu, 20 Apr 2023 18:14:28 +0800 (CST)
Message-ID: <bfe26d72-7e4d-f90b-5161-b2760d59e0e7@xen0n.name>
Date: Thu, 20 Apr 2023 18:14:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 00/12] LoongArch: Better backtraces
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20230416060356.3711529-1-kernel@xen0n.name>
 <CAAhV-H58qSNsx7jNiUmQFT6sScwxaMJT23FUiJdsXNF5Gt1+HA@mail.gmail.com>
 <4bd9b28f-efa8-9503-7fde-082930a4c93f@xen0n.name>
 <CAAhV-H68j9VS2worCpVSXZA1ZM-Xene4YEXM6UmjPhmYqnE6CA@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H68j9VS2worCpVSXZA1ZM-Xene4YEXM6UmjPhmYqnE6CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/4/20 17:52, Huacai Chen wrote:
> On Thu, Apr 20, 2023 at 5:43 PM WANG Xuerui <kernel@xen0n.name> wrote:
>>
>> On 2023/4/20 16:34, Huacai Chen wrote:
>>> On Sun, Apr 16, 2023 at 2:04 PM WANG Xuerui <kernel@xen0n.name> wrote:
>>>>
>>>> <snip>
>>>>
>>>> WANG Xuerui (12):
>>>>     LoongArch: Clean up the architectural interrupt definitions
>>>>     LoongArch: Add exception subcode definitions for the watchpoint
>>>>       exception
>>>>     LoongArch: Print GPRs with ABI names when showing registers
>>>>     LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode
>>>>       contexts
>>>>     LoongArch: Fix format of CSR lines during show_regs
>>>>     LoongArch: Humanize the CRMD line when showing registers
>>>>     LoongArch: Humanize the PRMD line when showing registers
>>>>     LoongArch: Humanize the EUEN line when showing registers
>>>>     LoongArch: Humanize the ECFG line when showing registers
>>>>     LoongArch: Humanize the ESTAT line when showing registers
>>> I think Patch6~10 can be combined in a single patch.
>>
>> It seems we have different opinions over "what constitutes a logical
>> change" ;-)
>>
>> IMO having more granular changes helps reviews. People's time is more
>> often than not fragmented these days, and I bet you'd prefer reviewing 5
>> small commits than 1 big hairy commit anyway.
> No, I don't like "too small" patches, and I still don't like 3
> register per line (even for E-mail clients, short lines will overflow
> after several replies).

Development and maintenance is not about satisfying one particular 
person's preferences alone. On one hand I have opinions on many of the 
current coding style in arch/loongarch, but I've given my R-b's 
nevertheless; on the other hand, IMO we can't expect arch/loongarch to 
have the same level of <3 as other arches like arm64 or riscv, so we 
should structure our code and Git commits in a way that's easier for 
people not familiar with LoongArch to grasp. This implies that granular 
changes won't hurt, IMO.

As for how many registers per line, even if we don't consider email 
clients, there are also terminals, editors, online web forms, git commit 
messages, and countless other scenarios where overly long lines could 
hamper readability. I took my inspiration from arch/riscv and while they 
haven't written the rationale down, I believe it's the same reasoning 
that have lead them to the same result, i.e. 3 registers per line.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

