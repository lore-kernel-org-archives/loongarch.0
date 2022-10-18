Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E91FAF
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666080568; bh=qdvFsQ/lCWl0sUbt75T+DP3VwTt8nZuoicBEZ3m6IBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oe6D8dWNwzZes1JZTzieYLLrmx6jyC1gICh0elTn+Kupq1hl47is6BnlOHPbgm5cF
	 HOUI+baX1le6HsjVaydsvI/o3xo6piPMlIU5qA5QIQzI4phNQzu+ThqsWUUPuJmVeg
	 t02b5hRgBP59KvDv6COVMYVGOwQmm1lW97hvdQk8=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D4856600A9;
	Tue, 18 Oct 2022 16:09:27 +0800 (CST)
Message-ID: <e58d7c6d-cf8a-017b-7e72-6ae579ce6be2@xen0n.name>
Date: Tue, 18 Oct 2022 16:09:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH V2] LoongArch: Add unaligned access support
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Huacai Chen' <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20221017022330.2383060-1-chenhuacai@loongson.cn>
 <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
 <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
 <c34a277a-1735-65e6-c97d-fcc2ac3d57e6@xen0n.name>
 <CAAhV-H5y5wz0VzFEHrkDpap4wczWXBn_ibL3LW_JQyYkMzjDXQ@mail.gmail.com>
 <cbbc32d4bb0f445197eb5d84d796595c@AcuMS.aculab.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <cbbc32d4bb0f445197eb5d84d796595c@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/18 15:48, David Laight wrote:
> From: Huacai Chen
>> Sent: 18 October 2022 08:33
> ...
>>> What about my more structured approach in another reply that avoids the
>>> huge else-if conditions? Both the terrible line wraps and codegen could
>>> be avoided.
> ...
>> OK, let me try.
> 
> I suspect you can mask out some 'operand size' bits from the
> instructions - instead of checking each opcode.

Technically LoongArch instruction formats don't contain any "operand 
size bit", because most current opcodes seem to be simply sequentially 
allocated. While there seem to exist a certain pattern in e.g. encodings 
of {LD,ST,FLD,FST}.{B,H,W,D}, I believe it's just coincidence (e.g. bits 
23:22 of those instructions seem to represent "B/H/W/D"; but other 
instructions clearly don't follow such a pattern, not even the 
{LD,ST}.{BU,HU,WU} ones).

For now I'd personally prefer readability and maintainability over 
performance, because traps are already expensive enough that 
optimizations like this don't really matter.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

