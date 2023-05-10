Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D949811
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1683711275; bh=CVCNr+jiCPA9b+x0610c9UfH/6p5CPr9D1Yj681oIcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HxkXA9XPuRLHE/D3W2hj/JAI8D5u3GtMSwd65oBRjmoscxxo8G6e1ZomdRhVk+C+B
	 dY7CwJH+NAIkL1y6WKINQhtUUffDkKB+Tz+n8jGuEwIQEgAdW9RaxmaSMMPG4NAooq
	 Z8HEk/JVknqNUGJoj4132JZcc5vWyL+/rRDt2NxM=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7BDC96014E;
	Wed, 10 May 2023 17:34:34 +0800 (CST)
Message-ID: <15594820-0a95-94bb-132f-5008d31c041f@xen0n.name>
Date: Wed, 10 May 2023 17:34:33 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>,
 Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Zhangjin Wu <falcon@tinylab.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <20230510092723.GK4253@hirez.programming.kicks-ass.net>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230510092723.GK4253@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter,

My 2 cents:

On 2023/5/10 17:27, Peter Zijlstra wrote:
> On Wed, May 10, 2023 at 05:16:46PM +0800, Youling Tang wrote:
>> Add jump-label implementation based on the ARM64 version.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> 
>> <snip>
>>
>> +	if (type == JUMP_LABEL_JMP)
>> +		insn = larch_insn_gen_b(jump_entry_code(entry), jump_entry_target(entry));
>> +	else
>> +		insn = larch_insn_gen_nop();
>> +
>> +	larch_insn_patch_text(addr, insn);
>> +}
> 
> This all implies Loongarch is fine with the nop<->b transition (much
> like arm64 is), but I found no actual mention of what transitions are
> valid for the architecture in your inst.c file -- perhaps you could put
> a small comment there to elucidate the occasional reader that doesn't
> have your arch manual memorized?

Do you mean by "valid transition" something like "what kind of 
self-modification is architecturally sound, taking ICache / 
micro-architecture behavior etc. into consideration"? If so, I'd say 
things would be fine in LoongArch as long as an instruction fetch 
barrier is used. Maybe Youling can confirm and mention this in the next 
revision.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

