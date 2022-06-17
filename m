Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E82F25
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1655466563; bh=ZcFXdbACSotptEVKQ9/57LQ/5OP1aBlnMlqLFSZcND4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dUm+w6YSbYi8/+ZqbkFOfxQ7QA/SJFX/fZR9fs2rmPPkEhCx56RkrlbvHo9O8uCnw
	 cGqUqhpO+TCbIeX2s43sgQLjKPCXFY1OHAnm7k7he59iKjnmnmqzLJ9Qc69pw8OC2X
	 nL+ZJ7pb2rYwAZbrKoxOIfHCIJR580SbUWTyXtD0=
Received: from [100.100.57.190] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CAC24600FF;
	Fri, 17 Jun 2022 19:49:22 +0800 (CST)
Message-ID: <ff1edf29-8b69-29fc-5ccd-26a6d6ef8bb9@xen0n.name>
Date: Fri, 17 Jun 2022 19:49:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:103.0)
 Gecko/20100101 Thunderbird/103.0a1
Subject: Re: [PATCH v3 1/2] docs/LoongArch: Fix notes rendering by using reST
 directives
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc: Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev,
 WANG Xuerui <git@xen0n.name>
References: <cover.1655463225.git.siyanteng@loongson.cn>
 <2da9b19588cfa20c3797015ea3ce6831b3a7fa2b.1655463225.git.siyanteng@loongson.cn>
 <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/6/17 19:05, Huacai Chen wrote:
> Hi, Yanteng,
>
> On Fri, Jun 17, 2022 at 6:55 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> "Note" is an admonition, but it doesn't render
>> correctly, let's fix it by using reST directives.
> I think "but it doesn't render correctly" should be "but it isn't
> correctly rendered in HTML". How do you think, Xuerui?
This depends on what you mean by "correctly"; actually the original 
rendering is readable, only that it's not rendered with a "note" block. 
Maybe just "Notes are better expressed with reST admonitions."?
>
> Huacai
>> Fixes: 0ea8ce61cb2c ("Documentation: LoongArch: Add basic documentations")
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> Reviewed-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   Documentation/loongarch/introduction.rst   | 15 +++++++++------
>>   Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
>>   2 files changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
>> index 2bf40ad370df..216b3f390e80 100644
>> --- a/Documentation/loongarch/introduction.rst
>> +++ b/Documentation/loongarch/introduction.rst
>> @@ -45,10 +45,12 @@ Name              Alias           Usage               Preserved
>>   ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
>>   ================= =============== =================== ============
>>
>> -Note: The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
>> -kernel for storing the percpu base address. It normally has no ABI name, but is
>> -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in some old code,
>> -however they are deprecated aliases of ``$a0`` and ``$a1`` respectively.
>> +.. Note::
>> +    The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
>> +    kernel for storing the percpu base address. It normally has no ABI name,
>> +    but is called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1``
>> +    in some old code,however they are deprecated aliases of ``$a0`` and ``$a1``
>> +    respectively.
>>
>>   FPRs
>>   ----
>> @@ -69,8 +71,9 @@ Name              Alias              Usage               Preserved
>>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
>>   ================= ================== =================== ============
>>
>> -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however they are deprecated
>> -aliases of ``$fa0`` and ``$fa1`` respectively.
>> +.. Note::
>> +    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
>> +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
>>
>>   VRs
>>   ----
>> diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/loongarch/irq-chip-model.rst
>> index 8d88f7ab2e5e..7988f4192363 100644
>> --- a/Documentation/loongarch/irq-chip-model.rst
>> +++ b/Documentation/loongarch/irq-chip-model.rst
>> @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
>>
>>     https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (in English)
>>
>> -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
>> -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is "Legacy I/O
>> -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor Reference
>> -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
>> -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is "HyperTransport
>> -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor Reference
>> -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
>> -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" described in
>> -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
>> +.. Note::
>> +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
>> +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
>> +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - HTVECINTC is "HyperTransport Interrupts" described in Section 14.3 of
>> +      "Loongson 3A5000 Processor Reference Manual";
>> +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
>> +      "Loongson 7A1000 Bridge User Manual";
>> +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
>> +      "Loongson 7A1000 Bridge User Manual".
>> --
>> 2.27.0
>>
