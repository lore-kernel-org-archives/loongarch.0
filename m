Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC79C7B
	for <loongarch@lists.linux.dev>; Sat, 18 Jun 2022 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1655556654; bh=IXkz4yFfHv4KGGQdolooZQBRBBDkTchZCc0yfNdHTm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P6/h6W3tZEp+WXvDCsXHYbt1HSkroSs+DEs+PZFFnr4qX6zV+rCZVGkFKXQ42Prpu
	 LwY9GILZGG/q+o2uEMq3zqIDlyKQG1UGVCs5WhBOKSeZhtYR1FwVUtDtmYswcXizNM
	 Eb1aNPz9l4OGq/0CnHZoasOk8hJ0rncTPC3jPUNA=
Received: from [192.168.9.172] (unknown [101.88.28.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 81932600B5;
	Sat, 18 Jun 2022 20:50:54 +0800 (CST)
Message-ID: <bcc38a55-30dc-98a8-cbfc-5a51924b9373@xen0n.name>
Date: Sat, 18 Jun 2022 20:50:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0a1
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
 <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/22 01:45, Guo Ren wrote:
>
>> I see that the qspinlock() code actually calls a 'relaxed' version of xchg16(),
>> but you only implement the one with the full barrier. Is it possible to
>> directly provide a relaxed version that has something less than the
>> __WEAK_LLSC_MB?
> I am also curious that __WEAK_LLSC_MB is very magic. How does it
> prevent preceded accesses from happening after sc for a strong
> cmpxchg?
>
> #define __cmpxchg_asm(ld, st, m, old, new)                              \
> ({                                                                      \
>          __typeof(old) __ret;                                            \
>                                                                          \
>          __asm__ __volatile__(                                           \
>          "1:     " ld "  %0, %2          # __cmpxchg_asm \n"             \
>          "       bne     %0, %z3, 2f                     \n"             \
>          "       or      $t0, %z4, $zero                 \n"             \
>          "       " st "  $t0, %1                         \n"             \
>          "       beq     $zero, $t0, 1b                  \n"             \
>          "2:                                             \n"             \
>          __WEAK_LLSC_MB                                                  \
>
> And its __smp_mb__xxx are just defined as a compiler barrier()?
> #define __smp_mb__before_atomic()       barrier()
> #define __smp_mb__after_atomic()        barrier()
I know this one. There is only one type of barrier defined in the v1.00 
of LoongArch, that is the full barrier, but this is going to change. 
Huacai hinted in the bringup patchset that 3A6000 and later models would 
have finer-grained barriers. So these indeed could be relaxed in the 
future, just that Huacai has to wait for their embargo to expire.
