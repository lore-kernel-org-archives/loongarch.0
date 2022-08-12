Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B9366
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1660277831; bh=Nz7mdhwqOSY85+8rvkAEIhCwgUz6JHFCMUloRDpIWC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=llG96eE6kN61PTlb0rBPbf/P+pLIATAHKYfl5rzdL5y7UGV7qR+wATZhAsxfP6Ojb
	 mkeKWAlSnEeePZKjN6NghnQ0tdRrvjqmkiBPSwiwd247A5EV7sqekQ4U/wDVYsYhcB
	 RG5IQzCmOop308dh+s9VmhOD7gwkeVzE/LUGWvF0=
Received: from [100.100.35.250] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E065260074;
	Fri, 12 Aug 2022 12:17:10 +0800 (CST)
Message-ID: <e0dfe188-7530-68ac-d4ee-f19fbe359dd1@xen0n.name>
Date: Fri, 12 Aug 2022 12:17:10 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:105.0)
 Gecko/20100101 Thunderbird/105.0a1
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220811130301.2431582-1-chenhuacai@loongson.cn>
 <2d815c7c-6187-1b38-9185-04dc3a944bd3@xen0n.name>
 <CAAhV-H6iCzzyQoAhFiNsTLsuChVX-Py+YQ2MhC6z5ZtwKdm+Mg@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H6iCzzyQoAhFiNsTLsuChVX-Py+YQ2MhC6z5ZtwKdm+Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/12 10:33, Huacai Chen wrote:
> Hi, Xuerui,
> 
> On Fri, Aug 12, 2022 at 10:09 AM WANG Xuerui <kernel@xen0n.name> wrote:
>>
>> On 2022/8/11 21:03, Huacai Chen wrote:
>>> The kernel entry point of both boot-cpu and nonboot-cpu may be physical
>>> address from BootLoader (in DA mode or identity-mapping PG mode). So we
>>> should jump to the link address before PG enabled (DA is disabled at the
>>> same time) and just after DMW configured.
>>>
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>    arch/loongarch/kernel/head.S | 19 +++++++++++--------
>>>    1 file changed, 11 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
>>> index 7062cdf0e33e..c60eb66793e3 100644
>>> --- a/arch/loongarch/kernel/head.S
>>> +++ b/arch/loongarch/kernel/head.S
>>> @@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)                       # kernel entry point
>>>        csrwr           t0, LOONGARCH_CSR_DMWIN0
>>>        li.d            t0, CSR_DMW1_INIT       # CA, PLV0, 0x9000 xxxx xxxx xxxx
>>>        csrwr           t0, LOONGARCH_CSR_DMWIN1
>>> +
>>> +     /* We might not get launched at the address the kernel is linked to,
>>> +        so we jump there.  */
>>> +     la.abs          t0, 0f
>>> +     jr              t0
>>> +0:
>>
>> This seems to be reverting to an earlier behavior IIRC. Both ways work
>> on my 3A5000+7A1000+EDK2 combination.
>>
>> But, exactly because both ways work on the most typical case, would you
>> mind explaining the detailed scenario where the current approach fails,
>> so people have some more context both when reviewing and reading the
>> code some months/years later?
> In former firmware, nonboot-cpu entered the kernel with PG enabled,
> but it needed firmware to maintain a temporary page table which was
> unnecessary. Latest firmware let nonboot-cpu to enter kernel in DA
> mode.

Yeah exactly this. Now the change suddenly becomes a lot more reasonable 
and people get to learn the history. So please include this in v2; I'll 
touch the paragraph a little for you:

"With older firmware, non-boot CPUs started with PG enabled, but this 
needed firmware cooperation in the form of a temporary page table, which 
is deemed unnecessary. Latest firmware versions configure the non-boot 
CPUs to start in DA mode, so kernel-side changes are needed."

With the justification added:

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

