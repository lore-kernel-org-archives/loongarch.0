Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98B15A9
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 03:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1667790706; bh=5W2+OYbZzKuWbk7s3A6vE6u0ZUSPDFgop8cSBRIbGR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+DiudbngxPaT+lummge0BUd9zSM1O1uhQzOgjC4QQ7gAD/Q265GMTiLGe0F9f5dU
	 HkOhjZau6msCl6LbdqwyvyGbMbvLF6nrAeAGTSBzcUWYsrNE5mHlJLP4zlVIXghFNW
	 IkcJ3efVVz+6MhAK5uDn+RQvfX6b8Z4d2hNQP3/w=
Received: from [100.100.35.204] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4ADF260094;
	Mon,  7 Nov 2022 11:11:45 +0800 (CST)
Message-ID: <30fab7b2-a990-a585-5030-cafecf8e48dc@xen0n.name>
Date: Mon, 7 Nov 2022 11:11:44 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:108.0)
 Gecko/20100101 Thunderbird/108.0a1
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <ac5f393a-be3c-3cd2-4738-b0537bc6e84e@xen0n.name>
 <95a90f588b9193ee0f9895fbf238828a3dbbe958.camel@xry111.site>
 <d0a94b87-c319-e004-c456-444a24ddac27@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <d0a94b87-c319-e004-c456-444a24ddac27@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/11/7 10:59, Binbin Zhou wrote:
> Hi Ruoyao:
> 
> 在 2022/11/6 18:15, Xi Ruoyao 写道:
>> On Sun, 2022-11-06 at 17:15 +0800, WANG Xuerui wrote:
>>> And, although we're already aware of the part-UEFI and part-FDT usage
>>> pattern, and the arch UEFI code already has consideration for such, it
>>> still makes me a bit wary because you risk losing standards compliance
>>> and creating maintenance burden for admins/users/devs alike by relying
>>> on this not-really-UEFI-but-advertising-as-such thing. I'd still suggest
>>> you try throwing together something fully DT, to at least experiment a
>>> little with. You already have to rewrite pretty much everything with all
>>> the boot protocol changes in the past few months, so this would probably
>>> not even hurt, and the burden on the LoongArch/generic UEFI infra could
>>> be lessened even further if this plays out. And you can always continue
>>> working on this change if it turns out infeasible to do so.
>>
>> AFAIK using UEFI with FDT (instead of ACPI) is fully allowed and
>> documented by the standard (section 4.6.1.3 of the UEFI spec).  It may
>> be not possible or not worthy to implement ACPI for 2K systems, then FDT
>> will be the only choice.
>>
>> In ARM64 ecosystem, SBBR (for server) demands UEFI+ACPI, EBBR (for
>> embedded) allows UEFI+ACPI or UEFI+FDT.

Ah I see. My bad for not reading the spec in enough detail...

>>
> 
> Yes, I agree with you.
> 
> Theoretically, we have four combinations: EFI+ACPI, EFI+FDT, 
> non-EFI+ACPI,non-EFI+FDT.
> 
> Now, for LoongArch, EFI+ACPI has been used on Loongson-3, and 
> Loongson-2K being an embedded product, EFI+FDT is a more suitable way. 
> They are both relatively independent. So I don't see this as a violation 
> of standards compliance, nor does it add to the maintenance burden.

Yeah I now see the reason why it's acceptable. Then, I'm only suggesting 
you to try formulating the changes and commit message, in a way that 
doesn't leave people with the false impression that Loongson-3 is 
somehow strongly bound with EFI+ACPI and Loongson-2 with EFI+FDT, 
despite the typical capabilities of such systems.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

