Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA49805
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658837069; bh=yvyS5vAqRZUVDqPyWNTeToecCllMh73N5UHq9Iu/bMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LAfj+efbQf20yZ3IxF+C+FVjgRR//FAErzCzRAe05loHItjF+OFDm98K+76RtYRSP
	 mpTfrfVDYIfeUYPZKDoNcPPOYAbpEYNwmmyBat2uu2y7li/4LyCl5g6wy9XhsGoaug
	 2byC3XTXxown9w1hqbNCjd+IDREr0kBPzYjKp3hc=
Received: from [100.100.35.250] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7240260610;
	Tue, 26 Jul 2022 20:04:29 +0800 (CST)
Message-ID: <c66f2dd8-a437-092d-0f7a-b05805cd5d23@xen0n.name>
Date: Tue, 26 Jul 2022 20:04:29 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0)
 Gecko/20100101 Thunderbird/104.0a1
Subject: Re: [PATCH 3/4] LoongArch: Prefer BEQZ over "BEQ foo, zero" where
 applicable
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20220724133052.1872885-1-kernel@xen0n.name>
 <20220724133052.1872885-4-kernel@xen0n.name>
 <d4ea44fc-1b8b-ca0b-213a-4dcdd9beb016@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <d4ea44fc-1b8b-ca0b-213a-4dcdd9beb016@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/7/26 19:56, Jinyang He wrote:
> On 07/24/2022 09:30 PM, WANG Xuerui wrote:
> 
>> From: WANG Xuerui <git@xen0n.name>
>>
>> While BEQZ and BEQ are different instructions, and the vastly expanded
>> range for branch destination does not really matter in the few cases
>> touched, use the BEQZ where possible for shorter lines and better
>> consistency (some places used "BEQ foo, zero" while some used "BEQ zero,
>> foo").
>>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   arch/loongarch/include/asm/atomic.h  | 8 ++++----
>>   arch/loongarch/include/asm/cmpxchg.h | 2 +-
>>   arch/loongarch/include/asm/futex.h   | 4 ++--
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/atomic.h 
>> b/arch/loongarch/include/asm/atomic.h
>> index a0a33ee793d6..0869bec2c937 100644
>> --- a/arch/loongarch/include/asm/atomic.h
>> +++ b/arch/loongarch/include/asm/atomic.h
>> @@ -160,7 +160,7 @@ static inline int arch_atomic_sub_if_positive(int 
>> i, atomic_t *v)
>>           "    move    %1, %0                    \n"
>>           "    blt    %0, $zero, 2f                \n"
>>           "    sc.w    %1, %2                    \n"
>> -        "    beq    $zero, %1, 1b                \n"
>> +        "    beqz    %1, 1b                    \n"
>>           "2:                            \n"
>>           __WEAK_LLSC_MB
>>           : "=&r" (result), "=&r" (temp),
>> @@ -173,7 +173,7 @@ static inline int arch_atomic_sub_if_positive(int 
>> i, atomic_t *v)
>>           "    move    %1, %0                    \n"
>>           "    blt    %0, $zero, 2f                \n"
>>           "    sc.w    %1, %2                    \n"
>> -        "    beq    $zero, %1, 1b                \n"
>> +        "    beqz    %1, 1b                    \n"
>>           "2:                            \n"
>>           __WEAK_LLSC_MB
>>           : "=&r" (result), "=&r" (temp),
>> @@ -323,7 +323,7 @@ static inline long 
>> arch_atomic64_sub_if_positive(long i, atomic64_t *v)
>>           "    move    %1, %0                    \n"
>>           "    blt    %0, $zero, 2f                \n"
> Hi, Xuerui,
> 
> As you said in [PATCH4/4], the syntactic sugars named 'b[lt,le,gt,gz]z'
> have been supported, too. Could we do a deep clean work about this?
> Although they just are macros and have same range of destination, they
> shorten lines and make better consistency as 'b[eq,ne]z' do. :-)

Fair enough, let me try.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

